import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AutoComplete',
      home:  Scaffold(
        appBar: AppBar(
          title: const Text('AutoComplete'),
          backgroundColor: Colors.teal,
        ),
        body: Column(
          children: [
            AutoCompleteExample(),
          ],
        ),
      ),
    );
  }
}

final List<String> autoCompleteData = [
  'Afghanistan',
  'Albania',
  'Algeria',
  'Andorra',
  'Bahamas',
  'Bahrain',
  'Bangladesh',
  'Barbados',
  'Cambodia',
  'Cameroon',
  'Canada',
  'Chad'
];

class AutoCompleteExample extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _AutoCompleteExampleState();
}

class _AutoCompleteExampleState extends State<AutoCompleteExample> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text.isEmpty) {
            return const Iterable<String>.empty();
          } else {
            return autoCompleteData.where((word) =>
                word.toLowerCase()
                    .startsWith(textEditingValue.text.toLowerCase()));
          }
        },
        fieldViewBuilder: (
            BuildContext context,
            TextEditingController fieldTextEditingController,
            FocusNode fieldFocusNode,
            VoidCallback onFieldSubmitted
            ) {
          return TextField(
            controller: fieldTextEditingController,
            focusNode: fieldFocusNode,
            style: const TextStyle(fontWeight: FontWeight.bold),
          );
        },
        onSelected: (selection) {
          print('Selected: ${selection}');
        },
        optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
          return Align(
            alignment: Alignment.topLeft,
            child: Material(
              child: Container(
                color: Colors.teal,
                width: MediaQuery.of(context).size.width - 60,
                child: ListView.builder(
                  itemExtent: 40.0,
                  padding: EdgeInsets.all(5.0),
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final option = options.elementAt(index);
                    return GestureDetector(
                      onTap: () {
                        onSelected(option.toString());
                      },
                      child: ListTile(
                        title: Text(option.toString(), style: const TextStyle(color: Colors.white)),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}