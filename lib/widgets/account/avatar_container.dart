import 'package:flutter/material.dart';
import 'package:firechat/screens/account/full_image.dart';


class AvatarContainer extends StatelessWidget {
  final String username;

  AvatarContainer({ required this.username });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Center(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FullImageScreen()),
                );
              },
              child: Hero(
                tag: 'profile-photo',
                child: CircleAvatar(
                  backgroundImage: AssetImage('lib/assets/images/GenericAvatar.png'),
                  radius: 80.0,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              username,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
