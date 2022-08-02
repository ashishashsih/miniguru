import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mini_guru/app/modules/add_address/controllers/address_controller.dart';
import 'package:mini_guru/constants.dart';

import '../controllers/display_address_controller.dart';

class DisplayAddressView extends GetView<DisplayAddressController>
{
  const DisplayAddressView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AddressController addressController = Get.put(AddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('DisplayAddressView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() {
    return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    Container(
    margin: EdgeInsets.only(left: 10, bottom: 10),
    width: MediaQuery.of(context).size.width,
    child: Text("Select_an_address".tr,
    style: TextStyle(color: Colors.white, fontSize: 20)),
    ),
    addressController.isLoading.value
    ? CircularProgressIndicator()
        : addressController.addresses.isEmpty
    ? Container(
    height: 200,
    child: Center(
    child: FloatingActionButton.extended(
    backgroundColor: Colors.white,
    onPressed: () => {
    //Get.toNamed("/add-address")
    Get.offAndToNamed("/add-address")
    },
    //icon: _buildButtonIcon(),
    label: Text("Please add an Address".tr,
    style: TextStyle(
    fontSize: 18, color: primaryColor)),
    ),
    ),
    )
        :
    Container(height: 350,child: SingleChildScrollView(child: Column(
    children: List.generate(
    addressController.addresses.length,
    (index) => Card(
    elevation: 5,
    child: ListTile(
    onTap: () =>
    {
    // addressController
    //     .setSelectedAddress(
    // addressController
    //     .addresses[index]
    //     .id),
    // cartController
    //     .setSelectedAddress(
    // addressController
    //     .addresses[index]
    //     .id)
    },
    title: Text(
    addressController
        .addresses[index].address,
    style: TextStyle(fontSize: 18),
    ),
    subtitle: Text(
    addressController
        .addresses[index].cityid
        .toString(),
    style: TextStyle(
    fontWeight: FontWeight.bold,
    ),
    ),
    trailing: Text(
    addressController
        .addresses[index].type,
    style:
    TextStyle(color: Colors.teal),
    ),
    leading: Icon(
    addressController.selectedAddress
        .value ==
    addressController
        .addresses[index].id
    ? Icons
        .radio_button_checked_sharp
        : Icons.radio_button_off,
    color: primaryColor,
    )),
    )),
    ),),)
    ],
    );
    },
      ),
    );
  }
}
