import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  var contacts = [];
 
  getContacts() async {
    var response = await http.get(Uri.encodeFull('http://userapi.tk/'));
    setState(() {
      contacts = json.decode(response.body);
    });
  }
  @override
  void initState() {
    getContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts'),),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(contacts[index]['ImageURL']),
                  ),
                  title: Text(contacts[index]['Name']),
                  subtitle: Text(contacts[index]['Mobile']),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          launch("tel:${contacts[index]['Mobile']}");
                        },
                        icon: Icon(Icons.phone),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          launch("sms:${contacts[index]['Mobile']}");
                        },
                        icon: Icon(Icons.sms),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}