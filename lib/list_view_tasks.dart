import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/load_list_provider.dart';
import 'package:lista_de_tarefas/task.dart';
import 'package:provider/provider.dart';

class ListViewTasks extends StatelessWidget {
  const ListViewTasks({super.key});

  @override
  Widget build(BuildContext context) {
    final stateManeger = Provider.of<LoadListProvider>(context);
    TextEditingController editController = TextEditingController();

    return (stateManeger.tasks.isEmpty)
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
          itemCount: stateManeger.tasks.length,
          itemBuilder: (context, index) {
            final Task task = stateManeger.tasks[index];
            return Container(
              padding: EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Checkbox(
                    value: task.checked,
                    onChanged: (value) {
                      stateManeger.updateCheck(task.id, value = !task.checked);
                    },
                  ),
                  SizedBox(width: 5),
                  (task.checked == false)
                      ? Text(task.name)
                      : Text(
                        task.name,
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            editController.text = task.name;
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Editar tarefa',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(height: 5),
                                      TextField(
                                        controller: editController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          enabledBorder: OutlineInputBorder(),
                                          label: Text('Editar'),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FilledButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('Cancelar'),
                                          ),
                                          SizedBox(width: 5),
                                          FilledButton(
                                            onPressed: () {
                                              stateManeger.editTask(
                                                task.id,
                                                task.name,
                                              );
                                              Navigator.pop(context);
                                            },
                                            child: Text('  Salvar  '),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    color: Colors.white,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Deletar a tarefa?',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.red,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            FilledButton(
                                              onPressed: () {
                                                stateManeger.deleteTask(
                                                  task.id,
                                                );
                                                Navigator.pop(context);
                                              },
                                              child: Text('Deletar'),
                                            ),
                                            SizedBox(width: 5),
                                            FilledButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Cancelar'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.delete),
                        ),
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
