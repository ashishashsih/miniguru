import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mini_guru/app/modules/add_address/controllers/address_controller.dart';
import 'package:mini_guru/app/modules/cart/controllers/cart_controller.dart';
import 'package:mini_guru/constants.dart';

import '../controllers/display_address_controller.dart';

class DisplayAddressView extends GetView<DisplayAddressController> {
  const DisplayAddressView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AddressController addressController = Get.put(AddressController());
    CartController cartController=Get.put(CartController());
    final size = MediaQuery.of(context).size;
    final appBar = SizedBox(
      height: size.width * 0.15,
      child: Stack(
        children: [
          const Center(
              child: Text(
                'Address',
                style: titleStyle,
              )),
          //Back Button
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () => Get.back(),
              child: Icon(Icons.arrow_back_ios_new),
            ),
          ),
          //Back Button
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () => Get.back(),
              child: Icon(Icons.add,color: Colors.black,size: 40,),
            ),
          ),
        ],
      ),
    );
    final button = InkWell(
      onTap: (){},
      child: Container(
        height: size.width * 0.15,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
            child: InkWell(
              onTap: ((){
                controller.payNow('${cartController.cartValue}00');
              }),
              child: const Text('Checkout',style: buttonTitleStyle,),
            )),
      ),
    );
    return Scaffold(
        floatingActionButton: button,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SafeArea(
          child: Padding(padding: const EdgeInsets.only(left: 5,right: 5,top: 10),
              child: EnterAnimation(
                Column(children: [
                  Expanded(flex: 0,child: appBar),
                  SizedBox(height: size.width * 0.05,),
                  Expanded(flex:1,child: Obx(() {
                    return Column(
                      children: [
                        addressController.isLoading.value
                            ? CircularProgressIndicator()
                            : addressController.addresses.isEmpty
                            ? Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Image.asset(
                                'images/notfound.jpg',
                                height: size.width * 0.5,
                                width: size.width * 0.5,
                              ),
                              const Text(
                                'Add Address to Proceed',
                                style: subTitle,
                              )
                            ],
                          ),
                        )
                            : Column(
                          children: List.generate(
                              addressController.addresses.length,
                                  (index) => Card(
                                elevation: 5,
                                child: ListTile(
                                    onTap: () => {},
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
                                      style: TextStyle(
                                          color: greenColor),
                                    ),
                                    leading: Icon(
                                      addressController
                                          .selectedAddress
                                          .value ==
                                          addressController
                                              .addresses[index].id
                                          ? Icons
                                          .radio_button_checked_sharp
                                          : Icons.radio_button_off,
                                      color: primaryColor,
                                    )),
                              )),
                        )
                      ],
                    );
                  },
                  ),)
                ],),
              )
          ),
        )
    );
  }
}
