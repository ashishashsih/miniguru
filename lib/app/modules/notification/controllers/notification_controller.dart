import 'dart:convert';

import 'package:get/get.dart';
import 'package:mini_guru/app/modules/model/NotificationModel.dart';
import 'package:mini_guru/others/api_service.dart';

class NotificationController extends GetxController
{
  //TODO: Implement NotificationController

  final count = 0.obs;
  var isLoading=false.obs;
  var notificationList = <NotificationModel>[].obs;

  getProjectList()async
  {
    print("notification list");
    isLoading.value = true;
    try {
      var notificaiotonList = await ApiService().getNotificationList();
      print(notificationList.toString());
      notificationList.value = notificationModelFromJson(jsonEncode(notificaiotonList));
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit()
  {
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

  void increment() => count.value++;
}
