import 'package:addressbook/models/address.dart';
import 'package:addressbook/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OperationsPage extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _OperationsPageState createState() => _OperationsPageState();
}

class _OperationsPageState extends State<OperationsPage> {
  final _formKey = GlobalKey<FormState>();

  String _name;
  String _phoneNumber;
  String _city;
  String _country;

  @override
  void initState() {
    _name = '';
    _phoneNumber = '';
    _city = '';
    _country = '';
    super.initState();
  }

  bool _validateAndSaveForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _submit() async {
    final Database database = Provider.of<Database>(context, listen: false);

    if (_validateAndSaveForm()) {
      final id = DateTime.now().toIso8601String();

      final address = Address(
        id: id,
        name: _name,
        phonenumber: _phoneNumber,
        city: _city,
        country: _country,
      );

      await database.setAddress(address: address);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text('Operations'),
        actions: <Widget>[],
      ),
      body: _buildBody(),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        _setAddress(),
      ],
    );
  }

  Widget _setAddress() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            initialValue: _name,
            decoration: InputDecoration(
              labelText: 'Name',
              hintText: 'Enter name',
            ),
            validator: (value) =>
                value.isNotEmpty ? null : 'Name can\'t be empty',
            onSaved: (value) => _name = value,
          ),
          TextFormField(
            initialValue: _phoneNumber,
            decoration: InputDecoration(
              labelText: 'Phone number',
              hintText: 'Enter phone number',
            ),
            validator: (value) =>
                value.isNotEmpty ? null : 'Phone number can\'t be empty',
            onSaved: (value) => _phoneNumber = value,
          ),
          TextFormField(
            initialValue: _city,
            decoration: InputDecoration(
              labelText: 'City',
              hintText: 'Enter city',
            ),
            validator: (value) =>
                value.isNotEmpty ? null : 'City can\'t be empty',
            onSaved: (value) => _city = value,
          ),
          TextFormField(
            initialValue: _country,
            decoration: InputDecoration(
              labelText: 'Country',
              hintText: 'Enter country',
            ),
            validator: (value) =>
                value.isNotEmpty ? null : 'Country can\'t be empty',
            onSaved: (value) => _country = value,
          ),
          FlatButton(
            color: Colors.blue,
            child: Text(
              'Save',
            ),
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}
