import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/local/news_database.dart';
import 'package:news_app/data/repositories/news_repository_impl.dart';
import 'package:news_app/data/remote/news_api_service.dart';
import 'package:news_app/domain/repositories/news_repository.dart';
import 'package:news_app/presentation/bloc/news_feed_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/presentation/bloc/news_feed_event.dart';
import 'package:news_app/presentation/bloc/saved_news_bloc.dart';
import 'package:news_app/presentation/router/app_router.dart';

void main() {
  final database = NewsDatabase();
  final httpClient = http.Client();
  final apiService = NewsApiService(
    client: httpClient, 
    baseUrl: 'https://newsapi.org/v2', 
    apiKey: '62515290ff60404d827cb8bea4b3db1d'
  );

  final newsDao = database.newsDao;

  final newsRepository = NewsRepositoryImpl(
    apiService: apiService, 
    newsDao: newsDao
  );

  runApp(MyApp(newsRepository: newsRepository));
}

class MyApp extends StatelessWidget {
  final NewsRepository _newsRepository;
  const MyApp({
    super.key,
    required NewsRepository newsRepository
  }) : _newsRepository = newsRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _newsRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NewsFeedBloc>(create: (context) => NewsFeedBloc(_newsRepository)..add(const FetchNewsRequested())),
          BlocProvider<SavedNewsBloc>(create: (context) => SavedNewsBloc(_newsRepository)),
        ], 
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        )
      ),
    );
  }
}