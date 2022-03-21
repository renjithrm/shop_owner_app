// To parse this JSON data, do
//
//     final allProducts = allProductsFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, constant_identifier_names

import 'dart:convert';

AllProducts allProductsFromJson(String str) =>
    AllProducts.fromJson(json.decode(str));

String allProductsToJson(AllProducts data) => json.encode(data.toJson());

class AllProducts {
  AllProducts({
    this.products,
    this.store,
  });

  List<Product>? products;
  Store? store;

  factory AllProducts.fromJson(Map<String, dynamic> json) => AllProducts(
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
        store: json["store"] == null ? null : Store.fromJson(json["store"]),
      );

  Map<String, dynamic> toJson() => {
        "products": products == null
            ? null
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "store": store == null ? null : store!.toJson(),
      };
}

class Product {
  Product({
    this.id,
    this.productname,
    this.unit,
    this.qty,
    this.amount,
    this.exprmonths,
    this.category,
    this.units,
    this.description,
    this.v,
    this.image1,
    this.image2,
    this.image3,
  });

  String? id;

  String? productname;
  Unit? unit;
  int? qty;
  int? amount;
  int? exprmonths;
  String? category;
  int? units;
  String? description;
  int? v;
  String? image1;
  String? image2;
  String? image3;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"] == null ? null : json["_id"],
        productname: json["productname"] == null ? null : json["productname"],
        unit: json["unit"] == null ? null : unitValues.map![json["unit"]],
        qty: json["qty"] == null ? null : json["qty"],
        amount: json["amount"] == null ? null : json["amount"],
        exprmonths: json["exprmonths"] == null ? null : json["exprmonths"],
        category: json["category"] == null ? null : json["category"],
        units: json["units"] == null ? null : json["units"],
        description: json["description"] == null ? null : json["description"],
        v: json["__v"] == null ? null : json["__v"],
        image1: json["image1"] == null ? null : json["image1"],
        image2: json["image2"] == null ? null : json["image2"],
        image3: json["image3"] == null ? null : json["image3"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "productname": productname == null ? null : productname,
        "unit": unit == null ? null : unitValues.reverse![unit],
        "qty": qty == null ? null : qty,
        "amount": amount == null ? null : amount,
        "exprmonths": exprmonths == null ? null : exprmonths,
        "category": category == null ? null : category,
        "units": units == null ? null : units,
        "description": description == null ? null : description,
        "__v": v == null ? null : v,
        "image1": image1 == null ? null : image1,
        "image2": image2 == null ? null : image2,
        "image3": image3 == null ? null : image3,
      };
}

enum Unit { G, ML, KG, GM, UNIT_KG, UNIT_ML, PURPLE_KG }

final unitValues = EnumValues({
  "G": Unit.G,
  "gm": Unit.GM,
  "KG": Unit.KG,
  "ML": Unit.ML,
  "Kg": Unit.PURPLE_KG,
  "kg": Unit.UNIT_KG,
  "ml": Unit.UNIT_ML
});

class Store {
  Store({
    this.id,
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

  String? id;
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

  factory Store.fromJson(Map<String, dynamic> json) => Store(
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

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
