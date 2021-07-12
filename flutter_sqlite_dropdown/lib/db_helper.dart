import 'dart:async';
import 'dart:io' as io;

import './user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DatabaseHelper {
  String DATABASE_NAME = "main.db";
  String TABLE_NAME = "users";

  static DatabaseHelper _databaseHelper;
  static Database _database;

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, DATABASE_NAME);
    var cardDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return cardDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.rawDelete("DROP TABLE IF EXISTS $TABLE_NAME");
    await db.execute('CREATE TABLE $TABLE_NAME (id INTEGER PRIMARY KEY,name TEXT,email TEXT,username TEXT,password TEXT)');
  }

  Future<int> saveData(UserModel user) async {
    var dbClient = await database;
    int res = await dbClient.insert(TABLE_NAME, user.toMap());
    return res;
  }

  Future<List<UserModel>> getUserModelData() async {
    var dbClient = await database;
    String sql = "SELECT * FROM $TABLE_NAME";
    var result = await dbClient.rawQuery(sql);
    if (result.length == 0) return null;
    List<UserModel> list = result.map((item) {
      return UserModel.fromMap(item);
    }).toList();
    return list;
  }

}