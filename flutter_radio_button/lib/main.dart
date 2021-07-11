//import 'package:flutter/material.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Radio Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.red,
//      ),
//      home: MyHomePage(title: 'RadioButton'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int selectedRadio = 0;
//  int selectedRadioList = 0;
//  String selectedRadioListItem = 'One';
//  List<NumberList> nList = [
//    NumberList(
//      index: 0,
//      number: "One",
//    ),
//    NumberList(
//      index: 1,
//      number: "Two",
//    ),
//    NumberList(
//      index: 2,
//      number: "Three",
//    ),
//    NumberList(
//      index: 3,
//      number: "Four",
//    ),];
//
//  @override
//  void initState() {
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: Column(
//        mainAxisAlignment: MainAxisAlignment.start,
//        children: <Widget>[
//          Container(
//            padding: EdgeInsets.all(20.0),
//            child: Text("USERS"),
//          ),
//         Container(
//            child: Column(
//              children: nList
//                  .map((data) => RadioListTile(
//                        title: Text("${data.number}"),
//                        groupValue: selectedRadioList,
//                        value: data.index,
//                        onChanged: (val) {
//                          setState(() {
//                            selectedRadioListItem = data.number;
//                            selectedRadioList = data.index;
//                            print("onChanged selectedRadioListItem ===>>> $selectedRadioList ===>>> ${selectedRadioListItem}");
//                          });
//                        },
//                      ))
//                  .toList(),
//            ),
//          ),
//          Divider(
//            height: 20,
//            color: Colors.green,
//          ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: [
//              new Radio(
//                value: 0,
//                groupValue: selectedRadio,
//                activeColor: Colors.green,
//                onChanged: (val) {
//                  setState(() {
//                    selectedRadio = val;
//                    print("onChanged selectedRadio ===>>>  $selectedRadio");
//                  });
//                },
//              ),
//              new Text(
//                'First',
//                style: new TextStyle(fontSize: 16.0),
//              ),
//              new Radio(
//                value: 1,
//                groupValue: selectedRadio,
//                activeColor: Colors.green,
//                onChanged: (val) {
//                  setState(() {
//                    selectedRadio = val;
//                    print("onChanged selectedRadio ===>>>  $selectedRadio");
//                  });
//                },
//              ),
//              new Text(
//                'Second',
//                style: new TextStyle(
//                  fontSize: 16.0,
//                ),
//              ),
//              new Radio(
//                value: 2,
//                groupValue: selectedRadio,
//                activeColor: Colors.green,
//                onChanged: (val) {
//                  setState(() {
//                    selectedRadio = val;
//                    print("onChanged selectedRadio ===>>>  $selectedRadio");
//                  });
//                },
//              ),
//              new Text(
//                'Last',
//                style: new TextStyle(fontSize: 16.0),
//              ),
//            ],
//          ),
//          Container(
//              padding: EdgeInsets.all(10.0),
//              child: RaisedButton(
//                textColor: Colors.white,
//                color: Colors.red,
//                child: Text('Button'),
//                onPressed: () {
//                  print("Button Click  selectedRadioListItem ===>>> $selectedRadioList ---- ${selectedRadioListItem}");
//                  print("Button Click selectedRadio ===>>>  $selectedRadio");
//                },
//              )),
//        ],
//      ),
//    );
//  }
//}
//
//class NumberList {
//  String number;
//  int index;
//  NumberList({this.number, this.index});
//}

import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
        debugShowCheckedModeBanner: false);
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _stackIndex = 0;

  String _singleValue = "Text alignment right";

  String _verticalGroupValue = "Pending";
  List<String> _status = ["Pending", "Released", "Blocked"];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Radio button group example"),
    ),
    body: IndexedStack(
      index: _stackIndex,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RadioButton(
              description: "Text alignment right",
              value: "Text alignment right",
              groupValue: _singleValue,
              onChanged: (value) => setState(
                    () => _singleValue = value,
              ),
            ),
            RadioButton(
              description: "Text alignment left",
              value: "Text alignment left",
              groupValue: _singleValue,
              onChanged: (value) => setState(
                    () => _singleValue = value,
              ),
              textPosition: RadioButtonTextPosition.left,
            ),
          ],
        ),
        Column(
          children: <Widget>[
            RadioGroup<String>.builder(
              groupValue: _verticalGroupValue,
              onChanged: (value) => setState(() {
                _verticalGroupValue = value;
              }),
              items: _status,
              itemBuilder: (item) => RadioButtonBuilder(
                item,
              ),
            ),
            RadioGroup<String>.builder(
              groupValue: _verticalGroupValue,
              onChanged: (value) => setState(() {
                _verticalGroupValue = value;
              }),
              items: _status,
              itemBuilder: (item) => RadioButtonBuilder(
                item,
                textPosition: RadioButtonTextPosition.left,
              ),
            ),
          ],
        ),
        RadioGroup<String>.builder(
          direction: Axis.horizontal,
          groupValue: _verticalGroupValue,
          onChanged: (value) => setState(() {
            _verticalGroupValue = value;
          }),
          items: _status,
          itemBuilder: (item) => RadioButtonBuilder(item,
          ),
        ),
      ],
    ),
    bottomNavigationBar: BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          title: Text("Single"),
          icon: Icon(
            Icons.radio_button_checked,
          ),
        ),
        BottomNavigationBarItem(
          title: Text("Vertical"),
          icon: Icon(
            Icons.list,
          ),
        ),
        BottomNavigationBarItem(
          title: Text("Horizontal"),
          icon: Icon(
            Icons.linear_scale,
          ),
        ),
      ],
      currentIndex: _stackIndex,
      onTap: (index) => setState(
            () => _stackIndex = index,
      ),
    ),
  );
}
