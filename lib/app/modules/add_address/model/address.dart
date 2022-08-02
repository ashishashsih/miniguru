// To parse this JSON data, do
//
//     final address = addressFromJson(jsonString);

import 'dart:convert';

List<Address> addressFromJson(String str) => List<Address>.from(json.decode(str).map((x) => Address.fromJson(x)));

String addressToJson(List<Address> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Address {
  Address({
    required this.id,
    required this.type,
    required this.address,
    required this.cityid,
  });

  int id;
  String type;
  String address;
  String cityid;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    type: json["type"],
    address: json["address"],
    cityid: json["cityid"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "address": address,
    "cityid": cityid,
  };
}