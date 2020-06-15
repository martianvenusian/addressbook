import 'package:meta/meta.dart';

class Address {
  Address({
    @required this.id,
    @required this.name,
    @required this.phonenumber,
    @required this.city,
    @required this.country,
  }) : assert(id != null);

  final String id;
  final String name;
  final String phonenumber;
  final String city;
  final String country;

  factory Address.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }
    final String name = data['name'];
    final String phonenumber = data['phonenumber'];
    final String city = data['city'];
    final String country = data['country'];

    return Address(
      id: documentId,
      name: name,
      phonenumber: phonenumber,
      city: city,
      country: country,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phonenumber': phonenumber,
      'city': city,
      'country': country,
    };
  }
}
