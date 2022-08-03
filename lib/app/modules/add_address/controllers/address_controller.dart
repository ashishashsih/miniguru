import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mini_guru/others/NameIdModel.dart';
import 'package:mini_guru/others/api_service.dart';

import '../model/address.dart';

class AddressController extends GetxController
{
  //TODO: Implement AddAddressController
  var isLoading=false.obs;
  var addresses = <Address>[].obs;
  var selectedAddress=0.obs;
  var address_type="Home".obs;

  var selectedCityId="2465".obs;
  var selectedAddressId="".obs;
  var cityList = <NameIdModel>[].obs;
  final GlobalKey<FormState>addressFormKey=GlobalKey<FormState>();
  late TextEditingController addressingController,cityController;
  String address="";
  @override
  void onInit()
  {
    super.onInit();
    addressingController=TextEditingController();
    getAddressList();
    getCityList();
  }

  setAddress(int val)
  {
    selectedAddress.value=val;
  }

  getCityList()async
  {
    // amount.value="";
    // amountConfirm.value="";
    isLoading.value = true;
    print("City List Data");


    print("valide");
    // //Toast.show("Please wait...");
    var response = await ApiService().getCityList();
    print(response);
    isLoading.value = false;
    print(response['status']);
    if (response['status'] == true)
    {
      cityList.value= nameIdModelFromJson(jsonEncode(response['data']));
      selectedCityId.value=cityList[0].id.toString();
    } else
    {
      //print("some Thing Weng wrong");
      Fluttertoast.showToast(msg: response['msg'],backgroundColor: Colors.red);
    }
    isLoading.value=false;
  }

  getAddressList()async
  {
    print("address list");
    isLoading.value = true;
    try {
      var addressList = await ApiService().getAddressList();
      print(addressList.toString());
      addresses.value = addressList;
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }

  String? validateText(String value,String msg)
  {
    print(value+msg);
    if(value.length<1)
    {
      return "$msg required";
    }
    return null;
  }

  setSelectedAddress(int id)
  {
    selectedAddress.value=id;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  onChangeAddresType(var type)
  {
    print(type);
    address_type.value=type;
  }

  void checkAddress()async
  {
    print("chala");
    final isValid=addressFormKey.currentState!.validate();
    print(isValid);
    if(!isValid)
    {
      return;
    }else
    {
      //Toast.show("Please wait...");
      // isProgressLoginSubmit.value = true;
      var response = await ApiService().addAddress(address_type.value,addressingController.text,selectedCityId.value);
      print(response);
      // isProgressLoginSubmit.value = false;
      String message = response['msg'];
      if (response.containsKey('status'))
      {
        if (response['status'] == true)
        {
          print('Response from server: $response');
          //var msg=response['message'];
          print(message);
          getAddressList();
          //Get.back();
          Get.back(result: true);
          // var result = response['result'];
          // var userId = result['userid'];
          // var otp = result['otp'];
          // Get.toNamed(Routes.OTP, arguments: {
          //   "userId": userId,
          //   "mobileNo": mobileText,
          //   "otp": otp
          // });
        } else if (response['status'] == false) {}
      } else {
        print("some Thing Weng wrong");
      }
    }
    addressFormKey.currentState!.save();
  }
}
