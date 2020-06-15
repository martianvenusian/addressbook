import 'package:addressbook/bottom_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBarCupertinoScaffold extends StatelessWidget {
  const BottomBarCupertinoScaffold({
    Key key,
    @required this.currentTab,
    @required this.onSelectTab,
    @required this.widgetBuilders,
    @required this.navigatorKeys,
  }) : super(key: key);
  final BottomBarItem currentTab;
  final ValueChanged<BottomBarItem> onSelectTab;
  final Map<BottomBarItem, WidgetBuilder> widgetBuilders;
  final Map<BottomBarItem, GlobalKey<NavigatorState>> navigatorKeys;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.blue,
        items: [
          _buildItem(BottomBarItem.home),
          _buildItem(BottomBarItem.operations),
          _buildItem(BottomBarItem.account),
        ],
        onTap: (index) => onSelectTab(BottomBarItem.values[index]),
      ),
      tabBuilder: (context, index) {
        final item = BottomBarItem.values[index];
        return CupertinoTabView(
          navigatorKey: navigatorKeys[item],
          builder: (context) => widgetBuilders[item](context),
        );
      },
    );
  }

  BottomNavigationBarItem _buildItem(BottomBarItem tabItem) {
    final itemData = BottomBarItemData.allTabs[tabItem];
    final color = currentTab == tabItem ? Colors.white : Colors.grey;
    return BottomNavigationBarItem(
      icon: Icon(
        itemData.icon,
        color: color,
      ),
      title: Text(
        itemData.title,
        style: TextStyle(color: color),
      ),
    );
  }
}
