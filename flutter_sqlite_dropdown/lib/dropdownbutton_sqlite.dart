import 'dart:convert';
import 'package:flutter/material.dart';

import 'db_helper.dart';
import 'user_model.dart';

class SqliteDropdown extends StatefulWidget {
 @override
 SqliteDropdownState createState() {
   return new SqliteDropdownState();
 }
}

class SqliteDropdownState extends State<SqliteDropdown> {
 DatabaseHelper db = DatabaseHelper();

 UserModel _currentUser;
 String selectedValue="";

 _saveData() async {
   UserModel user1 = UserModel(
     "Milon Sheikh",
     "milon@gmail.com",
     "milon@gmail.com",
     "milonPass",
   );
   UserModel user2 = UserModel(
     "Kuddus",
     "Kuddus@gmail.com",
     "Kuddus@gmail.com",
     "KuddusPass",
   );

   await db.saveData(user1);
   await db.saveData(user2);
 }

 @override
 void initState() {
   super.initState();
   _saveData();
 }

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Sqlite Dropdown'),
     ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         mainAxisSize: MainAxisSize.max,
         children: <Widget>[
           FutureBuilder(
               future: db.getUserModelData(),
               builder: (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
//                  selectedValue=snapshot.data[0].name;
                 if (!snapshot.hasData) return CircularProgressIndicator();
                 return DropdownButton<UserModel>(
                   items: snapshot.data.map((user) => DropdownMenuItem<UserModel>(
                     child: Text(user.name),
                     value: user,
                   )).toList(),
                   onChanged: (UserModel value) {
                     setState(() {
                       _currentUser = value;
                       selectedValue=_currentUser.name;
                       print("onChanged selectedValue ===>>> ${selectedValue}");
                     });
                   },
                   isExpanded: false,
                   hint: Text('Select User'),
                  // value:selectedValue,
                 );
               }),

           SizedBox(height: 30.0),
           _currentUser != null
               ? Text(
             "Name: " +
                 _currentUser.name +
                 "\n Email: " +
                 _currentUser.email +
                 "\n Username: " +
                 _currentUser.username +
                 "\n Password: " +
                 _currentUser.password,
           )
               : Text("No User selected"),
         ],
       ),
     ),
   );
 }
}
