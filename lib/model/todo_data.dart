import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class TodoData with ChangeNotifier {
  List<Todo> _todos = [
    Todo(todoName: 'test', date: DateTime.now()),
  ];

  UnmodifiableListView<Todo> get todos {
    return UnmodifiableListView(_todos);
  }

  void addTodo(String newTodoData, DateTime createdDate) {
    final todo = Todo(todoName: newTodoData, date: createdDate);
    _todos.add(todo);
    notifyListeners();
  }

  void updateTodo(Todo todo) {
    todo.toggle();
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }
}
