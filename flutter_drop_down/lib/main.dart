import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'DropdownButton'),
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
String dropdownValue = "Google";
  List<String> spinnerItem = ['Google', 'Apple', 'Amazon', 'Tesla'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: DropdownButton(
          value: dropdownValue,
          items: spinnerItem.map((value) => DropdownMenuItem(
            child: Text(value),
            value: value,
          )).toList(),
          onChanged: (String value) {
            setState(() {
              dropdownValue = value;
              print("_chosenValue===>>>  $dropdownValue");
            });
          },
        ),
      ),
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            RaisedButton(
//                child: Text('Show Dialog'),
//                onPressed: () {
//                displayDialog(context);
//                }),
//          ],
//        ),
//      ),
//    );
//  }

  displayDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dropdown Button'),
          content: StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
            return  DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.red, fontSize: 18),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String data) {
                setState(() {
                  dropdownValue = data;
                  print("dropdownValue===>>>  $dropdownValue");
                });
              },
              items: spinnerItem.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            );
          }),
          actions: <Widget>[new FlatButton(
            child: new Text('CANCEL'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )],
        );
      },
    );
  }
}