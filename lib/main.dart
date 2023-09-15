import 'package:flutter/material.dart';
import 'package:tasks_list_project/task/view/task_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true
      ),
      title: 'Material App',
      home: TaskView()
    );
  }
}