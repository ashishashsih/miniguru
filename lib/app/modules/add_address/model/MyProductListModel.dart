// To parse this JSON data, do
//
//     final myProductListModel = myProductListModelFromJson(jsonString);

import 'dart:convert';

List<MyProductListModel> myProductListModelFromJson(String str) => List<MyProductListModel>.from(json.decode(str).map((x) => MyProductListModel.fromJson(x)));

String myProductListModelToJson(List<MyProductListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyProductListModel {
  MyProductListModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.thumbnil,
    required this.status,
    required this.progress,
  });

  int id;
  String title;
  String subTitle;
  String description;
  String startDate;
  String endDate;
  String thumbnil;
  int status;
  int progress;

  factory MyProductListModel.fromJson(Map<String, dynamic> json) => MyProductListModel(
    id: json["id"],
    title: json["title"],
    subTitle: json["sub_title"],
    description: json["description"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    thumbnil: json["thumbnil"],
    status: json["status"],
    progress: json["progress"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "sub_title": subTitle,
    "description": description,
    "start_date": startDate,
    "end_date": endDate,
    "thumbnil": thumbnil,
    "status": status,
    "progress": progress,
  };
}
