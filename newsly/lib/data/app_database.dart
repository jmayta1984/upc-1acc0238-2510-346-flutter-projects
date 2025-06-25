import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static final String databaseName = 'app_database.db';
  static final String newsTable = 'news';
  static final int version = 1;
  static final String createNewsTable =
      '''
    CREATE TABLE $newsTable (
      title TEXT PRIMARY KEY,
      author TEXT,
      image TEXT,
      description TEXT
    )
  ''';

  static final AppDatabase _instance = AppDatabase._internal();
  factory AppDatabase() {
    return _instance;
  }

  AppDatabase._internal();

  Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database as Database;
  }
  
  Future<Database> _initDatabase() async {
    final String path = join(await getDatabasesPath(), databaseName);
    return await openDatabase(
      path,
      version: version,
      onCreate: (db, version) async {
        await db.execute(createNewsTable);
      },
    );
  }
}
