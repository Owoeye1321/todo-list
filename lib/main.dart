import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:todo_list/screens/todo.dart';

void main() => {runApp(ToDoList())};

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return const MaterialApp(
      title: "To-do-list",
      debugShowCheckedModeBanner: false,
      home: Todo(),
    );
  }
}
