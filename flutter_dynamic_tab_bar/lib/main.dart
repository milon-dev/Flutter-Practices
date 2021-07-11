import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  List<String> tabList = ['One', 'Two', 'Three'];
  List<Tab> _tabs = List<Tab>();
  List<Widget> _generalWidgets = List<Widget>();
  TabController _tabController;

  @override
  void initState() {
    _tabs = getTabs(tabList);
    _tabController = getTabController();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic TabBar"),
        bottom: TabBar(
          tabs: _tabs,
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: getWidgets(),
      ),
    );
  }

  TabController getTabController() {
    return TabController(length: _tabs.length, vsync: this);
  }


  List<Tab> getTabs(List<String> tabList) {
    _tabs.clear();
    for (int i = 0; i < tabList.length; i++) {
      _tabs.add(getTab(tabList[i]));
    }
    return _tabs;
  }

  Tab getTab(String widgetNumber) {
    return Tab(
      text: "$widgetNumber",
    );
  }

  List<Widget> getWidgets() {
    _generalWidgets.clear();
    for (int i = 0; i < tabList.length; i++) {
      _generalWidgets.add(getWidget(tabList[i]));
    }
    return _generalWidgets;
  }

  Widget getWidget(String widgetNumber) {
    return Center(
      child: Text("Widget Number : $widgetNumber"),
    );
  }
}



//void main() {
//  runApp(new MaterialApp(
//    title: 'Flutter Tutorial',
//    home: new TabDream11(),
//  ));
//}
//class TabDream11 extends StatefulWidget {
//  @override
//  _TabDream11State createState() => _TabDream11State();
//}
//class _TabDream11State extends State<TabDream11> with SingleTickerProviderStateMixin {
//  List<String> categories = ["All", "Today"];
//  TabController tabController;
//  TextStyle tabStyle = TextStyle(fontSize: 16);
//  @override
//  void initState() {
//    super.initState();
//    tabController = TabController(length: categories.length, vsync: this, initialIndex: 0);
//  }
//  tabCreate() {
//    return CustomScrollView(
//      slivers: <Widget>[
//        SliverFillRemaining(
//          child: Scaffold(
//            backgroundColor: Colors.white70,
//            appBar: TabBar(
//              indicatorColor: Colors.blue,
//              labelColor: Colors.black,
//              unselectedLabelColor: Colors.black54,
//              controller: tabController,
//              isScrollable: false,
//              tabs: List<Widget>.generate(categories.length, (int index) {
//                return new Tab(
//                    child: Text(categories[index],
//                        style: TextStyle(
//                            fontWeight: FontWeight.w500, fontSize: 15.0)));
//              }),
//            ),
//            body: TabBarView(
//                controller: tabController,
//                children: List<Widget>.generate(
//                    categories.length, (int index) {
//                  return new Text(categories[index]);
//                })),
//          ),
//        ),
//      ],
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: const Text('Flutter Tab Dynamic'),
//        ),
//        body: tabCreate());
//  }
//
//}