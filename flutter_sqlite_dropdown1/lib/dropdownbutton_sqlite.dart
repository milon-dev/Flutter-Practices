import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'food_store/db_helper.dart';
import 'food_store/user_model.dart';

class SqliteDropdown extends StatefulWidget {
 @override
 SqliteDropdownState createState() {
   return new SqliteDropdownState();
 }
}

class SqliteDropdownState extends State<SqliteDropdown> {
 DatabaseHelper db = DatabaseHelper();

 //Add data to db
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

 UserModel _currentUser;
 String selectedValue="";

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


// class CheckOut extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
// class _MyAppState extends State<CheckOut> {
//   String _mySelection;
//   final String url= 'https://files.milonsheikh.com/users.json';
//   List data;
//
//   Future<String> getSWData() async {
//
//     var res = await http.get(Uri.encodeFull(url));
//     var resBody = json.decode(res.body);
//     setState(() {
//       data = resBody;
//     });
//     return 'Success';
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     this.getSWData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.0,
//         backgroundColor: Colors.transparent,
//         iconTheme: IconThemeData.fallback(),
//         title: Text('CheckOut', style: TextStyle(color: Colors.black)),
//         centerTitle: true,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Align(
//             alignment: Alignment.topCenter,
//             child: Container(
//               alignment: Alignment.center,
//               height: 80.0,
//               width: double.infinity,
//               color: Colors.white,
//               child: Column(
//                 children: <Widget>[
//                   new Text(
//                     'Select Customer Name',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
//                   ),
//                   SizedBox(
//                     height: 5.0,
//                   ),
//                   DropDown(data),
//                 ],
//               ),
//
//             ),
//           ),
//           Expanded(
//             child: Container(
//               alignment: Alignment.center,
//               color: Colors.white,
//               child: Text(
//                 '',
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               margin: EdgeInsets.only(bottom:20.0,left: 10.0,right: 10.0 ),
//               alignment: Alignment.center,
//               height: 50.0,
//               width: double.infinity,
//               color: Colors.white,
//
//               child: new FlatButton(
//                 shape: new RoundedRectangleBorder(
//                   borderRadius: new BorderRadius.circular(30.0),
//                 ),
//                 color: Colors.red,
//                 onPressed: ()  {
//
//                 },
//                 child: new Center(
//                   child: new Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       new Expanded(
//                         child: Text(
//                           "Place Order",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18.0,fontWeight:FontWeight.bold),
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
//
//
//   Widget DropDown(List data) {
//     if(data!=null)
//     {
//       return DropdownButton(
//         items: data.map((item) {
//           return new DropdownMenuItem(
//             child: new Text(
//               item['name'],
//               style: TextStyle(fontSize: 14.0),
//             ),
//             value: item['name'].toString(),
//           );
//         }).toList(),
//         hint: Text(
//           "Please select the Customer Name",
//           style: TextStyle(
//             color: Colors.black45,
//           ),),
//         onChanged: (newVal) {
//           setState(() {
//             _mySelection = newVal;
//             print('customrid:' + _mySelection);
//           });
//         },
//         value: _mySelection,
//       );
//     }
//     else{
//       return new Center(
//         child: CircularProgressIndicator(),
//       );
//     }
//   }
// }

