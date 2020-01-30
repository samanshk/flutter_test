import 'package:flutter/material.dart';
import 'Home.dart';
import 'Login.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var user;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  getUser() async {    
    user = await _auth.currentUser();
  }
  @override
  void initState() {
    getUser();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentication',
      theme: ThemeData(),
      home: user == null ? Login() : Home(user.email),
    );
  }
}

