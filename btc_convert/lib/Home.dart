import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var amount = TextEditingController();
  var amt = '1';
  var inr = '', usd = '', jpy = '', eur = '', aud = '', cny = '';
  getData() async {
    var responseINR = await http.get(Uri.encodeFull('https://blockchain.info/tobtc?currency=INR&value=$amt'));
    var responseUSD = await http.get(Uri.encodeFull('https://blockchain.info/tobtc?currency=USD&value=$amt'));
    var responseJPY = await http.get(Uri.encodeFull('https://blockchain.info/tobtc?currency=JPY&value=$amt'));
    var responseEUR = await http.get(Uri.encodeFull('https://blockchain.info/tobtc?currency=EUR&value=$amt'));
    var responseAUD = await http.get(Uri.encodeFull('https://blockchain.info/tobtc?currency=AUD&value=$amt'));
    var responseCNY = await http.get(Uri.encodeFull('https://blockchain.info/tobtc?currency=CNY&value=$amt'));
    setState(() {
      inr = json.decode(responseINR.body).toString();
      usd = json.decode(responseUSD.body).toString();
      jpy = json.decode(responseJPY.body).toString();
      eur = json.decode(responseEUR.body).toString();
      aud = json.decode(responseAUD.body).toString();
      cny = json.decode(responseCNY.body).toString();
    });
  }
  
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Currency to Bitcoin'),),
      body: SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextField(
              controller: amount,
              decoration: InputDecoration(
                hintText: 'Enter amount'
              ),
              keyboardType: TextInputType.number,
            ),
            MaterialButton(
              child: Text('Convert', style: TextStyle(color: Colors.green, fontSize: 20)),
              
              onPressed: () {
                setState(() {
                  amt = amount.text;
                });
                getData();
              },
            ),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Currency', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  Text('Bitcoin', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
                ],
              )
            ),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('USD', style: TextStyle(fontSize: 30),),
                  Text(usd, style: TextStyle(fontSize: 30),)
                ],
              )
            ),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('INR', style: TextStyle(fontSize: 30),),
                  Text(inr, style: TextStyle(fontSize: 30),)
                ],
              )
            ),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('JPY', style: TextStyle(fontSize: 30),),
                  Text(jpy, style: TextStyle(fontSize: 30),)
                ],
              )
            ),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('EUR', style: TextStyle(fontSize: 30),),
                  Text(eur, style: TextStyle(fontSize: 30),)
                ],
              )
            ),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('AUD', style: TextStyle(fontSize: 30),),
                  Text(aud, style: TextStyle(fontSize: 30),)
                ],
              )
            ),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('CNY', style: TextStyle(fontSize: 30),),
                  Text(cny, style: TextStyle(fontSize: 30),)
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}