import 'package:news_app/data/local/dao/news_dao.dart';
import 'package:news_app/domain/models/news.dart';
import 'package:news_app/data/remote/news_api_service.dart';
import 'package:news_app/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsApiService _apiService;
  final NewsDao _newsDao;

  const NewsRepositoryImpl({
    required NewsApiService apiService,
    required NewsDao newsDao
  }) : _apiService = apiService,
       _newsDao = newsDao;

  @override
  Stream<List<News>> watchTopHeadLines() {
    return _newsDao.watchCachedNews();
  }

  @override
  Stream<List<News>> watchSavedNews() {
    return _newsDao.watchSavedNews();
  }

  @override
  Future<void> refreshTopHeadLines() async {
    final DateTime lastweek = DateTime.now().subtract(const Duration(days: 7));

    final String formattedDate = 
        "${lastweek.year}-${lastweek.month.toString().padLeft(2, '0')}-${lastweek.day.toString().padLeft(2, '0')}";

    try {
      final List<News> remoteNews = await _apiService.fetchNews(
        query: 'tesla', 
        fromDate: formattedDate,
      );

      if (remoteNews.isNotEmpty) {
        await _newsDao.clearNewsCache();
        await _newsDao.cacheNewsBatch(remoteNews);
      }
    } on OfflineException {
      await _checkCacheFallbackCacheOrRethrow(OfflineException());
    } on ServerException {
      await _checkCacheFallbackCacheOrRethrow(ServerException());
    }
  }

  Future<List<News>> _checkCacheFallbackCacheOrRethrow(Object originalException) async {
    final cachedNews = await _newsDao.getCachedNews();
    if (cachedNews.isNotEmpty) {
      return cachedNews;
    }

    throw originalException;
  }

  @override
  Future<List<News>> getSavedNews() async {
    return await _newsDao.getSavedNews();
  }

  @override
  Future<void> toggleSaveStatus(String url, bool isSaved) async {
    await _newsDao.toggleSaveStatus(url, isSaved);
  }
}