import 'dart:math';

import 'package:flutter/material.dart';

class Roller extends StatefulWidget {
  @override
  _RollerState createState() => _RollerState();
}

class _RollerState extends State<Roller> {
  var num = 1;
   


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Image.asset('assets/dice$num.png', height: 300, width: 300,),
              onTap: () {
                setState(() {
                  num = Random().nextInt(6)+1;
                });  
              }
            )
          ],
        ),
      ),
    );
  }
}