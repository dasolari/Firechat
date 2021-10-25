import 'package:flutter/material.dart';

class PanelInfo extends StatelessWidget {

  final List<Widget> friends = [
    Card(
      child: ListTile(
        leading: Icon(Icons.account_circle_rounded, size: 30.0),
        title: Text('Joe Mama'),
        enableFeedback: true,
        enabled: true,
        focusColor: Colors.amber,
        onTap: () { },
      ),
    ),
    Card(
      child: ListTile(
        leading: Icon(Icons.account_circle_rounded, size: 30.0),
        title: Text('Deez Nuts'),
      ),
    ),
    Card(
      child: ListTile(
        leading: Icon(Icons.account_circle_rounded, size: 30.0),
        title: Text('Ma man'),
      ),
    ),
    Card(
      child: ListTile(
        leading: Icon(Icons.account_circle_rounded, size: 30.0),
        title: Text('Batman'),
      ),
    ),
    Card(
      child: ListTile(
        leading: Icon(Icons.account_circle_rounded, size: 30.0),
        title: Text('Betty Bought a bit of Butter'),
      ),
    ),
    Card(
      child: ListTile(
        leading: Icon(Icons.account_circle_rounded, size: 30.0),
        title: Text('Ivan'),
      ),
    ),
    Card(
      child: ListTile(
        leading: Icon(Icons.account_circle_rounded, size: 30.0),
        title: Text('John Snow or Start, idk'),
      ),
    ),
    Card(
      child: ListTile(
        leading: Icon(Icons.account_circle_rounded, size: 30.0),
        title: Text('Mooncake'),
      ),
    ),
    Card(
      child: ListTile(
        leading: Icon(Icons.account_circle_rounded, size: 30.0),
        title: Text('The Pontiac Bandit'),
      ),
    ),
    Card(
      child: ListTile(
        leading: Icon(Icons.account_circle_rounded, size: 30.0),
        title: Text('Jhon Mayer'),
      ),
    ),
    Card(
      child: ListTile(
        leading: Icon(Icons.account_circle_rounded, size: 30.0),
        title: Text('Donald The Duck'),
      ),
    ),
    Card(
      child: ListTile(
        leading: Icon(Icons.account_circle_rounded, size: 30.0),
        title: Text('Homelander'),
      ),
    ),
    Card(
      child: ListTile(
        leading: Icon(Icons.account_circle_rounded, size: 30.0),
        title: Text('Wario'),
      ),
    ),
    Card(
      child: ListTile(
        leading: Icon(Icons.account_circle_rounded, size: 30.0),
        title: Text('Vanoss'),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text('Chat with a Friend 🎉', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400)),
          SizedBox(height: 20.0),
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              // shrinkWrap: true,
              itemCount: friends.length,
              itemBuilder: (BuildContext context, int index) {
                return friends[index];
              }
            ),
          ),
        ],
      ),
    );
  }
}
