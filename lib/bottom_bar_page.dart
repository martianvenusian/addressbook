import 'package:addressbook/bottom_bar_cupertino_scaffold.dart';
import 'package:addressbook/bottom_bar_item.dart';
import 'package:addressbook/pages/account_page.dart';
import 'package:addressbook/pages/home_page.dart';
import 'package:addressbook/pages/operations_page.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key key}) : super(key: key);

  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  @override
  void initState() {
    super.initState();
  }

  BottomBarItem _currentTab = BottomBarItem.home;

  final Map<BottomBarItem, GlobalKey<NavigatorState>> navigatorKeys = {
    BottomBarItem.home: GlobalKey<NavigatorState>(),
    BottomBarItem.operations: GlobalKey<NavigatorState>(),
    BottomBarItem.account: GlobalKey<NavigatorState>(),
  };

  void _select(BottomBarItem tabItem) {
    if (tabItem == _currentTab) {
      navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  Map<BottomBarItem, WidgetBuilder> get widgetBuilders {
    return {
      BottomBarItem.home: (context) => HomePage(),
      BottomBarItem.operations: (_) => OperationsPage(),
      BottomBarItem.account: (_) => AccountPage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[_currentTab].currentState.maybePop(),
      child: BottomBarCupertinoScaffold(
        currentTab: _currentTab,
        onSelectTab: _select,
        widgetBuilders: widgetBuilders,
        navigatorKeys: navigatorKeys,
      ),
    );
  }
}
