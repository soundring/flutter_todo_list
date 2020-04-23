import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo_data.dart';
import 'package:todo_app/widgets/todo_tile.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoData>(builder: (context, todoData, _) {
      return FutureBuilder(
          future: todoData.getTodoData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container();
            } else {
              return ListView.builder(
                itemCount: todoData != null ? (snapshot.data.length ?? 0) : 0,
                itemBuilder: (BuildContext context, int index) {
                  final todo = snapshot.data[index];

                  return TodoTile(
                    todoTitle: todo.todoName,
                    isChecked: todo.isDone == 0 ? false : true,
                    checkboxCallback: (checkboxState) {
                      todoData.updateTodo(todo);
                    },
                    longPressCallback: () {
                      todoData.deleteTodo(todo);
                    },
                  );
                },
              );
            }
          });
    });
  }
}
