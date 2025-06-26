import 'package:flutter/widgets.dart';
import 'package:lista_de_tarefas/data.dart';
import 'package:lista_de_tarefas/task.dart';

class LoadListProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks {
    if (_tasks.isEmpty) {
      loadTasks();
      return _tasks;
    } else {
      return _tasks;
    }
  }

  final db = MyDatabase();

  void loadTasks() async {
    _tasks = await db.loadListTasks();
    notifyListeners();
  }

  void addTask(String name, bool checked) async {
    await db.addTask(name, checked ? 1 : 0);
    loadTasks();
  }

  void updateCheck(int id, bool checked) async {
    await db.updateCheck(id, checked ? 1 : 0);
    loadTasks();
  }

  void deleteTask(int id) async {
    await db.deleteTask(id);
    loadTasks();
  }

  void editTask(int id, String name) async {
    await db.editTask(id, name);
    loadTasks();
  }
}
