import 'package:flutter/material.dart';
import 'package:firechat/navigation/tab_navigation_item.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class TabNavigator extends StatefulWidget {
  const TabNavigator({ Key? key }) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  int _selectedIndex = 0;

  void _switchScreen(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          for (final tabItem in TabNavigationItem.items) tabItem.page,
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Theme.of(context).primaryColor,
        buttonBackgroundColor: Theme.of(context).primaryColor,
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.easeInOutCubic,
        index: _selectedIndex,
        onTap: _switchScreen,
        items: [
          for (final tabItem in TabNavigationItem.items) tabItem.icon
        ],
      ),
    );
  }
}
