import 'package:bloc/bloc.dart';
import 'package:news_app/data/remote/news_api_service.dart';
import 'package:news_app/domain/repositories/news_repository.dart';
import 'package:news_app/presentation/bloc/saved_news_event.dart';
import 'package:news_app/presentation/bloc/saved_news_state.dart';

class SavedNewsBloc extends Bloc<SavedNewsEvent, SavedNewsState> {
  final NewsRepository _newsRepository;

  SavedNewsBloc(this._newsRepository) : super(SavedNewsInitial()){
    on<FetchSavedNewsRequested>(
      _onFetchSavedNewsRequested,
    );

    on<RemoveBookMarkRequested>(
      _onRemoveBookMarkRequested,
    );
  }

  @override
  void onTransition(Transition<SavedNewsEvent, SavedNewsState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  void _onFetchSavedNewsRequested(FetchSavedNewsRequested event, Emitter<SavedNewsState> emit) async {
    try {
      await _newsRepository.getSavedNews();

      emit.forEach(
        _newsRepository.watchSavedNews(), 
        onData: (savedArticles) => SavedNewsLoadSuccess(savedArticles: savedArticles),
        onError: (error, stackTrace) {
          print("STREAM ERROR: $error");
          return SavedNewsLoadFailure(message: _mapExceptionToMessage(error));
        },
      );
    } catch (error, stackTrace) {
      print("BLOCK ERROR DETAILS: $error");
      print(stackTrace);
    }
  }

  void _onRemoveBookMarkRequested(RemoveBookMarkRequested event, Emitter<SavedNewsState> emit) async {
    try {
      await _newsRepository.toggleSaveStatus(event.url, false);
      
    } catch (error, stackTrace) {
      emit(SavedNewsLoadFailure(message: _mapExceptionToMessage(error)));
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