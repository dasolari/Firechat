import 'package:flutter/material.dart';
import 'package:firechat/services/auth.dart';
import 'package:firechat/models/response.dart';
import 'package:firechat/widgets/shared/loading/loading_container.dart';
import 'package:firechat/widgets/shared/constants/auth_screen_box.dart'; 
import 'package:firechat/widgets/shared/status_handlers/snack_bar_status.dart'; 


class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _loadingAnonymously = false;
  bool _loadingWithEmail = false;

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.amber, Colors.orange, Colors.red],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));

  Future<void> _signInAnon() async {
    setState(() => _loadingAnonymously = true);
    Response response = await _auth.signInAnonymously();
    if (response.data == null) {
        statusHandler(context, response.message!, Status.ERROR);
      }
    setState(() => _loadingAnonymously = false);
  }

  Future<void> _signIn() async {
    setState(() => _loadingWithEmail = true);
    if (_formKey.currentState!.validate()) {
      Response response = await _auth.signInWithEmailAndPassword(_email, _password);
      if (response.data == null) {
        statusHandler(context, response.message!, Status.ERROR);
      }
    }
    setState(() => _loadingWithEmail = false);
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
            'Sign In',
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
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (value) => value!.isEmpty ? 'Enter an email' : null,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    setState(() => _email = value);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (value) => value!.length < 6 ? 'Password must be 6+ characters' : null,
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                  textAlign: TextAlign.center,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) {
                    setState(() => _password = value);
                  },
                ),
                SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: _signIn,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width, 45.0),
                    shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  child: _loadingWithEmail ? LoadingContainer(size: 30.0) : Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                // SizedBox(height: 15.0),
                // ElevatedButton(
                //   onPressed: _signInAnon,
                //   style: ElevatedButton.styleFrom(
                //     minimumSize: Size(MediaQuery.of(context).size.width, 45.0),
                //     shape: RoundedRectangleBorder( //to set border radius to button
                //       borderRadius: BorderRadius.circular(10)
                //     ),
                //   ),
                //   child: _loadingAnonymously ? LoadingContainer(size: 30.0) : Text(
                //     'Sign In Anonymously',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 18.0,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}