import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  var onGoingProjectList = <MyProductListModel>[].obs;
  var completedProjectList = <MyProductListModel>[].obs;
  var futureProjectList = <MyProductListModel>[].obs;
  late TextEditingController textEditingControllerProgress;

  getProjectList()async
  {
    print("address list");
    isLoading.value = true;
    try {
      var addressList = await ApiService().getProjectList();
      print(addressList.toString());
      myProjectList.value = myProductListModelFromJson(jsonEncode(addressList));
      onGoingProjectList.value=myProjectList.where((element) => element.status==1).toList();
      completedProjectList.value=myProjectList.where((element) => element.status==2).toList();
      futureProjectList.value=myProjectList.where((element) => element.status==3).toList();

      isLoading(false);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit()
  {
    print("Project List cotroller chala");
    textEditingControllerProgress=TextEditingController();
    
    getProjectList();
    super.onInit();
  }

  void setProgress()
  { 
    if(textEditingControllerProgress.text.isEmpty||int.parse(textEditingControllerProgress.text)>100)
      {
        Fluttertoast.showToast(msg: "Please Enter a Valid progress value");
        textEditingControllerProgress.text="";
      }
      else if(textEditingControllerProgress.text=="100")
      {
        getVideo();
      }else
      {
        Fluttertoast.showToast(msg: "Progress Submitted Successfully");
        textEditingControllerProgress.text="";
        Get.back();
      }
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
        'No Video Selected',
        margin: const EdgeInsets.all(20),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: redColor,
        colorText: Colors.white,
      );
    }
  }

  void increment() => count.value++;
}
