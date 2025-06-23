import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/data.dart';
import 'package:provider/provider.dart';

class ListViewTasks extends StatelessWidget {
  const ListViewTasks({super.key});

  @override
  Widget build(BuildContext context) {
    final listTasks = Provider.of<ListTasks>(context);
    return ListView.builder(
      itemCount: listTasks.tasks.length,
      itemBuilder: (context, index) {
        final task = listTasks.tasks[index];
        return Container(
          padding: EdgeInsets.only(top: 5),
          child: Row(
            children: [
              Checkbox(value: task.checked, onChanged: (bool? value) {}),
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
