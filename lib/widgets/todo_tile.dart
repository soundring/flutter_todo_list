import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoTile extends StatelessWidget {
  final String todoTitle;
  final DateTime date;
  final bool isChecked;
  final Function checkboxCallback;
  final Function longPressCallback;

  TodoTile(
      {this.todoTitle,
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
          todoTitle,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        subtitle: Text(DateFormat.yMMMMEEEEd().format(date)),
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
