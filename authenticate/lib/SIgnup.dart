import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Home.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var email = TextEditingController();
  var pass = TextEditingController();
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  signup() async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
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
            'Create an account',
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
            onPressed: () {signup();},
            child: Text('Sign up'),
            color: Colors.blue
          ),
          Padding(padding: EdgeInsets.all(20),),
          MaterialButton(
            onPressed: () {},
            child: Text('Login'),
            color: Colors.blue
          )
        ],
      ),
    );
  }
}