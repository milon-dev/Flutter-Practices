import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('JSON Spinner')),
        body: JsonSpinner(),
      ),
    );
  }
}

class JsonSpinner extends StatefulWidget {
  JsonSpinnerWidget createState() => JsonSpinnerWidget();
}

class JsonSpinnerWidget extends State<JsonSpinner> {
  String selectedSpinnerItem = 'Eliseo@gardner.biz';
  List data = List();
  Future myFuture;

  final String url= 'https://files.milonsheikh.com/comments.json';

  Future<String> fetchData() async {
    var response = await http.get(url);

    print("response =========>>>> $response");

    if (response.statusCode == 200) {
      var res = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
      var resBody = json.decode(res.body);

      print("resBody =========>>>> $resBody");

      setState(() {
        data = resBody;
      });

      return "Loaded Successfully";
    } else {
      throw Exception('Failed to load data.');
    }
  }

  @override
  void initState() {
    myFuture = fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: myFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
          return Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton(
                        items: data.map((item) {
                          return DropdownMenuItem(
                            child: Text(item['email']),
                            value: item['email'],
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            selectedSpinnerItem = newVal;
                          });
                        },
                        value: selectedSpinnerItem,
                      ),
                      Text(
                        'Selected Item = ' + '$selectedSpinnerItem',
                        style: TextStyle(fontSize: 22, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ])),
          );
        });
  }
}