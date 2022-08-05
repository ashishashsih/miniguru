import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_guru/app/modules/model/ProductModel.dart';
import 'package:mini_guru/others/NameIdModel.dart';
import 'package:mini_guru/others/api_service.dart';

class ShopController extends GetxController {
  //TODO: Implement ShopController

  final count = 0.obs;
  var productList =<ProductModel>[].obs;
  var filteredProductList =<ProductModel>[].obs;
  var categoryList =<NameIdModel>[].obs;
  var isLoading=false.obs;
  var selectedCategory=1.obs;
  late TextEditingController searchController;
  @override
  void onInit() {
    super.onInit();
    searchController=TextEditingController();
    getHomeData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void getHomeData()async
  {
    print("valide");
    isLoading.value = true;
    var response = await ApiService().getProductData();
    isLoading.value = false;
    print("Responseis there:${response['categoryList'][0]['title']}");
    categoryList.value=nameIdModelFromJson(jsonEncode(response['categoryList']));
    productList.value=productModelFromJson(jsonEncode(response['productList']));
    filteredProductList.value=productModelFromJson(jsonEncode(response['productList']));

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

  filterProduct()
  {
    filteredProductList.value=productList;
    filteredProductList.value=productList.where((element) => element.id.isEqual(selectedCategory.value)).toList();
    print("filter is:${filteredProductList.length}");
  }

  filterNow(String value)
  {
    print("SearchinString is here:${value}");
    if(searchController.text.isEmpty)
      {
        filteredProductList.value=productList;
      }else
        {
          var cnvVal=value.toLowerCase();
          filteredProductList.value=productList;
          filteredProductList.value=productList.where((element) => element.name.toLowerCase().contains(cnvVal)).toList();
        }
      print("SearchinString is here:${filteredProductList.length}");
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
