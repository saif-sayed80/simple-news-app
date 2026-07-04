// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_dao.dart';

// ignore_for_file: type=lint
mixin _$NewsDaoMixin on DatabaseAccessor<NewsDatabase> {
  $NewsCacheTable get newsCache => attachedDatabase.newsCache;
  NewsDaoManager get managers => NewsDaoManager(this);
}

class NewsDaoManager {
  final _$NewsDaoMixin _db;
  NewsDaoManager(this._db);
  $$NewsCacheTableTableManager get newsCache =>
      $$NewsCacheTableTableManager(_db.attachedDatabase, _db.newsCache);
}
