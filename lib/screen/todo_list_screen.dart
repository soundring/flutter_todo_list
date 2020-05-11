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
    var link = await FirebaseDynamicLinks.instance.getInitialLink();
    handleLinkData(link);

    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      handleLinkData(dynamicLink);
    });
  }

  void handleLinkData(PendingDynamicLinkData data) {
    final Uri uri = data?.link;
    print(uri.queryParameters["path"]);
    Navigator.pushNamed(context, uri.queryParameters["path"]);
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
