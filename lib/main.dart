import 'package:flutter/material.dart';
import 'package:todo_app/screen/todo_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo_data.dart';
import 'package:todo_app/screen/add_todo_screen.dart';
import 'package:todo_app/screen/update_todo_screen.dart';

void main() => runApp(MyTodoApp());

class MyTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoData(),
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.orange),
        initialRoute: '/',
        routes: {
          '/': (context) => TodoListScreen(),
          '/add_todo_screen': (context) => AddTodoScreen(),
          '/update_todo_screen': (context) => UpdateTodoScreen(),
        },
      ),
    );
  }
}
