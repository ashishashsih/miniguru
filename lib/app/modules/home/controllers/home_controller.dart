import 'dart:convert';

import 'package:confetti/confetti.dart';
import 'package:get/get.dart';
import 'package:mini_guru/app/modules/model/video_display_model.dart';
import 'package:mini_guru/others/api_service.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  late ConfettiController coinAnimationController;
  var isAnimate = false;
  var parentalPin = 1111.obs;
  var isAgeSwitcher = false.obs;
  var isTopicSwitcher = false.obs;
  var isCitySwitcher = false.obs;
  var isCommentsSwitcher = false.obs;
  var wallet_balance = "".obs;
  var score = "".obs;
  var fdrList = <VideoDisplayModel>[].obs;

  var isLoading=false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    getHomeData();
    coinAnimationController = ConfettiController(duration: const Duration(seconds: 2));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    coinAnimationController.dispose();
  }

  void getHomeData()async
  {
    print("valide");
    isLoading.value = true;
    var response = await ApiService().getHomeData();
    isLoading.value = false;
    print("Responseis there:${response['data'][0]['title']}");
    wallet_balance.value=response['wallet_balance'];
    score.value=response['score'];
    print("W:${wallet_balance.value}:R#${score}");
    fdrList.value=videoDisplayModelFromJson(jsonEncode(response['data']));
    print("Length is here:${fdrList.length}");
    // String message = response['msg'];
    // // if (response.containsKey('status'))
    // // {
    // if (response['status'] == true)
    // {
    //   var dta=response['data'];
    //   return dta;
    // } else {
    //   print("some Thing Weng wrong");
    // }
  }

}