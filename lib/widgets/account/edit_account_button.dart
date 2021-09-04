import 'package:flutter/material.dart';


class EditAccountButton extends StatelessWidget {
  const EditAccountButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        horizontalTitleGap: 10.0,
        leading: Icon(
          Icons.edit,
          color: Colors.black,
        ),
        title: Text(
          'Edit Account',
          style: TextStyle(fontSize: 18.0),
        ),
        onTap: () {},
      ),
    );
  }
}