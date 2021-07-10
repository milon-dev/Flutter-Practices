import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Html Show"),
      ),
      body: Center(
           child:Center(
             child: SingleChildScrollView(
               child: Html(
                 data: """<div>Follow<a class='sup'><sup>pl</sup>
                 </a> 
                  Below
                <b>Bold</b>
                <h1>what was sent down to you from your Lord</h1>, 
                and do not follow other guardians apart from Him. Little do 
                <span class='h'>you remind yourselves</span><a class='f'><sup f=2437>1</sup></a></div>"""
               ),
             ),
           ),
      ),
    );
  }
}
