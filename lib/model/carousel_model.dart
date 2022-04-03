// To parse this JSON data, do
//
//     final carouselModel = carouselModelFromJson(jsonString);

import 'dart:convert';

List<CarouselModel> carouselModelFromJson(String str) =>
    List<CarouselModel>.from(
        json.decode(str).map((x) => CarouselModel.fromJson(x)));

String carouselModelToJson(List<CarouselModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CarouselModel {
  CarouselModel({
    required this.id,
    required this.title,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String title;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  factory CarouselModel.fromJson(Map<String, dynamic> json) => CarouselModel(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
