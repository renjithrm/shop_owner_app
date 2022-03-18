// To parse this JSON data, do
//
//     final signInResponse = signInResponseFromJson(jsonString);

import 'dart:convert';

SignInResponse signInResponseFromJson(String str) =>
    SignInResponse.fromJson(json.decode(str));

String signInResponseToJson(SignInResponse data) => json.encode(data.toJson());

class SignInResponse {
  SignInResponse({
    this.msg,
    this.id,
  });

  String? msg;
  String? id;

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
        msg: json["msg"] == null ? null : json["msg"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg == null ? null : msg,
        "id": id == null ? null : id,
      };
}
