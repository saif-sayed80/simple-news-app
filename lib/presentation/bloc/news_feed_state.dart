import 'package:equatable/equatable.dart';
import 'package:news_app/domain/models/news.dart';

sealed class NewsFeedState extends Equatable {
  const NewsFeedState();

  @override
  List<Object> get props => [];
}

final class NewsInitial extends NewsFeedState {
  const NewsInitial();
}

final class NewsLoadInProgress extends NewsFeedState {
  const NewsLoadInProgress();
}

final class NewsLoadSuccess extends NewsFeedState {
  final List<News> articles;
  const NewsLoadSuccess(this.articles);

  //Equatible compares the data when emitting refresh.
  //If the data is identical,
  //Bloc ignores the duplicate state and prevents the UI from rebuilding.
  @override
  List<Object> get props => [articles];
}

final class NewsLoadFailure extends NewsFeedState {
  final String message;
  const NewsLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}