import 'package:flutter/material.dart';

//Container,padding,margin, Custom Fonts, Text Style
/*class MyApp extends StatelessWidget {
  final barColor = const Color(0xFF74B9FF);
  final bgColor = const Color(0xFFDAE0E2);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            backgroundColor: barColor,
            title: Text("Flutter Stateless Widgets"),
          ),
          body: Center(
            child: Container(
              alignment: Alignment.center,
              color: Colors.indigo[300],
              width: 200.0,
              height: 100.0,
              margin: EdgeInsets.all(20.0),
              margin: EdgeInsets.only(left: 20.0),
              padding: EdgeInsets.all(200.0),
              padding: EdgeInsets.only(left: 50.0),
              child: new Text(
                "Flutter Widgets",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 50.0,
                  fontFamily: 'DancingScript',
                ),
              ),
            ),
          ),
        ));
  }
}*/

//  Column, Row,  Image Asset, Button, AlertDialog
/*class MyApp extends StatelessWidget {
  final barColor = const Color(0xFF74B9FF);
  final bgColor = const Color(0xFFDAE0E2);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            backgroundColor: barColor,
            title: Text("Flutter Stateless Widgets"),
          ),
          body: Center(
            child: Container(
                alignment: Alignment.center,
                color: Colors.indigo[300],
                padding: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          "C: 0, R: 0",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 35.0,
                            fontFamily: 'DancingScript',
                          ),
                        )),
                        Expanded(
                            child: Text(
                          "Beginners using Dart",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 25.0,
                            fontFamily: 'Roboto',
                          ),
                        )),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          "C: 1, R: 0",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 35.0,
                            fontFamily: 'DancingScript',
                          ),
                        )),
                        Expanded(
                            child: Text(
                          "Develop Android and iOS mobile app",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 25.0,
                            fontFamily: 'Roboto',
                          ),
                        )),
                      ],
                    ),
                    MyImage(),
                    MyButton(),
                  ],
                )),
          ),
        ));
  }
}

class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/logo.jpg');
    Image image = Image(
      image: assetImage,
      width: 200.0,
      height: 200.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.only(top: 20.0),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30.0),
        width: 250.0,
        height: 70.0,
        child: RaisedButton(
            color: Colors.deepOrange,
            child: Text(
              "Book",
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 30.0,
                fontFamily: 'Roboto',
              ),
            ),
            elevation: 6.0,
            onPressed: () => openDialog(context)));
  }

  void openDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("This is title"),
      content: Text("This is message"),
    );

    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }
}
*/

//Small ListView
class MyApp extends StatelessWidget {
  final barColor = const Color(0xFF74B9FF);
  final bgColor = const Color(0xFFDAE0E2);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            backgroundColor: barColor,
            title: Text("Flutter Basic ListView"),
          ),
          body: getListView(),
        ));
  }

  Widget getListView(){

    var listView= ListView(
      children: <Widget>[
        ListTile(
          leading:  Icon(Icons.landscape),
          title: Text("Landscape"),
          subtitle: Text("Beautyful View !"),
          trailing: Icon(Icons.wb_sunny),
        ),

        ListTile(
          leading:  Icon(Icons.laptop_chromebook),
          title: Text("Windows"),
          trailing: Icon(Icons.wb_sunny),
        ),

        ListTile(
          leading:  Icon(Icons.phone),
          title: Text("Phone"),
          subtitle: Text("Call for details"),
        ),

        Text("Another Eliment"),
        Container(color: Colors.red, height: 70.0)
         
      ],

    );

    return listView;
  }
}

//Long ListView, Floating Action Button, Snack Bar
/*class MyApp extends StatelessWidget {
  final barColor = const Color(0xFF74B9FF);
  final bgColor = const Color(0xFFDAE0E2);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            backgroundColor: barColor,
            title: Text("Flutter Long ListView"),
          ),
          body: getListView(),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            tooltip: "Add one more item",
            onPressed: (){

            },
          ),
        ));
  }

  List<String> getListElements(){
    var items = List<String>.generate(1000, (counter)=>"Item $counter");
    return items;
  }

  Widget getListView(){

    var listItems = getListElements();

    var listView= ListView.builder(
      itemBuilder: (context, index){
        return ListTile(
          leading:  Icon(Icons.account_circle),
          title: Text(listItems[index]),
          trailing: Icon(Icons.wb_sunny),
          onTap: (){
            showSnackBar(context,listItems[index]);
          },
        );
      },
    );

    return listView;
  }

  void showSnackBar(BuildContext context, String item){
    var snackBar = SnackBar(
        content: Text("You just tapped $item"),
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }

}
*/