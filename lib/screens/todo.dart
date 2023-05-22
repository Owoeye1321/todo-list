import "package:flutter/material.dart";
import "package:todo_list/constants/colors.dart";
import 'package:todo_list/widgets/appBar.dart';
import "package:todo_list/widgets/searchBox.dart";
import "package:todo_list/widgets/todo_item.dart";
import "package:todo_list/model/todo_model.dart";

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final todosList = ToDoModel.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: MyAppBar(
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                SearchBar(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20, left: 3),
                        child: Text(
                          "All ToDos",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      for (ToDoModel todo in todosList)
                        TodoItem(
                          todo: todo,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: new Row(children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0.0),
                  margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: tdGrey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type todo here",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                width: 90,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                decoration: BoxDecoration(
                    color: tdBlue, borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.add),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
