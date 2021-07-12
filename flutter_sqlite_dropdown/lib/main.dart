import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'dropdownbutton_sqlite.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SqliteDropdown(),
    );
  }
}