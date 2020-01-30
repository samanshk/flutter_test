import 'package:flutter/material.dart';

import 'Roller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice roller',
      theme: ThemeData(),
      home: Roller(),
    );
  }
}