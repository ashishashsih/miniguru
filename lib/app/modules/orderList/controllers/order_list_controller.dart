import 'dart:convert';

import 'package:get/get.dart';
import 'package:mini_guru/app/modules/model/OrderDetailModel.dart';
import 'package:mini_guru/others/api_service.dart';

class OrderListController extends GetxController
{
  //TODO: Implement OrderListController
  var isLoading=false.obs;
  var orderList=<OrderDetailModel>[].obs;
  var pendingOrderList=<OrderDetailModel>[].obs;
  var completeOrderList=<OrderDetailModel>[].obs;


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getOrderListData();
  }

  getOrderListData() async
  {

    isLoading.value = true;
    var response = await ApiService().getOrderListData();
    isLoading.value = false;
    //print("Responseis there:${response['categoryList'][0]['title']}");
    print(orderDetailModelFromJson(jsonEncode(response['orderList'])));
    //;
    orderList.value =orderDetailModelFromJson(jsonEncode(response['orderList']));
    pendingOrderList.value=orderList.where((element) => element.status.isEqual(1)).toList();
    completeOrderList.value=orderList.where((element) => element.status.isEqual(2)).toList();
    print(orderList.length);
    //pendingOrderList=orderList.fold(initialValue, (previousValue, element) => null)
    //completeOrderList
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
