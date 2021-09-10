import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:substring_highlight/substring_highlight.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Autocomplete validator',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _formKey = GlobalKey<FormState>();
  late TextEditingController controller;
  String textValue="";

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

  void validateAndSave() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        print('=======Form is valid========');
        textValue = controller.text.toString();
      });
      print("textValue ========>>> $textValue");
    } else {
      print('=======Form is invalid========');
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Autocomplete validator"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              Autocomplete(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<String>.empty();
                  } else {
                    return autoCompleteData.where((word) =>
                        word.toLowerCase()
                            .startsWith(textEditingValue.text.toLowerCase()));
                  }
                },
                optionsViewBuilder:(context, Function(String) onSelected, options) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      elevation: 4,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 80,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xffb072c8).withOpacity(0.8),
                                Color(0xff6E48AA).withOpacity(0.9),
                              ],
                            )),
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: options.length,
                          itemBuilder: (context, index) {
                            final option = options.elementAt(index);
                            return GestureDetector(
                              onTap: () {
                                onSelected(option.toString());
                              },
                              child: Container(
                                padding: EdgeInsets.fromLTRB(5, 15.0, 5, 15.0),
                                child: SubstringHighlight(
                                  textAlign: TextAlign.left,
                                  text: option.toString(),
                                  term: controller.text,
                                  textStyleHighlight: TextStyle(fontWeight: FontWeight.w800,fontSize: 18.0, color: Colors.white),
                                  textStyle:TextStyle(fontWeight: FontWeight.w500,fontSize: 16.0, color:Colors.white),
                                ),
                              ),
                            );
                          },
                          // The separators
                          separatorBuilder: (context, index) {
                            return Divider(
                              color:Colors.white,
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
                onSelected: (selectedString) {
                  print(selectedString);
                },
                fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
                  this.controller = controller;
                  return TextFormField(
                    controller: controller,
                    focusNode: focusNode,
                    onEditingComplete: onEditingComplete,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter country name';
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[500]!),
                      ),
                      hintText: "Country name",
                      errorStyle: TextStyle(color:Colors.red, fontSize: 16.0),
                    ),

                  );
                },
              ),
              SizedBox(
                height: 40,
              ),
              RaisedButton(
                child: Text('Submit'),
                onPressed: validateAndSave,
              ),
              SizedBox(
                height: 30,
              ),
              Text(textValue,
                style:TextStyle(fontWeight: FontWeight.w500,fontSize: 16.0, color:Colors.black),)
            ],
          ),
        ),
      ),
    );
  }
}
