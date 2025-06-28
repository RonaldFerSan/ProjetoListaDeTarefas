import 'package:lista_de_tarefas/task.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {
  static final MyDatabase _instance = MyDatabase._internal();

  factory MyDatabase() => _instance;

  MyDatabase._internal();

  static Database? _database;

  Future<Database> get db async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDb();
      return _database!;
    }
  }

  Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'minhas_tarefas.db');
    return await openDatabase(path, version: 1, onCreate: _onCreateDb);
  }

  Future<void> _onCreateDb(Database db, int version) async {
    await db.execute("""
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        checked INTEGER
      )""");
  }

  Future<List<Task>> loadListTasks() async {
    final db = await MyDatabase().db;
    final listMaps = await db.query('tasks', orderBy: 'checked ASC');
    final listTasks = listMaps.map((map) => Task.fromMap(map)).toList();
    return listTasks;
  }

  Future<void> addTask(String name, int checked) async {
    final db = await MyDatabase().db;
    await db.insert('tasks', {
      'name': name,
      'checked': checked,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateCheck(int id, int checked) async {
    final db = await MyDatabase().db;
    await db.update(
      "tasks",
      {'checked': checked},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteTask(int id) async {
    final db = await MyDatabase().db;
    await db.delete("tasks", where: 'id = ?', whereArgs: [id]);
  }

  Future<void> editTask(int id, String name) async {
    final db = await MyDatabase().db;
    await db.update('tasks', {'name': name}, where: 'id = ?', whereArgs: [id]);
  }
}
