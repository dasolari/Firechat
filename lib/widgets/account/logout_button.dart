import 'package:flutter/material.dart';
import 'package:firechat/services/auth.dart';
import 'package:firechat/widgets/account/card_loader.dart';


class LogoutButton extends StatefulWidget {
  @override
  _LogoutButtonState createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  final AuthService _auth = AuthService();
  bool _loading = false;

  void _signOut() {
    setState(() => _loading = true);
    new Future.delayed(
      const Duration(milliseconds: 1500), 
      () async {
        await _auth.signOut();
        setState(() => _loading = false);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return CardLoader();
    }
    return Card(
      child: ListTile(
        horizontalTitleGap: 10.0,
        leading: Icon(
          Icons.logout,
          color: Colors.black,
        ),
        title: Text(
          'Logout',
          style: TextStyle(fontSize: 18.0),
        ),
        onTap: _signOut,
      ),
    );
  }
}