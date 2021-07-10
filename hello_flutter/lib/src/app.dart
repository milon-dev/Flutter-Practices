import 'package:flutter/material.dart';

class App extends StatefulWidget {
  createState() {
    return AppStatKeeper();
  }
}

class AppStatKeeper extends State<App> {
  final barColor = const Color(0xFF26ae60);
  final bgColor = const Color(0xFFDAE0E2);
  int counter = 0;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: bgColor,
        body: Center(
          child: Text(
            generateLuckyNumber(),
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.blueAccent, fontSize: 25.0),
          ),
        ),
        appBar: AppBar(
          backgroundColor: barColor,
          title: Text("Milon Sheikh"),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: barColor,
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              counter = counter + 1;
            });
          },
        ),
      ),
    );
  }

  String generateLuckyNumber() {
    return "You clicked the button times: $counter";
  }
}
