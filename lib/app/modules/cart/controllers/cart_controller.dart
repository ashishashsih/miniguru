import 'dart:convert';

import 'package:flutter/material.dart';
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

  showConfirmDialog(BuildContext contex,int index)
  {
    //Toast.show("List Data $id,$index", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    Widget cancelButton = new ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green),),
      child: Text("Cancel".tr,style: TextStyle(fontFamily: "Varela",color: Colors.white),),
      onPressed:  () {
        Navigator.pop(contex);
      },
    );
    Widget continueButton = new ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red),),
      child: Text("Delete".tr,style: TextStyle(fontFamily: "Varela",color: Colors.white)),
      onPressed:() async
      {
          productList.removeAt(index);
          productList.refresh();
          setCartValue();
        productList.refresh();
          if(productList.isEmpty)
            {
              Get.back();
            }
          Navigator.pop(contex);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Item".tr,style: TextStyle(fontFamily: "Varela")),
      elevation: 5.0,
      content: Text("Are you sure to delete this?".tr,style: TextStyle(fontFamily: "Varela")),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: contex,
      builder: (BuildContext context) {
        return alert;
      },
    );
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
