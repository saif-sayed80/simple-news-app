import 'package:news_app/domain/models/news.dart';

sealed class SavedNewsState {
  const SavedNewsState();
}

final class SavedNewsInitial extends SavedNewsState {
  const SavedNewsInitial();
}

final class SavedNewsLoadInProgress extends SavedNewsState {
  const SavedNewsLoadInProgress();
}

final class SavedNewsLoadSuccess extends SavedNewsState {
  final List<News> savedArticles;

  const SavedNewsLoadSuccess({required this.savedArticles});
}

final class SavedNewsLoadFailure extends SavedNewsState {
  final String message;

  const SavedNewsLoadFailure({required this.message});
}