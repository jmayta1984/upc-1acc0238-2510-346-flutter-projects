import 'package:newsly/data/app_database.dart';
import 'package:newsly/data/favorite_news_dto.dart';
import 'package:newsly/domain/favorite_news.dart';
import 'package:sqflite/sqlite_api.dart';

class FavoriteNewsDao {
  Future<void> addFavoriteNews(FavoriteNews news) async {
    Database db = await AppDatabase().database;
    await db.insert(
      AppDatabase.newsTable,
      FavoriteNewsDto.fromDomain(news).toDatabase(),
    );
  }

  Future<void> removeFavoriteNews(String title) async {
    Database db = await AppDatabase().database;
    await db.delete(
      AppDatabase.newsTable,
      where: 'title = ?',
      whereArgs: [title],
    );
  }

  Future<List<FavoriteNews>> fetchFavoriteNews() async {
    Database db = await AppDatabase().database;
    final List maps = await db.query(AppDatabase.newsTable);
    return maps.map((map) => FavoriteNewsDto.fromDatabase(map).toDomain()).toList();
  }

  Future<bool> isFavorite(String title) async {
    Database db = await AppDatabase().database;
    final List maps = await db.query(
      AppDatabase.newsTable,
      where: 'title = ?',
      whereArgs: [title],
    );
    return maps.isNotEmpty;
  }
}