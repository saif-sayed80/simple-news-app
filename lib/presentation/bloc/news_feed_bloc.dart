import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:news_app/data/remote/news_api_service.dart';
import 'package:news_app/domain/models/news.dart';
import 'package:news_app/domain/repositories/news_repository.dart';
import 'package:news_app/presentation/bloc/news_feed_event.dart';
import 'package:news_app/presentation/bloc/news_feed_state.dart';

class NewsFeedBloc extends Bloc<NewsFeedEvent, NewsFeedState> {
  final NewsRepository _newsRepository;

  NewsFeedBloc(this._newsRepository) : super(const NewsInitial()) {
    on<FetchNewsRequested>(
      _onFetchNewsRequested,

      //Droppable transformer ignores spam-clicks while loading data,
      //or any new events until the current event is done
      transformer: droppable(),
    );

    on<RefreshNewsRequested>(
      _onRefreshNewsRequested,
    );

    on<ToggleBookmarkRequested>(
      _onToggleBookmarkRequested,
    );
  }

  @override
  void onTransition(Transition<NewsFeedEvent, NewsFeedState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  Future<void> _onFetchNewsRequested(FetchNewsRequested event, Emitter<NewsFeedState> emit) async {
    try {
      emit(const NewsLoadInProgress());
          
      await _newsRepository.refreshTopHeadLines();

      emit.forEach<List<News>>(
        _newsRepository.watchTopHeadLines(), 
        onData: (articles) => NewsLoadSuccess(articles),
        onError: (error, stackTrace) {
          print("STREAM ERROR: $error");
          return NewsLoadFailure(_mapExceptionToMessage(error));
        },
      );
    } catch (error, stackTrace) {
        emit(NewsLoadFailure(_mapExceptionToMessage(error)));
        print("BLOCK ERROR DETAILS: $error");
        print(stackTrace);
    }
  }

  Future<void> _onRefreshNewsRequested(RefreshNewsRequested event, Emitter<NewsFeedState> emit) async {
    try {
      await _newsRepository.refreshTopHeadLines();
    } catch (error, stackTrace) {
        emit(NewsLoadFailure(_mapExceptionToMessage(error)));
        print("BLOCK ERROR DETAILS: $error");
        print(stackTrace);
    }
  }

  Future<void> _onToggleBookmarkRequested(ToggleBookmarkRequested event, Emitter<NewsFeedState> emit) async {
    try {
      await _newsRepository.toggleSaveStatus(event.url, event.isSaved);
    } catch (error, stackTrace) {
      emit(NewsLoadFailure(_mapExceptionToMessage(error)));
      print("BLOCK ERROR DETAILS: $error");
      print(stackTrace);
    }
  }

  String _mapExceptionToMessage(Object error) {
    if(error is OfflineException) {
      return "No internet access. Showing older cached news.";
    } else if(error is ServerException) {
      return "The server encountered an error. Please try again later.";
    }
    return "An unexpected error occurred. Please try again.";
  }
}