import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_guru/app/modules/add_address/model/MyProductListModel.dart';
import 'package:mini_guru/others/api_service.dart';

import '../../../../constants.dart';

class ProjectListController extends GetxController
{
  //TODO: Implement ProjectListController

  final count = 0.obs;
  var isLoading=false.obs;
  var video=''.obs;
  var myProjectList = <MyProductListModel>[].obs;

  getProjectList()async
  {
    print("address list");
    isLoading.value = true;
    try {
      var addressList = await ApiService().getProjectList();
      print(addressList.toString());
      myProjectList.value = myProductListModelFromJson(jsonEncode(addressList));
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit()
  {
    print("Project List cotroller chala");
    getProjectList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getVideo() async{
    final pickedVideo = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if(pickedVideo != null){
      video.value = pickedVideo.path;
    } else {
      Get.snackbar(
        'Error',
        'No Image Selected',
        margin: const EdgeInsets.all(20),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: redColor,
        colorText: Colors.white,
      );
    }
  }

  void increment() => count.value++;
}
