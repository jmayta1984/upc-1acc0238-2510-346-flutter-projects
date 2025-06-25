import 'package:newsly/domain/favorite_news.dart';

class FavoriteNewsDto {
  final String title;
  final String author;
  final String image;
  final String description;

  const FavoriteNewsDto({
    required this.title,
    required this.author,
    required this.image,
    required this.description,
  });

  factory FavoriteNewsDto.fromDatabase(Map<String, dynamic> json) {
    return FavoriteNewsDto(
      title: json['title'],
      author: json['author'],
      image: json['image'],
      description: json['description'],
    );
  }
  Map<String, dynamic> toDatabase() {
    return {
      'title': title,
      'author': author,
      'image': image,
      'description': description,
    };
  }

  FavoriteNews toDomain() {
    return FavoriteNews(
      title: title,
      author: author,
      image: image,
      description: description,
    );
  }
}
