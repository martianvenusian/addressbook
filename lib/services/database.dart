import 'dart:async';
import 'package:addressbook/models/address.dart';
import 'package:addressbook/services/api_path.dart';
import 'package:addressbook/services/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

abstract class Database {
  Future<void> setAddress({@required Address address});
  Future<void> deleteAddress({@required String addressId});
  Future<DocumentSnapshot> getAddress({@required String addressId});
  Stream<Address> addressStream({@required String addressId});
  Stream<List<Address>> addressesStream(
      {@required String feild, @required String value});
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  final _service = FirestoreService.instance;

  @override
  Future<void> setAddress({@required Address address}) async =>
      _service.setData(
        path: APIPath.address(address.id),
        data: address.toMap(),
      );

  @override
  Future<void> deleteAddress({@required String addressId}) async =>
      await _service.deleteData(
        path: APIPath.address(addressId),
      );

  @override
  Future<DocumentSnapshot> getAddress({@required String addressId}) async {
    return await _service.getData(
      path: APIPath.address(addressId),
    );
  }

  @override
  Stream<Address> addressStream({@required String addressId}) =>
      _service.documentStream(
        path: APIPath.address(addressId),
        builder: (data, documentId) => Address.fromMap(data, documentId),
      );

  @override
  Stream<List<Address>> addressesStream(
          {@required String feild, @required String value}) =>
      _service.collectionStream<Address>(
        path: APIPath.addresses(),
        queryBuilder: (query) => query.where(feild, isEqualTo: value),
        builder: (data, documentId) => Address.fromMap(data, documentId),
      );
}
