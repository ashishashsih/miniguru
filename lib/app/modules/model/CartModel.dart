// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

List<CartModel> cartModelFromJson(String str) => List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

String cartModelToJson(List<CartModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {
  CartModel({
    required this.id,
    required this.productId,
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
  });

  int id;
  int productId;
  String name;
  int quantity;
  int price;
  String image;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    id: json["id"],
    productId: json["productId"],
    name: json["name"],
    quantity: json["quantity"],
    price: json["price"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "productId": productId,
    "name": name,
    "quantity": quantity,
    "price": price,
    "image": image,
  };
}
