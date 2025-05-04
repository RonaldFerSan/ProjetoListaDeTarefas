import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/list_tasks.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<List> tasklist = [
    ['exercicios', false],
    ['estudar', true],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Center(
          child: Text('Minhas tarefas', style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: tasklist.length,
        itemBuilder: (context, index) {
          final task = tasklist[index][0];
          final check = tasklist[index][1];
          return ListTasks(task: task, check: check);
        },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 20.0),
              child: TextField(
                minLines: 1,
                maxLines: 2,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blueGrey[200],
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
        ],
      ),
    );
  }
}
