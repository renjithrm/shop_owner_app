// To parse this JSON data, do
//
//     final storeAddProductModel = storeAddProductModelFromJson(jsonString);

// ignore_for_file: unnecessary_null_comparison, prefer_if_null_operators

import 'dart:convert';

StoreAddProductModel storeAddProductModelFromJson(String str) =>
    StoreAddProductModel.fromJson(json.decode(str));

String storeAddProductModelToJson(StoreAddProductModel data) =>
    json.encode(data.toJson());

class StoreAddProductModel {
  StoreAddProductModel({
    required this.storeid,
    required this.productname,
    required this.unit,
    required this.qty,
    required this.amount,
    required this.exprmonths,
    required this.category,
    required this.units,
    required this.description,
    this.image1,
    this.image2,
    this.image3,
  });

  String storeid;
  String productname;
  String unit;
  int qty;
  int amount;
  int exprmonths;
  String category;
  int units;
  String description;
  String? image1;
  String? image2;
  String? image3;

  factory StoreAddProductModel.fromJson(Map<String, dynamic> json) =>
      StoreAddProductModel(
        storeid: json["storeid"] == null ? null : json["storeid"],
        productname: json["productname"] == null ? null : json["productname"],
        unit: json["unit"] == null ? null : json["unit"],
        qty: json["qty"] == null ? null : json["qty"],
        amount: json["amount"] == null ? null : json["amount"],
        exprmonths: json["exprmonths"] == null ? null : json["exprmonths"],
        category: json["category"] == null ? null : json["category"],
        units: json["units"] == null ? null : json["units"],
        description: json["description"] == null ? null : json["description"],
        image1: json["image1"] == null ? null : json["image1"],
        image2: json["image2"] == null ? null : json["image2"],
        image3: json["image3"] == null ? null : json["image3"],
      );

  Map<String, dynamic> toJson() => {
        "storeid": storeid == null ? null : storeid,
        "productname": productname == null ? null : productname,
        "unit": unit == null ? null : unit,
        "qty": qty == null ? null : qty,
        "amount": amount == null ? null : amount,
        "exprmonths": exprmonths == null ? null : exprmonths,
        "category": category == null ? null : category,
        "units": units == null ? null : units,
        "description": description == null ? null : description,
        "image1": image1 == null ? null : image1,
        "image2": image2 == null ? null : image2,
        "image3": image3 == null ? null : image3,
      };
}
