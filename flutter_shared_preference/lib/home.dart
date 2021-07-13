import 'package:flutter/material.dart';
import 'package:flutter_shared_preference/storageUtil.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Future<void> initState(){
    super.initState();

    getUserPermission();
  }

  void getUserPermission() async {
    await StorageUtil.getInstance();
  }
  final myController = TextEditingController();
  var savedString = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences'),
      ),
      body: Container(
        padding: EdgeInsets.all(20).add(EdgeInsets.only(top: 20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your message',
                ),
                controller: myController,
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              child:RaisedButton(
                onPressed: (){
                 StorageUtil.putString("myString", myController.text);
                 myController.clear();
                },
                textColor: Colors.white,
                color: Colors.blue,
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  "Save String",
                ),
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              child:RaisedButton(
                onPressed: (){
                  setState(() {
                    savedString = StorageUtil.getString("myString");
                  });
                },
                textColor: Colors.white,
                color: Colors.red,
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  "Get String",
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text(savedString, style: TextStyle(color: Colors.black),),
          ],
        ),
      ),
    );
  }
}
