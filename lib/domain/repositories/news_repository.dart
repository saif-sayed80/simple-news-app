import 'package:news_app/domain/models/news.dart';

abstract class NewsRepository {
                                    //to skip network calls when updating bookmarks.
  Stream<List<News>> watchTopHeadLines();
  Stream<List<News>> watchSavedNews();
  Future<void> refreshTopHeadLines();
  Future<List<News>> getSavedNews();
  Future<void> toggleSaveStatus(String url, bool isSaved);
}