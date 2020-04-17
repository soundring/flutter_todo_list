class Todo {
  String todoName;
  DateTime date;
  bool isDone;

  Todo({this.todoName, this.date, this.isDone = false});

  void toggle() {
    isDone = !isDone;
  }
}
