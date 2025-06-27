import 'dart:convert';
import 'dart:io';

import 'package:newsly/data/news_dto.dart';
import 'package:newsly/domain/news.dart';
import 'package:http/http.dart' as http;

class NewsService {
  Future<List<News>> searchNews(String query) async {
    final uri = Uri.parse(
      "https://newsapi.org/v2/everything?q=$query&apiKey=0ded32e65558448784fccdbc73039b0d&page=1&pageSize=20",
    );
    try {
      final response = await http.get(uri);
      if (response.statusCode == HttpStatus.ok) {
        final List maps = jsonDecode(response.body)['articles'];
        return maps.map((item) => NewsDto.fromJson(item).toDomain()).toList();
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  }
}
