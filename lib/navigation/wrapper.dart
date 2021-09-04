import 'package:flutter/material.dart';
import 'package:firechat/navigation/app.dart';
import 'package:firechat/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:firechat/models/auth.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final auth = Provider.of<Auth?>(context);

    // Return App or Authenticate Widget
    if (auth == null) {
      return Authenticate();
    }
    return App();
  }
}