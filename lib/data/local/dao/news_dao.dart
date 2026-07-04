import 'package:drift/drift.dart';
import 'package:news_app/data/local/mappers/news_mapper.dart';
import 'package:news_app/data/local/news_database.dart';
import 'package:news_app/data/local/tables/news_cache.dart';
import 'package:news_app/domain/models/news.dart';

part 'news_dao.g.dart';

@DriftAccessor(tables: [NewsCache])
class NewsDao extends DatabaseAccessor<NewsDatabase> with _$NewsDaoMixin {
  NewsDao(super.attachedDatabase);

  Future<void> cacheNewsBatch(List<News> articles) async {
    final companions = articles.map((article) {
      return NewsCacheCompanion(
        url: Value(article.url),
        title: Value(article.title),
        description: Value(article.description),
        urlToImage: Value(article.urlToImage),
        content: Value(article.content),
        publishedAt: Value(article.publishedAt),
        isSaved: const Value.absent(),
      );
    }).toList();

    await batch((batch) {
      batch.insertAllOnConflictUpdate(newsCache, companions);
    });
  }

  Stream<List<News>> watchCachedNews() {
    final query = select(newsCache)
      ..orderBy([
        (t) => OrderingTerm(expression: t.publishedAt, mode: OrderingMode.desc)
    ]);

    return query.watch().map((rows) => rows.map((row) => row.toNews()).toList());
  }

  Stream<List<News>> watchSavedNews() {
    final query = select(newsCache)..where((t) => t.isSaved.equals(true))
      ..orderBy([
        (t) => OrderingTerm(expression: t.publishedAt, mode: OrderingMode.desc)
      ]);

    return query.watch().map((rows) => rows.map((row) => row.toNews()).toList());
  }
  
  Future<List<News>> getCachedNews() async {
    final query = select(newsCache)
      ..orderBy([
        (t) => OrderingTerm(expression: t.publishedAt, mode: OrderingMode.desc)
      ]);

    final database = await query.get();

    return database.map((row) => row.toNews()).toList();
  }


  Future<List<News>> getSavedNews() async {
    final query = select(newsCache)..where((t) => t.isSaved.equals(true))
      ..orderBy([
        (t) => OrderingTerm(expression: t.publishedAt, mode: OrderingMode.desc)
    ]);

    final savedNewsData = await query.get();

    return savedNewsData.map((row) => row.toNews()).toList();
  }

  Future<void> clearNewsCache() async {
    await (delete(newsCache)..where((t) => t.isSaved.equals(false))).go();
  }

  Future<void> toggleSaveStatus(String url, bool shouldSave) async {
    await (update(newsCache)..where((t) => t.url.equals(url)))
        .write(NewsCacheCompanion(isSaved: Value(shouldSave)));
  }
}