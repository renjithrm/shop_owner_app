// To parse this JSON data, do
//
//     final storeSignUp = storeSignUpFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, unnecessary_null_comparison, prefer_null_aware_operators

import 'dart:convert';

StoreSignUp storeSignUpFromJson(String str) =>
    StoreSignUp.fromJson(json.decode(str));

String storeSignUpToJson(StoreSignUp data) => json.encode(data.toJson());

class StoreSignUp {
  StoreSignUp({
    required this.firstname,
    required this.lastname,
    required this.storename,
    required this.city,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.email,
    required this.phoneno,
    required this.password,
    required this.logo,
  });

  String firstname;
  String lastname;
  String storename;
  String city;
  String address;
  double latitude;
  double longitude;
  String email;
  int phoneno;
  String password;
  String logo;

  factory StoreSignUp.fromJson(Map<String, dynamic> json) => StoreSignUp(
        firstname: json["firstname"] == null ? null : json["firstname"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        storename: json["storename"] == null ? null : json["storename"],
        city: json["city"] == null ? null : json["city"],
        address: json["address"] == null ? null : json["address"],
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude:
            json["longitude"] == null ? null : json["longitude"].toDouble(),
        email: json["email"] == null ? null : json["email"],
        phoneno: json["phoneno"] == null ? null : json["phoneno"],
        password: json["password"] == null ? null : json["password"],
        logo: json["logo"] == null ? null : json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname == null ? null : firstname,
        "lastname": lastname == null ? null : lastname,
        "storename": storename == null ? null : storename,
        "city": city == null ? null : city,
        "address": address == null ? null : address,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "email": email == null ? null : email,
        "phoneno": phoneno == null ? null : phoneno,
        "password": password == null ? null : password,
        "logo": logo == null ? null : logo,
      };
}
