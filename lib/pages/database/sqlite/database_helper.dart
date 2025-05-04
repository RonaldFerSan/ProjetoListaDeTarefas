import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._internal();
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  Future<Database?> initDatabase() async {
    if (_database != null) {
      return _database;
    } else {
      final path = join(await getDatabasesPath(), 'tasks.db');
      _database = await openDatabase(path, version: 1, onCreate: onCreate);
      return _database;
    }
  }

  onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY, 
        task TEXT, 
        checked INTEGER,
        idfolder INTEGER
      )''');

    await db.execute('''
      CREATE TABLE folders (
        id INTEGER PRIMARY KEY,
        name TEXT
      )''');
  }
}
