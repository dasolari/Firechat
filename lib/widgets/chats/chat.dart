import 'package:flutter/material.dart';


class ChatTile extends StatelessWidget {
  final String name;

  ChatTile({ required this.name });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.account_circle_rounded, color: Colors.blue[400]),
      trailing: Icon(Icons.menu),
      title: Text(name),
      subtitle: Text('Last message...'),
      dense: true,
      onTap: () {},
    );
  }
}