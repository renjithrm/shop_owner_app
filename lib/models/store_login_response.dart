// To parse this JSON data, do
//
//     final storeLoginResponse = storeLoginResponseFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, unnecessary_null_comparison

import 'dart:convert';

StoreLoginResponse storeLoginResponseFromJson(String str) =>
    StoreLoginResponse.fromJson(json.decode(str));

String storeLoginResponseToJson(StoreLoginResponse data) =>
    json.encode(data.toJson());

class StoreLoginResponse {
  StoreLoginResponse({
    required this.id,
    this.firstname,
    this.lastname,
    this.storename,
    this.city,
    this.address,
    this.email,
    this.phoneno,
    this.password,
    this.v,
    this.logo,
  });

  String id;
  String? firstname;
  String? lastname;
  String? storename;
  String? city;
  String? address;
  String? email;
  String? phoneno;
  String? password;
  int? v;
  String? logo;

  factory StoreLoginResponse.fromJson(Map<String, dynamic> json) =>
      StoreLoginResponse(
        id: json["_id"] == null ? null : json["_id"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        storename: json["storename"] == null ? null : json["storename"],
        city: json["city"] == null ? null : json["city"],
        address: json["address"] == null ? null : json["address"],
        email: json["email"] == null ? null : json["email"],
        phoneno: json["phoneno"] == null ? null : json["phoneno"],
        password: json["password"] == null ? null : json["password"],
        v: json["__v"] == null ? null : json["__v"],
        logo: json["logo"] == null ? null : json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "firstname": firstname == null ? null : firstname,
        "lastname": lastname == null ? null : lastname,
        "storename": storename == null ? null : storename,
        "city": city == null ? null : city,
        "address": address == null ? null : address,
        "email": email == null ? null : email,
        "phoneno": phoneno == null ? null : phoneno,
        "password": password == null ? null : password,
        "__v": v == null ? null : v,
        "logo": logo == null ? null : logo,
      };
}
