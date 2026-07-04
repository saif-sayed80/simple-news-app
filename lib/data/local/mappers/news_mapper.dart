import 'package:news_app/data/local/news_database.dart';
import 'package:news_app/domain/models/news.dart';

extension NewsMapper on NewsCacheData {
  News toNews() {
    return News(
      title: title, 
      description: description, 
      url: url, 
      urlToImage: urlToImage, 
      publishedAt: publishedAt ?? DateTime.fromMillisecondsSinceEpoch(0), 
      content: content,
      isSaved: isSaved,
    );
  }
}