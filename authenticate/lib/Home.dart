import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  var txt;
  Home(this.txt);
  @override
  _HomeState createState() => _HomeState(txt);
}

class _HomeState extends State<Home> {
  var txt;
  _HomeState(this.txt);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            txt,
            style: TextStyle(fontSize: 50)
          )
        ],
      ),
    );
  }
}