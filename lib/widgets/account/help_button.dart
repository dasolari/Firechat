import 'package:flutter/material.dart';


class HelpButton extends StatelessWidget {
  const HelpButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        horizontalTitleGap: 10.0,
        leading: Icon(
          Icons.help_center,
          color: Colors.black,
        ),
        title: Text(
          'Help',
          style: TextStyle(fontSize: 18.0),
        ),
        onTap: () {},
      ),
    );
  }
}