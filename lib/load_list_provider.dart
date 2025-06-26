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

  loadTasks() async {
    _tasks = await db.loadListTasks();
    notifyListeners();
  }

  addTask(String name, bool checked) async {
    await db.addTask(name, checked ? 1 : 0);
    loadTasks();
  }

  updateCheck(int id, bool checked) async {
    await db.updateCheck(id, checked ? 1 : 0);
    loadTasks();
  }
}
