/*
{
    "source": {
      "id": null,
      "name": "Javacodegeeks.com"
    },
    "author": "Eleftheria Drosopoulou",
    "title": "Why Flutter Picked Dart: A Deeper Dive",
    "description": "Flutter, Google’s revolutionary UI toolkit, has taken the mobile development world by storm. Its ability to create beautiful, native-performing apps across multiple platforms with a single codebase has made it a popular choice for developers. But one of the k…",
    "url": "https://www.javacodegeeks.com/2024/09/why-flutter-picked-dart-a-deeper-dive.html",
    "urlToImage": "https://www.javacodegeeks.com/wp-content/uploads/2012/10/software-development-2-logo.jpg",
    "publishedAt": "2024-09-16T05:54:00Z",
    "content": "Flutter, Google’s revolutionary UI toolkit, has taken the mobile development world by storm. Its ability to create beautiful, native-performing apps across multiple platforms with a single codebase h… [+6804 chars]"
  }
*/
import 'package:newsly/domain/news.dart';

class NewsDto {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  const NewsDto({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsDto.fromJson(Map<String, dynamic> json) {
    return NewsDto(
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      content: json['content'] ?? '',
    );
  }

  News toDomain() {
    return News(
      author: author,
      title: title,
      image: urlToImage,
      year: publishedAt.isNotEmpty ? publishedAt.split('-')[0] : '',
      content: content,
      description: description,
    );
  }
}
