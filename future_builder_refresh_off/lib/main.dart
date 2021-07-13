import 'package:async/async.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomeScreen()
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _switchValue;
  Future myFuture;

  @override
  void initState() {

    this._switchValue = false;
    myFuture = fetchData();
    super.initState();

  }

  @override
  void didUpdateWidget(HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("<<<=== didUpdateWidget ===>>> ");
  }

  @override
  Widget build(BuildContext context) {
    print("<<<=== build ===>>> ");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Switch(
            value: this._switchValue,
            onChanged: (newValue) {
              setState(() {
                this._switchValue = newValue;
              });
            },
          ),

          FutureBuilder(
              future: myFuture,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                  print("<<<=== waiting ===>>> ");
                    return Center(
                        child: CircularProgressIndicator()
                    );
                  default:
                    print("<<<=== FutureBuilder ===>>> ");
                    return Center(
                        child: Text(snapshot.data)
                    );
                }
              }
          ),

        ],
      ),
    );
  }

  Future<String> fetchData() async {
    print("<<<=== fetchData ===>>> ");
    await Future.delayed(Duration(seconds: 5));
    return 'REMOTE DATA';
  }
}
