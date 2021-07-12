import 'dart:async';
import 'dart:io' as io;

import './user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute("""CREATE TABLE user(
        id INTEGER PRIMARY KEY,
        name TEXT,
        email TEXT,
        username TEXT,
        password TEXT
        )""");
  }

  Future<int> saveData(UserModel user) async {
    var dbClient = await db;
    int res = await dbClient.insert("user", user.toMap());
    return res;
  }

  Future<List<UserModel>> getUserModelData() async {
    var dbClient = await db;
    String sql;
    sql = "SELECT * FROM user";

    var result = await dbClient.rawQuery(sql);
    if (result.length == 0) return null;

    List<UserModel> list = result.map((item) {
      return UserModel.fromMap(item);
    }).toList();
    return list;
  }
}