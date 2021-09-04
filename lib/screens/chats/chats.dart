import 'package:flutter/material.dart';


class Chats extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => Chats(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chats',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 8,
      ),
      body: Center(
        child: Text('Hello, Chats'),
      ),
    );
  }
}