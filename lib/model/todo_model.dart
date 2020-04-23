import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';

class TodoModel {
  int id;
  String todoName;
  int isDone;

  TodoModel({this.id, this.todoName, this.isDone});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{'id': id, 'todo': todoName, 'isDone': isDone};
    return map;
  }

  TodoModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    todoName = map['todo'];
    isDone = map['isDone'];
  }
}

class TodoHelper {
  Database _db;
  static const String ID = "id";
  static const String TODO_NAME = "todo";
  static const String IS_DONE = "isDone";
  static const String TableName = "todo";
  static const String DB_NAME = 'database.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $TableName ($ID INTEGER PRIMARY KEY, $TODO_NAME TEXT, $IS_DONE INTEGER)');
  }

  Future<TodoModel> save(TodoModel todo) async {
    var dbClient = await db;
    todo.id = await dbClient.insert(TableName, todo.toMap());
    return todo;
  }

  Future<List<TodoModel>> getTodo() async {
    var dbClient = await db;
    List<Map> maps =
        await dbClient.query(TableName, columns: [ID, TODO_NAME, IS_DONE]);
    List<TodoModel> todos = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        todos.add(TodoModel.fromMap(maps[i]));
      }
    }
    return todos;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return dbClient.delete(TableName, where: '$ID = ?', whereArgs: [id]);
  }

  Future<int> update(TodoModel todo) async {
    var dbClient = await db;
    return await dbClient.update(TableName, todo.toMap(),
        where: '$ID = ?', whereArgs: [todo.id]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
