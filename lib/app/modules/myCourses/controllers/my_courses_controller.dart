import 'package:get/get.dart';

class MyCoursesController extends GetxController {
  //TODO: Implement MyCoursesController
  var isAgeSwitcher = false.obs;
  var isTopicSwitcher = false.obs;
  var isCitySwitcher = false.obs;
  var isCommentsSwitcher = false.obs;
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
