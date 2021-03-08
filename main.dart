import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'dummy.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: IconButton(
          icon: Icon(Icons.android),
          iconSize: 60.0,
          color: Colors.green,
          onPressed: (){
            Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => DummyPage(),
                ),
            );
          },
        ),
      ),
    );
  }
}
