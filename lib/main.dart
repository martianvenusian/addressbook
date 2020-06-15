import 'package:addressbook/bottom_bar_page.dart';
import 'package:addressbook/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(AddressBook());

class AddressBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Check in Diary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.blue,
      ),
      home: Provider<Database>(
        create: (_) => FirestoreDatabase(uid: 'uid'),
        child: BottomBarPage(),
      ),
    );
  }
}
