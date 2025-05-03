import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/home.dart';

class AppTasks extends StatelessWidget {
  const AppTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey),
      ),

      home: Home(),
    );
  }
}
