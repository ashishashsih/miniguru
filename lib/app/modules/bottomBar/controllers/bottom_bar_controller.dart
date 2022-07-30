import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController {

  late PageController pageController;
  var currentIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }
}
