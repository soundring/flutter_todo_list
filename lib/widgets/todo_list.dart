import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo_data.dart';
import 'package:todo_app/widgets/todo_tile.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoData>(
      builder: (context, todoData, _) {
        return ListView.builder(
          itemCount: todoData.todos.length,
          itemBuilder: (BuildContext context, int index) {
            final todo = todoData.todos[index];

            return TodoTile(
              todoTitle: todo.todoName,
              date: todo.date,
              isChecked: todo.isDone,
              checkboxCallback: (checkboxState) {
                todoData.updateTodo(todo);
              },
              longPressCallback: () {
                todoData.deleteTodo(todo);
              },
            );
          },
        );
      },
    );
  }
}
