import 'package:flutter/material.dart';
import 'package:firechat/navigation/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firechat/widgets/shared/loading/loading_screen.dart';
import 'package:provider/provider.dart';
import 'package:firechat/services/auth.dart';
import 'package:firechat/models/auth.dart';

class FirebaseBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          // return SomethingWentWrong();
          print('Error establishing connection');
        }

        // Show application
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<Auth?>.value(
            value: AuthService().user,
            initialData: null,
            child: Wrapper(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return LoadingScreen();
      },
    );
  }
}
