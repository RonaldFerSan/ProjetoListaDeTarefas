import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/load_list_provider.dart';
import 'package:lista_de_tarefas/task.dart';
import 'package:provider/provider.dart';

class ListViewTasks extends StatelessWidget {
  const ListViewTasks({super.key});

  @override
  Widget build(BuildContext context) {
    final listTasks = Provider.of<LoadListProvider>(context);

    return (listTasks.tasks.isEmpty)
        ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "**Parabéns**",
                style: TextStyle(fontSize: 20, color: Colors.blueGrey[600]),
              ),
              Text(
                "Você não tem nunhuma tarefa",
                style: TextStyle(color: Colors.blueGrey[200]),
              ),
            ],
          ),
        )
        : ListView.builder(
          itemCount: listTasks.tasks.length,
          itemBuilder: (context, index) {
            final Task task = listTasks.tasks[index];
            return Container(
              padding: EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Checkbox(
                    value: task.checked,
                    onChanged: (value) {
                      listTasks.updateCheck(task.id, value = !task.checked);
                    },
                  ),
                  SizedBox(width: 5),
                  Text(task.name),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
  }
}
