import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/screen/update_todo_screen.dart';
import 'package:todo_app/widgets/update_todo.dart';

class TodoTile extends StatelessWidget {
  final int id;
  final String todoContent;
  final DateTime date;
  final bool isChecked;
  final Function checkboxCallback;
  final Function longPressCallback;

  TodoTile(
      {this.id,
      this.todoContent,
      this.date,
      this.isChecked,
      this.checkboxCallback,
      this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black38),
        ),
      ),
      child: ListTile(
        title: Text(
          todoContent,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/update_todo_screen',
              arguments: [id, todoContent]);
        },
        trailing: Checkbox(
          activeColor: Colors.orangeAccent,
          value: isChecked,
          onChanged: checkboxCallback,
        ),
        onLongPress: longPressCallback,
      ),
    );
  }
}
