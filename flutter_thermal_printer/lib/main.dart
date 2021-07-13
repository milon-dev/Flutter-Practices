import 'package:flutter/material.dart';
import 'package:flutter_printer/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thermal Printer',
      home: Home(),
    );
  }
}
