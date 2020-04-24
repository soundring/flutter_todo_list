import 'package:flutter/material.dart';
import 'package:todo_app/widgets/update_todo.dart';

class UpdateTodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List updateData = ModalRoute.of(context).settings.arguments as List;
    return Scaffold(
      appBar: AppBar(),
      body: UpdateTodo(
        id: updateData[0],
        todoText: updateData[1],
      ),
    );
  }
}
