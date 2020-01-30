import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'SIgnup.dart';
import 'Home.dart';
import 'Forgot.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email = TextEditingController();
  var pass = TextEditingController();
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  login() async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
      email: email.text,
      password: pass.text,
    )).user;

    print(user.email);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user.email)));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Login',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)
          ),
          Padding(padding: EdgeInsets.all(20),),
          TextField(
            controller: email,
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Email'
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Forgot()));
            },
            child: Text(
              'Forgot password',
              style: TextStyle(
                color: Colors.blue
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(10),),
          TextField(
            controller: pass,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              hintText: 'Password'
            ),
            obscureText: true,
          ),
          Padding(padding: EdgeInsets.all(20),),
          MaterialButton(
            onPressed: () {login();},
            child: Text('Login'),
            color: Colors.blue
          ),
          Padding(padding: EdgeInsets.all(20),),
          MaterialButton(
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));},
            child: Text('Create an account'),
            color: Colors.blue
          )
        ],
      ),
    );
  }
}