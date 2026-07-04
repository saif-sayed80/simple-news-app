class News {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;
  final bool isSaved;

  const News ({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    this.isSaved = false,
  });

  factory News.fromJson(Map<String, dynamic> json, {bool? isSaved}) {
    return News(
      title: json['title'] ?? '', 
      description: json['description'] ?? '', 
      url: json['url'] ?? '', 
      urlToImage: json['urlToImage'] ?? '', 
      publishedAt: DateTime.tryParse(json['publishedAt'] ?? '') ?? DateTime.fromMillisecondsSinceEpoch(0),
      content: json['content'] ?? '',
      isSaved: isSaved ?? false,
    );
  }
}