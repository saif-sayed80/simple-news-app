sealed class SavedNewsEvent {
  const SavedNewsEvent();
}

final class FetchSavedNewsRequested extends SavedNewsEvent {
  const FetchSavedNewsRequested();
}

final class RemoveBookMarkRequested extends SavedNewsEvent {
  final String url;
  
  const RemoveBookMarkRequested({required this.url});
}