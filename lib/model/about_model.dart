// To parse this JSON data, do
//
//     final aboutModel = aboutModelFromJson(jsonString);

import 'dart:convert';

AboutModel aboutModelFromJson(String str) =>
    AboutModel.fromJson(json.decode(str));

String aboutModelToJson(AboutModel data) => json.encode(data.toJson());

class AboutModel {
  AboutModel({
    required this.data,
  });

  List<Datum> data;

  factory AboutModel.fromJson(Map<String, dynamic> json) => AboutModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.name,
    required this.phone,
    required this.location,
    required this.image,
  });

  String name;
  String phone;
  String location;
  String image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        phone: json["phone"],
        location: json["location"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "location": location,
        "image": image,
      };
}
