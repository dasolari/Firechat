import 'package:flutter/material.dart';
import 'package:firechat/navigation/tab_navigator.dart';


class App extends StatelessWidget {
  App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabNavigator();
  }
}
