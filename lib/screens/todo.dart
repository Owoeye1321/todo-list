import "package:flutter/material.dart";
import "package:todo_list/constants/colors.dart";
import 'package:todo_list/widgets/appBar.dart';
import "package:todo_list/widgets/searchBox.dart";
import "package:todo_list/widgets/todo_item.dart";

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBGColor,
        appBar: MyAppBar(
          preferredSize: Size.fromHeight(kToolbarHeight),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              SearchBar(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50, bottom: 20),
                      child: Text(
                        "All ToDos",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                    TodoItem()
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
