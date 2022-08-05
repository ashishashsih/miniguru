// To parse this JSON data, do
//
//     final materialModel = materialModelFromJson(jsonString);

import 'dart:convert';

List<MaterialModel> materialModelFromJson(String str) => List<MaterialModel>.from(json.decode(str).map((x) => MaterialModel.fromJson(x)));

String materialModelToJson(List<MaterialModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MaterialModel {
  MaterialModel({
    required this.id,
    required this.productName,
    required this.image,
    required this.point,
    required this.selected,
  });

  int id;
  String productName;
  String image;
  int point;
  bool selected;

  factory MaterialModel.fromJson(Map<String, dynamic> json) => MaterialModel(
    id: json["id"],
    productName: json["product_name"],
    image: json["image"],
    point: json["point"],
    selected: json["selected"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_name": productName,
    "image": image,
    "point": point,
    "selected": selected,
  };
}
