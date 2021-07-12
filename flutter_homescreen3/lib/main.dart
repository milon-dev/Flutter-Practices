import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Dashboard'),
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
  List<Items> myList = [];

  @override
  Future<void> initState() {
    super.initState();
    appStart();
  }

  void appStart() async {
    Items item1 = new Items(title: "Calendar", img: "assets/calendar.png");
    Items item2 = new Items(
      title: "Groceries",
      img: "assets/food.png",
    );
    Items item3 = new Items(
      title: "Locations",
      img: "assets/map.png",
    );
    Items item4 = new Items(
      title: "Activity",
      img: "assets/festival.png",
    );
    Items item5 = new Items(
      title: "To do",
      img: "assets/todo.png",
    );
    Items item6 = new Items(
      title: "Settings",
      img: "assets/setting.png",
    );
    myList = [item1, item2, item3, item4, item5, item6];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
//      body: Container(
//        padding: EdgeInsets.all(30.0),
//        child: GridView.count(
//          crossAxisCount: 2,
//          children: <Widget>[
//            MyMenu(title:"Balance",icon:Icons.account_balance,iconColor:Colors.brown),
//            MyMenu(title:"Information",icon:Icons.info_outline,iconColor:Colors.blue),
//            MyMenu(title:"Education",icon:Icons.school,iconColor:Colors.orange),
//            MyMenu(title:"Profile",icon:Icons.person_pin,iconColor:Colors.blueGrey),
//            MyMenu(title:"e-Learning",icon:Icons.local_library,iconColor:Colors.red),
//            MyMenu(title:"Preparation",icon:Icons.library_books,iconColor:Colors.teal),
//          ],
//        ),
//      ),

      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Flexible(
            child: GridView.count(
                padding: EdgeInsets.only(left: 10, right: 10),
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: myList.map((data) {
                  return InkWell(
                    onTap: () => print("Container pressed ===>>> ${data.title}"),
                    // handle your onTap here
                    splashColor: Colors.green,
                    child: Container(
                      child:Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 33,
                            backgroundColor: Colors.deepPurple,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(data.img),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            data.title,
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Colors.deepPurple, fontSize: 16)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  );
                }).toList()),
          )
        ],
      ),
    );
  }
}

class MainDashboard extends StatelessWidget {
  Items item1 = new Items(title: "Calendar", img: "assets/calendar.png");
  Items item2 = new Items(
    title: "Groceries",
    img: "assets/food.png",
  );
  Items item3 = new Items(
    title: "Locations",
    img: "assets/map.png",
  );
  Items item4 = new Items(
    title: "Activity",
    img: "assets/festival.png",
  );
  Items item5 = new Items(
    title: "To do",
    img: "assets/todo.png",
  );
  Items item6 = new Items(
    title: "Settings",
    img: "assets/setting.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    return Flexible(
      child: GridView.count(
          padding: EdgeInsets.only(left: 10, right: 10),
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: myList.map((data) {
            return InkWell(
              onTap: () => print("Container pressed : ${data.title}"),
              // handle your onTap here
              splashColor: Colors.green,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 33,
                      backgroundColor: Colors.deepPurple,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(data.img),
//                        backgroundImage: AssetImage("/data/user/0/com.milon.sbspropremium/app_flutter/images/recharge.png"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      data.title,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.deepPurple, fontSize: 16)),
                    ),
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}

class MyMenu extends StatelessWidget {
  MyMenu({this.title, this.icon, this.iconColor});

  final String title;
  final IconData icon;
  final MaterialColor iconColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        splashColor: Colors.green,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                size: 70.0,
                color: iconColor,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 18.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Items {
  String title;
  String img;

  Items({this.title, this.img});
}
