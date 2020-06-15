import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key key, this.sideMenu}) : super(key: key);
  final Widget sideMenu;

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: Text('Account'),
        actions: <Widget>[],
      ),
      endDrawer: sideMenu,
      body: Container(child: Center(child: Text('Account page body'))),
    );
  }
}
