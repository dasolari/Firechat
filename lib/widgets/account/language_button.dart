import 'package:flutter/material.dart';


class LanguageButton extends StatelessWidget {
  const LanguageButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        horizontalTitleGap: 10.0,
        leading: Icon(
          Icons.language,
          color: Colors.black,
        ),
        title: Text(
          'Language',
          style: TextStyle(fontSize: 18.0),
        ),
        onTap: () {},
      ),
    );
  }
}