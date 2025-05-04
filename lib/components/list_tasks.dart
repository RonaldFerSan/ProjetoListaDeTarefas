import 'package:flutter/material.dart';

class ListTasks extends StatelessWidget {
  final String task;
  final bool check;
  const ListTasks({super.key, required this.task, required this.check});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10),

      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.blueGrey[200],
          borderRadius: BorderRadius.circular(20),
        ),

        child: ListTile(
          leading: Checkbox(value: check, onChanged: (p0) {}),
          title: Text(task),
          trailing: Expanded(
            child: PopupMenuButton(
              itemBuilder:
                  (context) => [
                    PopupMenuItem(value: 1, child: Text('Editar')),
                    PopupMenuItem(value: 2, child: Text('Delete')),
                  ],
              onSelected: (value) {
                if (value == 1) {}
                if (value == 2) {}
              },
              icon: Icon(Icons.more_vert_rounded),
            ),
          ),
        ),
      ),
    );
  }
}
