import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:news_app/domain/models/news.dart';
import 'package:http/http.dart' as http;

class ServerException implements Exception {}
class OfflineException implements Exception {}

class NewsApiService {
  final http.Client _client;
  final String _baseUrl;
  final String _apiKey;

  const NewsApiService({
    required http.Client client,
    required String baseUrl,
    required String apiKey,
  }) : _client = client,
       _baseUrl = baseUrl,
       _apiKey = apiKey;

  static List<News> parseNews(String responseBody) {
    final Map<String, dynamic> jsonMap = jsonDecode(responseBody) as Map<String, dynamic>;

    final List<dynamic> articlesList = jsonMap['articles'] as List<dynamic>? ?? [];

    return articlesList.map<News>((item) => News.fromJson(item as Map<String, dynamic>)).toList();
  }

  Future<List<News>> fetchNews({required String query, required String fromDate}) async {
    try {
      final uri = Uri.parse('$_baseUrl/everything?q=$query&from=$fromDate&sortBy=publishedAt&apiKey=$_apiKey');

      final response = await _client.get(uri);
      
      if (response.statusCode == 200) {
        return compute(parseNews, response.body);
      } else {
        throw ServerException();
      }
    } on SocketException {
      throw OfflineException();
    } on HttpException {
      throw ServerException();
    } on FormatException {
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }
}