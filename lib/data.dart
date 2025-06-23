import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/task.dart';

class ListTasks extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(id: 0, name: "tarefa 1", checked: true),
    Task(id: 1, name: "Tarefa 2", checked: false),
    Task(id: 2, name: "Tarefa 3", checked: false),
  ];

  List<Task> get tasks => _tasks;
}
