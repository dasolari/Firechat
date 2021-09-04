import 'package:flutter/material.dart';
import 'package:firechat/screens/home/home.dart';
import 'package:firechat/screens/chats/chats.dart';
import 'package:firechat/screens/account/account.dart';


class TabNavigationItem {
  final Widget page;
  final String title;
  final Icon icon;

  TabNavigationItem({
    required this.page,
    required this.title,
    required this.icon,
  });
  
  static List<TabNavigationItem> get items => [
    TabNavigationItem(
      page: Home(),
      icon: Icon(Icons.home),
      title: 'Home',
    ),
    TabNavigationItem(
      page: Chats(),
      icon: Icon(Icons.chat),
      title: 'Chats',
    ),
    TabNavigationItem(
      page: Account(),
      icon: Icon(Icons.person),
      title: 'Account',
    ),
  ];
}
