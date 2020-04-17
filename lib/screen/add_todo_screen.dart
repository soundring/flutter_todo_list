import 'package:flutter/material.dart';
import 'package:todo_app/widgets/create_todo.dart';

class AddTodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Todo作成',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: CreateTodo(),
    );
  }
}
