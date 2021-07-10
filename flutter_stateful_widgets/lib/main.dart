import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        title: "Sateful App Example",
        home: FavoriteCity(),
      )
  );
}

class FavoriteCity extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _FavoriteCityState();
  }
}

class _FavoriteCityState extends State<FavoriteCity> {
  var _currencies = ['Taka', 'Dollars', 'Pounds', 'Others'];
  var _currentItemSelected = 'Taka';
  @override
  Widget build(BuildContext context) {

    print("Widget is created");

    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful App Example"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            DropdownButton<String>(
              items: _currencies.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              value: _currentItemSelected,

              onChanged: (String newValueSelected) {
                _onDropDownItemSelected(newValueSelected);
              },
            ),
            Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "Your Currency $_currentItemSelected",
                  style: TextStyle(fontSize: 20.0),
                ))
          ],
        ),
      ),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
}


