import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(
    new MaterialApp(home: new MyApp()),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  initState() {
    super.initState();

    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

    var initializationSettingsAndroid = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = new IOSInitializationSettings();

    var initializationSettings = new InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,onSelectNotification: onSelectNotification);

  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Plugin example app'),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              // new RaisedButton(
              //   onPressed: _showNotificationWithSound,
              //   child: new Text('Show Notification With Sound'),
              // ),
              // new SizedBox(
              //   height: 30.0,
              // ),
              // new RaisedButton(
              //   onPressed: _showNotificationWithoutSound,
              //   child: new Text('Show Notification Without Sound'),
              // ),
              // new SizedBox(
              //   height: 30.0,
              // ),
              new RaisedButton(
                onPressed: _showNotificationWithDefaultSound,
                child: new Text('Show Notification With Default Sound'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method 2
  Future _showNotificationWithDefaultSound() async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'New Post',
      'How to Show Notification in Flutter',
      platformChannelSpecifics,
      payload: 'Show Message',
    );
  }

  Future onSelectNotification(String payload) async {
    print("One clicked");
    showDialog(
      context: context,
      builder: (_) {
        return new AlertDialog(
          title: Text("Dialog"),
          content: Text("Notice : $payload"),
        );
      },
    );
  }
}