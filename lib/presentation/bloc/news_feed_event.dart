import 'package:equatable/equatable.dart';

sealed class NewsFeedEvent extends Equatable {
  const NewsFeedEvent();

  @override
  List<Object> get props => [];
}

final class FetchNewsRequested extends NewsFeedEvent {
  const FetchNewsRequested();
}

final class RefreshNewsRequested extends NewsFeedEvent {
  const RefreshNewsRequested();
}


final class ToggleBookmarkRequested extends NewsFeedEvent {
  final String url;
  final bool isSaved;

  const ToggleBookmarkRequested({
    required this.url,
    required this.isSaved,
  });

  //Overriding props because NewsEvent base class defines List<Object> get props => [];.
  //Wothout overriding props,
  //Equatable will think every single instance of a bookmark toggle event is identical, 
  //regardless of which article is being clicked.
  //If a user hits bookmark on Article A, and then immediately hits bookmark on Article B, 
  //the Bloc will look at the empty props array, 
  //conclude that the incoming event is identical to the previous one, 
  //and drop the second request entirely.
  @override
  List<Object> get props => [url, isSaved];
}