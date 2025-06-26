import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/list_view_tasks.dart';
import 'package:lista_de_tarefas/load_list_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController addController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<LoadListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Minha Lista",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30.0, left: 20.0),
              width: MediaQuery.of(context).size.width,
              child: const Text("Tarefas", style: TextStyle(fontSize: 25)),
            ),
            Expanded(child: ListViewTasks()),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 30),
              child: TextField(
                controller: addController,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: Icon(
                    Icons.my_library_books_outlined,
                    color: Colors.blueGrey[200],
                  ),
                  label: Text(
                    "Adicionar tarefa",
                    style: TextStyle(color: Colors.black45),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 5),
          FloatingActionButton(
            onPressed: () {
              (addController.text.isNotEmpty)
                  ? prov.addTask(addController.text.trim(), false)
                  : null;
              addController.clear();
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
