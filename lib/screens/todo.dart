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

String newTodo = "";
final todoController = TextEditingController();
final filterController = TextEditingController();

class _TodoState extends State<Todo> {
  final todosList = ToDoModel.todoList();
  List<ToDoModel> foundTodo = [];

  void _handleTodoChange(ToDoModel todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _handleDelete(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
    ;
  }

  void _addTodoItem(String todo) {
    setState(() {
      todosList.add(ToDoModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: todo));
      todoController.clear();
    });
  }

  void _runFilter(String enteredKey) {
    List<ToDoModel> found = [];
    if (enteredKey.isEmpty)
      found = todosList;
    else {
      found = todosList
          .where((item) =>
              item.todoText!.toLowerCase().contains(enteredKey.toString()))
          .toList();
    }
    setState(() {
      foundTodo = found;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foundTodo = todosList;
  }

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
                SearchBar(_runFilter),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20, left: 3),
                        child: Text(
                          "All ToDos",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      for (ToDoModel todoo in foundTodo.reversed)
                        TodoItem(
                          todo: todoo,
                          onTodoHandle: _handleTodoChange,
                          onTodoDelete: _handleDelete,
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
                    controller: todoController,
                    decoration: InputDecoration(
                      hintText: "Type todo here",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20, right: 20),
                decoration: BoxDecoration(
                    color: tdBlue, borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  onPressed: () {
                    _addTodoItem(todoController.text);
                  },
                  child: Text(
                    "+",
                    style: TextStyle(fontSize: 30),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: tdBlue,
                      minimumSize: Size(50, 45),
                      elevation: 10),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
