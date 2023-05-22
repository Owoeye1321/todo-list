class ToDoModel {
  String? id;
  String? todoText;
  bool isDone;

  ToDoModel({required this.id, required this.todoText, this.isDone = false});
  static List<ToDoModel> todoList() {
    return [
      ToDoModel(id: "01", todoText: "Attend church on sunday", isDone: true),
      ToDoModel(id: "02", todoText: "Go to the office on monday", isDone: true),
      ToDoModel(id: "03", todoText: "code 9 hours on tuesday"),
      ToDoModel(id: "04", todoText: "Go to service in june"),
      ToDoModel(
        id: "05",
        todoText: "Make couple of friends in service",
      ),
      ToDoModel(
        id: "06",
        todoText: "Create amazing flutter applications",
      ),
      ToDoModel(id: "07", todoText: "Be a pro in backend engineering"),
    ];
  }
}
