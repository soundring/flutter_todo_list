class Todo {
  int id;
  String todoName;
  int isDone;

  Todo({this.id, this.todoName, this.isDone = 0});

  void toggle() {
    isDone = isDone == 0 ? 1 : 0;
  }
}
