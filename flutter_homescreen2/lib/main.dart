import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter dashboard',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Dashboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green[700],
      ),
      backgroundColor: Colors.green[100],
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[

              MyMenu(title:"Balance",icon:Icons.account_balance,iconColor:Colors.brown),
              MyMenu(title:"Information",icon:Icons.info_outline,iconColor:Colors.blue),
              MyMenu(title:"Education",icon:Icons.school,iconColor:Colors.orange),
              MyMenu(title:"Profile",icon:Icons.person_pin,iconColor:Colors.blueGrey),
              MyMenu(title:"e-Learning",icon:Icons.local_library,iconColor:Colors.red),
              MyMenu(title:"Preparation",icon:Icons.library_books,iconColor:Colors.teal),


          ],

        ),
      ),
    );
  }
}

class MyMenu extends StatelessWidget {
  MyMenu({this.title,this.icon,this.iconColor});

  final String title;
  final IconData icon;
  final MaterialColor iconColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){},
        splashColor: Colors.green,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon, size: 70.0, color: iconColor,),
              Text(title, style: TextStyle(fontSize: 18.0),)
            ],
          ),
        ),
      ),
    );
  }
}

