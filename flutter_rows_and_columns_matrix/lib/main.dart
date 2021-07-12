import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Rows and Columns Matrix'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<Color> manyColors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.brown,
      Colors.purple,
      Colors.orange,
      Colors.pink
    ];

    List<Widget> myRowChildren = [];
    List<List<int>> numbers = [];
    List<int> columnNumbers = [];
    int z = 0;
    for (int i = 0; i <= 4; i++) {
      int maxColNr = 5;
      for (int y = 0; y <= maxColNr; y++) {
        int currentNumber = z + y;
        columnNumbers.add(currentNumber);
      }
      z += maxColNr;
      numbers.add(columnNumbers);
      columnNumbers = [];
    }
    print(numbers);

    myRowChildren = numbers
        .map((columns) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: columns.map((nr) {
          int min = 0;
          int max = manyColors.length;
          Random rnd = new Random();
          int randomNumber = min + rnd.nextInt(max - min);
          return Container(
            padding: EdgeInsets.all(30),
            color: manyColors[randomNumber],
            child: Text(
              nr.toString(),
            ),
          );
        }).toList(),
      ),
    )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: myRowChildren,
      ),
    );
  }
}