import 'package:flutter/material.dart';


class NotificationsButton extends StatelessWidget {
  const NotificationsButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        horizontalTitleGap: 10.0,
        leading: Icon(
          Icons.notifications,
          color: Colors.black,
        ),
        title: Text(
          'Notifications',
          style: TextStyle(fontSize: 18.0),
        ),
        onTap: () {},
      ),
    );
  }
}
