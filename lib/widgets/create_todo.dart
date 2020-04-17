import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo_data.dart';

class CreateTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTodoData;

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Todoを入力してください♪',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (value) {
              newTodoData = value;
            },
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            child: Text(
              '作成',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
            color: Colors.orangeAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            onPressed: () {
              Provider.of<TodoData>(context, listen: false)
                  .addTodo(newTodoData, DateTime.now());
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
