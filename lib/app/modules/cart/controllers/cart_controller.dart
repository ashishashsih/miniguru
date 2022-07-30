import 'dart:convert';

import 'package:get/get.dart';
import 'package:mini_guru/app/modules/model/CartModel.dart';

class CartController extends GetxController {
  //TODO: Implement CartController
  var productList =<CartModel>[].obs;
  var searthProd =<CartModel>[].obs;
  var cartValue=0.obs;


  final count = 0.obs;
  @override
  void onInit()
  {
    super.onInit();
    print("CCTOne");
    setCartValue();
    print("CCTTwo");
    //{"id":1,"productId":101,"name":"Glue","quantity":2,"price":20,"image":"https://popuplearning.pk/wp-content/uploads/2020/02/1-141-dc-gear-motor-for-robot-2-motors-with-wheels.jpg"},{"id":2,"productId":51,"name":"Glue gun","quantity":1,"price":250,"image":"https://popuplearning.pk/wp-content/uploads/2020/02/1-141-dc-gear-motor-for-robot-2-motors-with-wheels.jpg"},{"id":3,"productId":17,"name":"Screw river","quantity":1,"price":270,"image":"https://popuplearning.pk/wp-content/uploads/2020/02/1-141-dc-gear-motor-for-robot-2-motors-with-wheels.jpg"},{"id":4,"productId":112,"name":"Hammer","quantity":1,"price":51,}
    // productList.value.add(CartModel(id: 0, productId: 1, name: "aaa", quantity: 1, price: 250, image:"https://popuplearning.pk/wp-content/uploads/2020/02/1-141-dc-gear-motor-for-robot-2-motors-with-wheels.jpg"));
    // productList.value.add(CartModel(id: 1, productId: 3, name: "bbb", quantity: 5, price: 50, image:"https://popuplearning.pk/wp-content/uploads/2020/02/1-141-dc-gear-motor-for-robot-2-motors-with-wheels.jpg"));
    // productList.value.add(CartModel(id: 2, productId: 12, name: "ccc", quantity: 2, price: 170, image:"https://popuplearning.pk/wp-content/uploads/2020/02/1-141-dc-gear-motor-for-robot-2-motors-with-wheels.jpg"));
    // productList.value.add(CartModel(id: 3, productId: 71, name: "ddd", quantity: 10, price: 300, image:"https://popuplearning.pk/wp-content/uploads/2020/02/1-141-dc-gear-motor-for-robot-2-motors-with-wheels.jpg"));
  }

  setCartValue()
  {
    cartValue.value = productList.fold(0, (sum, item) => sum + (item.quantity*item.price));
  }

  @override
  void onReady()
  {
    super.onReady();
  }

  @override
  void onClose()
  {
    super.onClose();
  }

  void increment() => count.value++;
}
