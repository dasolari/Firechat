import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => Home(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 8,
      ),
      body: Center(
        child: Text('Hello, Home'),
      ),
    );
  }
}