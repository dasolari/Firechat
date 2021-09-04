import 'package:flutter/material.dart';
import 'package:firechat/widgets/authenticate/sign_up.dart';
import 'package:firechat/widgets/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({ Key? key }) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool _isSigningIn = true;
  Widget _currentWidget = SignIn();

  void _toggleVisibility() {
    setState(() {
      if (_isSigningIn) {
        _currentWidget = SignUp();
      } else {
        _currentWidget = SignIn();
      }
      _isSigningIn = !_isSigningIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FireChat',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 8,
        actions: <Widget>[
          TextButton.icon(
            icon: _isSigningIn ?
              Icon(
                Icons.app_registration,
                color: Colors.white
              )
              :
              Icon(
                Icons.login, 
                color: Colors.white
              ),
            label: Text(
              _isSigningIn ? 'Sign Up' : 'Sign In',
              style: TextStyle(color: Colors.white)
            ),
            onPressed: _toggleVisibility,
          )
        ],
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 800),
        switchOutCurve: Curves.fastOutSlowIn,
        switchInCurve: Curves.fastOutSlowIn,
        transitionBuilder: (widget, animation) => RotationTransition(
          turns: animation,
          child: widget,
        ),
        child: _currentWidget,
      ),
    );
  }
}
