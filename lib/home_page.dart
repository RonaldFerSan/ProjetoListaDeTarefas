import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/list_view_tasks.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
    );
  }
}
