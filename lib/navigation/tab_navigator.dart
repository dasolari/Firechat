import 'package:flutter/material.dart';
import 'package:firechat/navigation/tab_navigation_item.dart';


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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        showSelectedLabels: true,
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _switchScreen,
        items: [
          for (final tabItem in TabNavigationItem.items)
            BottomNavigationBarItem(
              icon: tabItem.icon,
              label: tabItem.title,
            )
        ],
      ),
    );
  }
}
