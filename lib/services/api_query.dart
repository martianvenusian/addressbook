import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class APIQuery {
  static Query searchBy({@required Query query, String feild, String value}) =>
      query.where(feild, isEqualTo: value);
}
