
// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

AgeResponse ageResponseFromJson(String str) =>
    AgeResponse.fromJson(json.decode(str));

String ageResponseToJson(AgeResponse data) => json.encode(data.toJson());

class AgeResponse {
  AgeResponse({
    this.name,
    this.age,
    this.count,
  });

  String? name;
  int? age;
  int? count;

  factory AgeResponse.fromJson(Map<String, dynamic> json) => AgeResponse(
    name: json["name"],
    age: json["age"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "age": age,
    "count": count,
  };
}
