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
      home: TableView(),
    );
  }
}

class TableView extends StatefulWidget {
  @override
  _TableViewState createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  List rowHeaders = new List();
  List columnHeaders = new List();
  Map selected = new Map();

  @override
  void initState() {
    super.initState();
    saveHeaders(); //Iterate and store all Row and column Headers
  }

  saveHeaders() {
    //Saving All Headers
    columnHeaders.addAll(["Excellent", "Very Good", "Good", "Poor"]);
    rowHeaders.addAll(["MTN", "Vodafone", "Tigo", "Expresso", "Glo"]);
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: new Text("TableView"),
        ),
        body: new OrientationBuilder(builder: (context, orientation) {
          return Center(
              child: SingleChildScrollView(
                scrollDirection: orientation ==
                    Orientation
                        .portrait //Handle Scroll when Orientation is changed
                    ? Axis.horizontal
                    : Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      color: Colors.blueGrey[200],
                      padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                      alignment: FractionalOffset.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //headers
                          new Container(
                            margin: EdgeInsets.all(0.0),
                            child: new Row(
                                children: [
                                  new Container(
                                    alignment: FractionalOffset.center,
                                    width: 140.0,
                                    margin: EdgeInsets.all(0.0),
                                    padding: const EdgeInsets.only(
                                        top: 5.0, bottom: 5.0, right: 3.0, left: 3.0),
                                    child: Text(
                                      //Leave an empty text in Row(0) and Column (0)
                                      "",
                                      style: TextStyle(color: Colors.grey[800]),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ]..addAll(columnHeaders
                                    .map((header) => new Container(
                                  alignment: FractionalOffset.center,
                                 width: 120.0,
                                  margin: EdgeInsets.all(0.0),
                                  padding: const EdgeInsets.only(
                                      top: 5.0,
                                      bottom: 5.0,
                                      right: 3.0,
                                      left: 3.0),
                                  child: new Text(
                                    header,
                                    style:
                                    TextStyle(color: Colors.grey[800]),
                                    textAlign: TextAlign.center,
                                  ),
                                ))
                                    .toList())),
                          ),
                        ],
                      ),
                    )
                  ]..addAll(createRows()), //Create Rows
                ),
              ));
        }));
  }

  List<Widget> createRows() {
    List<Widget> allRows = new List(); //For Saving all Created Rows

    for (int i = 0; i < rowHeaders.length; i++) {
      List<Widget> singleRow = new List(); //For creating a single row
      for (int j = 0; j < columnHeaders.length; j++) {
        singleRow.add(Container(
            alignment: FractionalOffset.center,
            width: 120.0,
            padding: const EdgeInsets.only(
                top: 6.0, bottom: 6.0, right: 3.0, left: 3.0),
            child: Radio(
              value: j, //Index of created Radio Button
              groupValue: selected[rowHeaders[i]] !=
                  null //If groupValue is equal to value, the radioButton will be selected
                  ? selected[rowHeaders[i]]
                  : "",
              onChanged: (value) {
                this.setState(() {
                  selected[rowHeaders[i]] =
                      value; //Adding selected rowName with its Index in a Map tagged "selected"
                  print("${rowHeaders[i]} ==> $value");
                });
              },
            )));
      }
      //Adding single Row to allRows widget
      allRows.add(new Container(
          child: new Row(
            children: [
              new Container(
                alignment: FractionalOffset.centerLeft,
                width: 140.0,
                padding: const EdgeInsets.only(
                    top: 6.0, bottom: 6.0, right: 3.0, left: 10.0),
                child:
                Text(rowHeaders[i], style: TextStyle(color: Colors.grey[800])),
              )
            ]..addAll(singleRow), //Add single row here
          )));
    }
    return allRows; //Return all single rows
  }
}
