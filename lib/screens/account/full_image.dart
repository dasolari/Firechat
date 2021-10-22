import 'package:flutter/material.dart';


class FullImageScreen extends StatelessWidget {
  const FullImageScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Profile Picture',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        elevation: 8,
      ),
      body: Hero(
        tag: 'profile-photo',
        child: Center(
          child: Image.asset(
            'lib/assets/images/GenericAvatar.png',
            width: 1000,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}