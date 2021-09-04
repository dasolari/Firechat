import 'package:flutter/material.dart';
import 'package:firechat/services/auth.dart';
import 'package:firechat/models/response.dart';
import 'package:firechat/widgets/shared/loading/loading_container.dart';
import 'package:firechat/widgets/shared/constants/auth_screen_box.dart'; 
import 'package:firechat/widgets/shared/status_handlers/snack_bar_status.dart'; 


class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _firstName = '';
  String _lastName = '';
  // ignore: unused_field
  String _confirmPassword = '';
  bool _loading = false;

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.red, Colors.orange, Colors.amber],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 400.0, 70.0));

  Future<void> _signUp() async {
    setState(() => _loading = true);
    if (_formKey.currentState!.validate()) {
      Response response = await _auth.registerWithEmailAndPassword(_email, _password, _firstName, _lastName);
      if (response.data == null) {
        statusHandler(context, response.message!, Status.ERROR);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: authScreenBoxDecoration,
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              foreground: Paint()..shader = linearGradient,
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) => value!.isEmpty ? 'Enter an email' : null,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autocorrect: false,
                  enableSuggestions: false,
                  onChanged: (value) {
                    setState(() => _email = value);
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  validator: (value) => value!.isEmpty ? 'Enter your first name' : null,
                  decoration: InputDecoration(
                    hintText: 'First Name',
                  ),
                  textAlign: TextAlign.center,
                  textInputAction: TextInputAction.next,
                  autocorrect: false,
                  enableSuggestions: false,
                  onChanged: (value) {
                    setState(() => _firstName = value);
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  validator: (value) => value!.isEmpty ? 'Enter your last name' : null,
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                  ),
                  textAlign: TextAlign.center,
                  textInputAction: TextInputAction.next,
                  autocorrect: false,
                  enableSuggestions: false,
                  onChanged: (value) {
                    setState(() => _lastName = value);
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  validator: (value) => value!.length < 6 ? 'Password must be 6+ characters' : null,
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                  textAlign: TextAlign.center,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    setState(() => _password = value);
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  validator: (value) => value != _password ? "Passwords don't match" : null,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                  ),
                  textAlign: TextAlign.center,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    setState(() => _confirmPassword = value);
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _signUp,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width, 45.0),
                    shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  child: _loading ? LoadingContainer(size: 30.0) : Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
