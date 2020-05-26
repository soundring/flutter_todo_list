import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo_list.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  void initState() {
    super.initState();
    initLinkData();
  }

  void initLinkData() async {
    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();

    if (data != null) {
      handleLinkData(data);
    }

    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      handleLinkData(dynamicLink);
    }, onError: (OnLinkErrorException e) async {
      print("エラー");
      print(e.message);
    });
  }

  void handleLinkData(PendingDynamicLinkData data) {
    final Uri uri = data?.link;
    print(uri.queryParameters);
    print(uri.queryParameters.length);
    if (uri.queryParameters.length != 0) {
      print('条件突破');
      Navigator.pushNamed(context, uri.queryParameters["path"]);
    }
  }

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
