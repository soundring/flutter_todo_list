import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_data.dart';
import 'package:todo_app/model/todo.dart';

class UpdateTodo extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final int id;
  final String todoText;

  UpdateTodo({this.id, this.todoText});

  @override
  Widget build(BuildContext context) {
    print(todoText);
    String updateTodoText;
    int isDone = 0;
    final TodoData _todoData = TodoData();
    TextEditingController _updateTodoController =
        TextEditingController(text: todoText);

    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              '編集内容を入力してください♪',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            TextFormField(
              controller: _updateTodoController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'テキストを入力してください';
                } else {
                  return null;
                }
              },
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                updateTodoText = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
                child: Text(
                  '更新',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                color: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Todo updateTodoData =
                        Todo(id: id, todoName: updateTodoText, isDone: isDone);
                    _todoData.updateTodoText(updateTodoData);
                  }
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
