import 'package:flutter/material.dart';
import 'AppBar.dart';
import 'saleshomepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore Chart',
      theme: ThemeData(
        primaryColor: Color(0xff543B7A),
      ),
      home: AppbarMenu(),
      //home:SalesHomePage(),
    );
  }
}










