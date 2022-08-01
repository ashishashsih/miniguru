// To parse this JSON data, do
//
//     final orderDetailModel = orderDetailModelFromJson(jsonString);

import 'dart:convert';

List<OrderDetailModel> orderDetailModelFromJson(String str) => List<OrderDetailModel>.from(json.decode(str).map((x) => OrderDetailModel.fromJson(x)));

String orderDetailModelToJson(List<OrderDetailModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderDetailModel {
  OrderDetailModel({
    required this.id,
    required this.date,
    required this.totalAmount,
    required this.status,
    required this.itemList,
  });

  int id;
  String date;
  int totalAmount;
  int status;
  List<ItemList> itemList;

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) => OrderDetailModel(
    id: json["id"],
    date: json["date"],
    totalAmount: json["total_amount"],
    status: json["status"],
    itemList: List<ItemList>.from(json["itemList"].map((x) => ItemList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "total_amount": totalAmount,
    "status": status,
    "itemList": List<dynamic>.from(itemList.map((x) => x.toJson())),
  };
}

class ItemList {
  ItemList({
    required this.id,
    required this.productName,
    required this.quantity,
    required this.amount,
  });

  int id;
  String productName;
  int quantity;
  int amount;

  factory ItemList.fromJson(Map<String, dynamic> json) => ItemList(
    id: json["id"],
    productName: json["productName"],
    quantity: json["quantity"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "productName": productName,
    "quantity": quantity,
    "amount": amount,
  };
}
