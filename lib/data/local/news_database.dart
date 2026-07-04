import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:news_app/data/local/dao/news_dao.dart';
import 'package:news_app/data/local/tables/news_cache.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'news_database.g.dart';

const String _dbFileName = 'news.db';

@DriftDatabase(tables: [NewsCache], daos: [NewsDao])
class NewsDatabase extends _$NewsDatabase {
  NewsDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 2;

  @override
  Future<void> close() async {
    await super.close();
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade:(m, from, to) async {
        if (from < 2) {
          await m.addColumn(newsCache, newsCache.isSaved);
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, _dbFileName));

    return NativeDatabase.createInBackground(file);
  });
}