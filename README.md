# custom_switch_lib

custom_switch_lib Package

Sample code 

import 'package:custom_switch_lib/custom_switch_lib.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Custom Switch Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Custom Switch Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String status = "In-Active";
  bool isEnable = false;
  bool isActiveValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$status',
            ),
            SizedBox(
              height: 10,
            ),
            CustomSwitch(
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
              value: isActiveValue,
              widht: 90,
              height: 40,
              circle_widht: 42,
              circle_height: 42,
              circle_radious: 42,
              enabled: isEnable,
              onChanged: (bool val) {
                setState(() {
                  if (val) {
                    status = "In-Active";
                    isEnable = !val;
                    isActiveValue = !val;
                  } else {
                    status = "Active";
                    isEnable = !val;
                    isActiveValue = !val;
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}


## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
