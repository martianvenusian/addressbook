import 'package:flutter/material.dart';

enum BottomBarItem { home, operations, account }

class BottomBarItemData {
  const BottomBarItemData({@required this.title, @required this.icon});

  final String title;
  final IconData icon;

  static const Map<BottomBarItem, BottomBarItemData> allTabs = {
    BottomBarItem.home: BottomBarItemData(title: 'Addresses', icon: Icons.home),
    BottomBarItem.operations:
        BottomBarItemData(title: 'Operations', icon: Icons.collections),
    BottomBarItem.account:
        BottomBarItemData(title: 'Account', icon: Icons.account_circle),
  };
}
