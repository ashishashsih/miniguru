import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raddiwala/app/other/NameIdModel.dart';
import 'package:raddiwala/constant.dart';
import '../controllers/address_controller.dart';

class AddAddressView extends GetView<AddressController>
{
  //AddressController addressController=Get.put(AddressController());

  @override
  Widget build(BuildContext context)
  {
    //Get.lazyPut(() => AddressController());
    AddressController addressController=Get.put(AddressController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Address'.tr),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          child: Image.asset(
            'images/background.png',
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            fit: BoxFit.cover,
          ),
          decoration: BoxDecoration(
            image:
            DecorationImage(image: AssetImage('images/background.png')),
            // borderRadius: BorderRadius.all(Radius.circular(5.0))
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            // border: Border(
            //   top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
            //   bottom: BorderSide(width: 16.0, color: Colors.lightBlue.shade900),
            // ),
            color: primaryColor,
          ),
        ),
      ),
      body:
      Column(
        children: [
          Padding(
              padding: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 20),
              child: DelayedDisplay(
                delay: const Duration(milliseconds: 500),
                child: Form(
                  key: controller.addressFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
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
                              TextFormField(
                                  controller: addressController.addressingController,
                                  onSaved: (value)
                                  {
                                    addressController.address = value!;
                                  },
                                  validator: (value) {
                                    return addressController.validateText(
                                        value!, "Address".tr);
                                  },
                                  style: TextStyle(
                                      fontSize: 20),
                                  decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    labelText: 'Address'.tr,
                                    labelStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: primaryColor),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: primaryColor),
                                    ),
                                  )
                                //decoration: txtDecoration("Enter Mobile Number", Icons.call, Colors.grey, 15),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // TextFormField(
                              //     keyboardType: TextInputType.number,
                              //     controller: controller.mobileController,
                              //     onSaved: (value) {
                              //       controller.mobile = value!;
                              //     },
                              //     validator: (value) {
                              //       return controller.validateLength(
                              //           value!, 10, "Mobile");
                              //     },
                              //     style: TextStyle(color: Colors.white,
                              //         fontSize: 20),
                              //     decoration: InputDecoration(
                              //       alignLabelWithHint: true,
                              //       labelText: 'Mobile',
                              //       labelStyle: TextStyle(
                              //           color: Colors.grey,
                              //           fontFamily: primaryfont,
                              //           fontSize: 18),
                              //       enabledBorder: UnderlineInputBorder(
                              //         borderSide: BorderSide(color: Colors.white),
                              //       ),
                              //       focusedBorder: UnderlineInputBorder(
                              //         borderSide: BorderSide(color: Colors.white),
                              //       ),
                              //     )
                              //   //decoration: txtDecoration("Enter Mobile Number", Icons.call, Colors.grey, 15),
                              // ),
                              //
                              // SizedBox(
                              //   height: 20,
                              // ),
                              // Obx(() =>
                              //     Column(children: [
                              //       ListTile(
                              //         leading: Radio<String>(
                              //           value: 'Home',
                              //           groupValue: controller.address_type,
                              //           onChanged: (value)
                              //           {
                              //             controller.address_type=value!;
                              //           },
                              //         ),
                              //         title: const Text('Male',style: TextStyle(color: Colors.white)),
                              //       ),
                              //       ListTile(
                              //         leading: Radio<String>
                              //           (
                              //           value: 'Office',
                              //           groupValue: controller.address_type,
                              //           onChanged: (value)
                              //           {
                              //             controller.address_type=value!;
                              //           },
                              //         ),
                              //         title: const Text('Office',style: TextStyle(color: Colors.white),),
                              //       )
                              //       ,],),
                              // ),
                              SizedBox(height: 10,),
                              Column(
                                children: [
                                  Align(alignment: Alignment.bottomLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 5),
                                        child: Text("Select City"),
                                      )),
                                  SizedBox(height: 10,),
                                  Obx(() {
                                    return Container(
                                      alignment: Alignment.topRight,
                                      padding: EdgeInsets.only(left: 15),
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: primaryColor, width: 2),
                                      ),
                                      height: 50,
                                      child: DropdownButton<String>(
                                        underline: Container(
                                          height: 0,
                                          color: Colors.deepPurpleAccent,
                                        ),

                                        value: controller.selectedCityId.value,
                                        icon: Icon(Icons.arrow_drop_down),
                                        iconSize: 24,
                                        elevation: 16,
                                        style: TextStyle(color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: 'Varela'),
                                        onChanged: (data)
                                        {
                                          controller.selectedCityId.value = data!;
                                          //controller.setPlanDetail(data);
                                          // setState(() {
                                          //   dropdownValue = data;
                                          //   print("dropDown Value is:"+dropdownValue);
                                          // });
                                        },
                                        items: controller.cityList.map<
                                            DropdownMenuItem<String>>((
                                            NameIdModel nib) {
                                          return DropdownMenuItem<String>(
                                            value: nib.id.toString(),
                                            child: Text(nib.name),
                                          );
                                        }).toList(),
                                      ),
                                    );
                                  }),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
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
                              // SizedBox(
                              //   height: 20,
                              // ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          Align(alignment: Alignment.topRight, child: Padding(padding: EdgeInsets.only(top: 5,left: 10,bottom: 10),child: Text("* This time we recieve order for ujjain city only",style: TextStyle(color: Colors.black,fontSize: 17),),),),
          InkWell(child:
          Container(
            height: 45,
            width: 130,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                'Add Now'.tr,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ),onTap: ()=>{
            addressController.checkAddress()
          },),]
    ));
  }
}
