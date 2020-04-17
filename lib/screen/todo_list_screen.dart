import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo_list.dart';

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          Navigator.pushNamed(context, '/add_todo_screen');
        },
      ),
      appBar: AppBar(
        title: Text(
          'Todoリスト',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: TodoList(),
    );
  }
}
