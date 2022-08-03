import 'dart:convert';

import 'package:get/get.dart';
import 'package:mini_guru/app/modules/add_address/model/MyProductListModel.dart';
import 'package:mini_guru/others/api_service.dart';

class ProjectListController extends GetxController
{
  //TODO: Implement ProjectListController

  final count = 0.obs;
  var isLoading=false.obs;
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

  void increment() => count.value++;
}
