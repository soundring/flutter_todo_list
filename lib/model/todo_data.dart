import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

import 'package:todo_app/model/todo_model.dart';

class TodoData with ChangeNotifier {
  final TodoHelper _todoHelper = TodoHelper();

  Future<List<Todo>> getTodoData() async {
    List<Todo> todos = [];
    List<TodoModel> nowTodoDates = await _todoHelper.getTodo();

    for (TodoModel nowTodo in nowTodoDates) {
      Todo todo = Todo(
          id: nowTodo.id, todoName: nowTodo.todoName, isDone: nowTodo.isDone);
      todos.add(todo);
    }
    return todos;
  }

  void addTodo(String newTodoData, DateTime createdDate, int isDone) {
    Todo todo = Todo(todoName: newTodoData, isDone: isDone);

    TodoModel addTodoModel =
        TodoModel(id: null, todoName: todo.todoName, isDone: todo.isDone);

    _todoHelper.save(addTodoModel);
    notifyListeners();
  }

  void updateTodo(Todo todo) {
    todo.toggle();
    TodoModel updateTodoModel =
        TodoModel(id: todo.id, todoName: todo.todoName, isDone: todo.isDone);

    _todoHelper.update(updateTodoModel);
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    _todoHelper.delete(todo.id);
    notifyListeners();
  }
}
