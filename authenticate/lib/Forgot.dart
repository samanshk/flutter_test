import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Forgot extends StatefulWidget {
  @override
  _ForgotState createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  var email = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
          controller: email,
          decoration: InputDecoration(
            hintText: 'Enter your email id'
          ),),
          Padding(padding: EdgeInsets.all(20),),
          MaterialButton(
            onPressed: () async {
              await _auth.sendPasswordResetEmail(email: email.text);              
            },
            child: Text('Proceed'),
            color: Colors.blue
          )
        
        ],
        
      ),
    );
  }
}