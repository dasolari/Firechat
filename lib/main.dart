import 'package:flutter/material.dart';
import 'package:firechat/config/firebase/firebase_builder.dart';


void main() => runApp(Firechat());

class Firechat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firechat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.orange[700],
        accentColor: Colors.amber[700],
        highlightColor: Colors.teal,
        ),
      home: FirebaseBuilder(),
    );
  }
}
