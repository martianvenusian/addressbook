import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, this.sideMenu}) : super(key: key);
  final Widget sideMenu;

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: Text('Addressbook'),
        actions: <Widget>[],
      ),
      endDrawer: sideMenu,
      body: Container(child: Center(child: Text('Home page body'))),
    );
  }
}
