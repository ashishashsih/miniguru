import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_guru/app/modules/model/CommentModel.dart';
import 'package:mini_guru/constants.dart';
import 'package:mini_guru/others/api_service.dart';

class CourseLessonsController extends GetxController {

  final count = 0.obs;
  var isLoading=false.obs;
  var commentList = <CommentModel>[].obs;
  var title="".obs;
  var description="".obs;
  var aesthetic=0.obs;
  var unique=0.obs;
  var creative=0.obs;
  var useful=0.obs;
  var interactive=0.obs;
  var gaming=0.obs;
  var showComment=false.obs;

  getProjectList()async
  {
    print("address list");
    isLoading.value = true;
    try {
      var addressList = await ApiService().getProjectDetail();
      print(addressList.toString());
      // var resp=jsonDecode(addressList);
      // print(resp);
      //print(jsonEncode(addressList['comments_list']));
      commentList.value = commentModelFromJson(jsonEncode(addressList['comments_list']));
      print(jsonEncode(addressList['comments_list']));
      title.value=addressList["title"];
      description.value=addressList["description"];
      aesthetic.value=addressList["aesthetic"];
      unique.value=addressList["unique"];
      creative.value=addressList["creative"];
      useful.value=addressList["useful"];
      interactive.value=addressList["interactive"];
      gaming.value=addressList["gaming"];
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }

  Color generateRandomColor1() {
    // Define all colors you want here
    const predefinedColors = [
      primaryColor,
      secondaryColor,
      redColor,
      greenColor,
    ];
    Random random = Random();
    return predefinedColors[random.nextInt(predefinedColors.length)];
  }

  @override
  void onInit() {
    super.onInit();
    getProjectList();
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
