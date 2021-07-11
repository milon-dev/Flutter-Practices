import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
        actions: <Widget>[
          _threeItemPopup(),
//          PopupMenuButton<String>(
//            onSelected: handleClick,
//            color: Colors.red,
//            icon: Icon(Icons.more_vert, color: Colors.white),
//            itemBuilder: (BuildContext context) {
//              return {'Logout', 'Settings'}.map((String choice) {
//                return PopupMenuItem<String>(
//                  value: choice,
//                  child: Text(choice,style: TextStyle(color: Colors.white)),
//                );
//              }).toList();
//            },
//          ),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _simplePopup() => PopupMenuButton<int>(
    itemBuilder: (context) => [
      PopupMenuItem(
        value: 1,
        child: Text("First",style: TextStyle(color: Colors.white)),
      ),
      PopupMenuItem(
        value: 2,
        child: Text("Second",style: TextStyle(color: Colors.white)),
      ),
    ],
    onCanceled: () {
      print("You have canceled the menu.");
    },
    onSelected: (value) {
      print("value:$value");
    },
    icon: Icon(Icons.list),
    color: Colors.red,
  );

  Widget _threeItemPopup() => PopupMenuButton(
    itemBuilder: (context) {
      var list = List<PopupMenuEntry<Object>>();
      list.add(
        PopupMenuItem(
          value: 1,
          child: Text("First",style: TextStyle(color: Colors.white)),
        ),
      );

      list.add(
        PopupMenuDivider(
          height: 4,
        ),
      );

      list.add(
        PopupMenuItem(
          value: 2,
          child: Text("Second",style: TextStyle(color: Colors.white)),
        ),
      );
      return list;
    },
    icon: Icon(Icons.list),
    color: Colors.red,
    onCanceled: () {
      print("You have canceled the menu.");
    },
    onSelected: (value) {
      print("value:$value");
    },
  );

  void handleClick(String value) {
    switch (value) {
      case 'Logout':

        print("======Logout======");


        break;
      case 'Settings':

        print("======Settings======");

        break;
    }
  }
}
