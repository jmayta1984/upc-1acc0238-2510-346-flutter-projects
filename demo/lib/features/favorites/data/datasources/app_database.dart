import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static final AppDatabase _instance = AppDatabase._internal();
  factory AppDatabase() => _instance;
  AppDatabase._internal();

  static Database? _db;

  Future<Database> get database async {
    return _db ??= await _initDb();
  }

  Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'easyshoes.db');
    return await openDatabase(path, version: 1, onCreate: _oncreate);
  }

  Future<void> _oncreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE favorites (id INTEGER primary key, name TEXT, image TEXT, price INTEGER)',
    );
  }
}
