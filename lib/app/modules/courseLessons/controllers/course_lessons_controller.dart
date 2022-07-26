import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mini_guru/app/modules/model/CommentModel.dart';
import 'package:mini_guru/constants.dart';
import 'package:mini_guru/others/api_service.dart';
import 'package:video_viewer/domain/bloc/controller.dart';

class CourseLessonsController extends GetxController {

  late VideoViewerController videoController;
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
  late TextEditingController commentTextEditingController;

  getProjectList()async{
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

  void setLike(String like) async
  {
      var response = await ApiService().addLikes(like);
      //Fluttertoast.showToast(msg: like);
      Fluttertoast.showToast(msg: response['msg']);
      print(response);
  }

  Color generateRandomColor() {
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
    commentTextEditingController=TextEditingController();

    videoController = VideoViewerController();
    videoController.play();
    getProjectList();
  }

  @override
  void onReady() {
    super.onReady();
    videoController = VideoViewerController();
  }

  void addComment() async
  {
    if(commentTextEditingController.text.isEmpty)
      {
        Fluttertoast.showToast(msg: "Plese Comment!",backgroundColor: Colors.red);
      }else{
      showComment.value = false;
      var response = await ApiService().addComment("id", "it is comment");
      Fluttertoast.showToast(msg: response['msg']);
      print(response);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

}
