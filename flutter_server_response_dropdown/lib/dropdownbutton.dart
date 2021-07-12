import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<CheckOut> {
  String _mySelection;
  final String url= 'https://files.milonsheikh.com/users.json';
  List data;

  Future<String> getSWData() async {

    var res = await http.get(Uri.encodeFull(url));
    var resBody = json.decode(res.body);
    setState(() {
      data = resBody;
    });
    return 'Success';
  }

  @override
  void initState() {
    super.initState();
    this.getSWData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData.fallback(),
        title: Text('CheckOut', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              alignment: Alignment.center,
              height: 80.0,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  new Text(
                    'Select Customer Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  DropDown(data),
                ],
              ),

            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: Text(
                '',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom:20.0,left: 10.0,right: 10.0 ),
              alignment: Alignment.center,
              height: 50.0,
              width: double.infinity,
              color: Colors.white,

              child: new FlatButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                color: Colors.red,
                onPressed: ()  {

                },
                child: new Center(
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Expanded(
                        child: Text(
                          "Place Order",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,fontWeight:FontWeight.bold),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }


  Widget DropDown(List data) {
    if(data!=null)
    {
      return DropdownButton(
        items: data.map((item) {
          return new DropdownMenuItem(
            child: new Text(
              item['name'],
              style: TextStyle(fontSize: 14.0),
            ),
            value: item['name'].toString(),
          );
        }).toList(),
        hint: Text(
          "Please select the Customer Name",
          style: TextStyle(
            color: Colors.black45,
          ),),
        onChanged: (newVal) {
          setState(() {
            _mySelection = newVal;
            print('customrid:' + _mySelection);
          });
        },
        value: _mySelection,
      );
    }
    else{
      return new Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}

