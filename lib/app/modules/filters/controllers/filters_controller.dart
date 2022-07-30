import 'package:get/get.dart';

class FiltersController extends GetxController {
  //TODO: Implement FiltersController

  var isAgeSwitcher = false.obs;
  var isTopicSwitcher = false.obs;
  var isCitySwitcher = false.obs;
  var isCommentsSwitcher = false.obs;
  var is1stClass = false.obs;
  var is2ndClass = false.obs;
  var is3rdClass = false.obs;
  var is4thClass = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
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

  void increment() => count.value++;
}
