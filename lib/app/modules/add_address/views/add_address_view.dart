import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_guru/constants.dart';
import 'package:mini_guru/others/NameIdModel.dart';
import '../controllers/address_controller.dart';

class AddAddressView extends GetView<AddressController> {
  @override
  Widget build(BuildContext context){
    AddressController addressController=Get.put(AddressController());
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
          //Add Address Button
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () => Get.to(AddAddressView()),
              child: Icon(Icons.add,color: Colors.black,size: 40,),
            ),
          ),
        ],
      ),
    );
    final addAddress = Container(
      height: size.width * 0.15,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
          child: InkWell(
            onTap: (() => {addressController.checkAddress()}),
            child: const Text('Add Address',style: buttonTitleStyle,),
          )),
    );
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: addAddress,
      body: Form(
        key: controller.addressFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: EnterAnimation(Padding(
          padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
          child: Column(
              children: [
                appBar,
                SizedBox(height: size.width * 0.1,),
                Container (
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          spreadRadius: .5,
                          color: Colors.black.withOpacity(.2),
                          offset: const Offset(1.0, 5.0))
                    ],
                  ),
                  child: Column(
                    children: [
                      ///Add Address TextField
                      SizedBox(
                        height: size.width * 0.13,
                        width: size.width,
                        child: TextFormField(
                          controller: addressController.addressingController,
                          keyboardType: TextInputType.phone,
                          onSaved: (value){
                            addressController.address = value!;
                          },
                          validator: (value) {
                            return addressController.validateText(
                                value!, "Address".tr);
                          },
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'Add Address',
                            suffixIcon: Icon(CupertinoIcons.location_solid,color: Colors.black,),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: primaryColor,
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: primaryColor,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.width * 0.05,),
                      const Align(alignment: Alignment.bottomLeft,child: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text("Select State"),
                      )),
                      SizedBox(height: size.width * 0.001,),
                      //Select State
                      Obx(() {
                        return Container(
                          height: size.width * 0.12,
                          width: size.width,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(7),
                            border: Border.all(color: primaryColor),
                          ),
                          child: Center(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                dropdownDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey.shade400),
                                ),
                                isExpanded: true,
                                isDense: true,
                                hint: const Text(
                                    'Select',
                                    style: buttonSubTitleStyle
                                ),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                ),
                                onChanged: (_) {},
                                items: controller.cityList.map<
                                    DropdownMenuItem<String>>((
                                    NameIdModel nib) {
                                  return DropdownMenuItem<String>(
                                    value: nib.id.toString(),
                                    child: Text(nib.name),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        );
                      }),
                      SizedBox(height: size.width * 0.05,),
                      const Align(alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text("Select State"),
                          )),
                      SizedBox(height: size.width * 0.001,),
                      //Select City
                      Obx(() {
                        return Container(
                          height: size.width * 0.12,
                          width: size.width,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(7),
                            border: Border.all(color: primaryColor),
                          ),
                          child: Center(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                dropdownDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey.shade400),
                                ),
                                isExpanded: true,
                                isDense: true,
                                hint: const Text(
                                    'Select',
                                    style: buttonSubTitleStyle
                                ),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                ),
                                onChanged: (_) {},
                                items: controller.cityList.map<
                                    DropdownMenuItem<String>>((
                                    NameIdModel nib) {
                                  return DropdownMenuItem<String>(
                                    value: nib.id.toString(),
                                    child: Text(nib.name),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        );
                      }),
                      SizedBox(height: size.width * 0.05),
                      Row(children: [
                        Expanded(
                          child: ListTile(
                            leading: Obx(() {
                              return Radio<String>(
                                value: 'Home'.tr,
                                groupValue: addressController.address_type.value,
                                onChanged: (value) {
                                  addressController.onChangeAddresType(value);
                                  //controller.address_type = valu!;
                                },
                                activeColor: Colors.purple,
                                fillColor: MaterialStateProperty.all(
                                    primaryColor),
                              );
                            }),
                            title: Text('Home'.tr,
                            ),
                          ),
                        ),
                        Expanded(child: ListTile(
                          leading: Obx(() {
                            return Radio<String>
                              (
                              value: 'Office'.tr,
                              groupValue: addressController.address_type.value,
                              onChanged: (value) {
                                addressController.onChangeAddresType(value);
                              },
                              activeColor: Colors.purple,
                              fillColor: MaterialStateProperty.all(
                                  primaryColor),
                            );
                          }),
                          title: const Text('Office',
                          ),
                        )),
                      ],),
                    ],
                  ),
                ),
              ]
    ),
        ),
        ),
      ));
  }
}
