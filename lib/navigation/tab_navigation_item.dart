import 'package:flutter/material.dart';
import 'package:firechat/screens/home/home.dart';
import 'package:firechat/screens/chats/chats.dart';
import 'package:firechat/screens/account/account.dart';


class TabNavigationItem {
  final Widget page;
  final Icon icon;
  static double size = 30.0;

  TabNavigationItem({
    required this.page,
    required this.icon,
  });
  
  static List<TabNavigationItem> get items => [
    TabNavigationItem(
      page: Home(),
      icon: Icon(Icons.home, color: Colors.white, size: size),
    ),
    TabNavigationItem(
      page: Chats(),
      icon: Icon(Icons.chat, color: Colors.white, size: size),
    ),
    TabNavigationItem(
      page: Account(),
      icon: Icon(Icons.person, color: Colors.white, size: size),
    ),
  ];
}
