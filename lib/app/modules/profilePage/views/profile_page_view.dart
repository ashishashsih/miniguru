import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mini_guru/constants.dart';
import '../controllers/profile_page_controller.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  ProfilePageController profilePageController = Get.put(
      ProfilePageController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const String demoImage = 'https://t3.ftcdn.net/jpg/02/22/85/16/360_F_222851624_jfoMGbJxwRi5AWGdPgXKSABMnzCQo9RN.jpg';
    final appBar = DelayedDisplay(
      delay: const Duration(milliseconds: 100),
      slidingBeginOffset: const Offset(0, -0.4),
      child: SizedBox(
        height: size.width / 6,
        child: Stack(
          children: [
            const Center(child: Text('Edit Profile', style: titleStyle,)),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () => Get.back(),
                child: Container(
                  height: size.width / 7,
                  width: size.width / 7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      border: Border.all(color: Colors.grey)
                  ),
                  child: const Center(child: Icon(Icons.arrow_back_ios_new),),
                ),
              ),
            )
          ],
        ),
      ),
    );
    final continueButton = BottomAppBar(
      elevation: 0.0,
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Get.toNamed('/select-interest');
        },
        child: DelayedDisplay(
          slidingBeginOffset: const Offset(0, -0.4),
          delay: const Duration(milliseconds: 100),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: size.width / 7,
              width: double.infinity,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(15,),
              ),
              child: Stack(
                children: const [
                  Center(child: Text('Continue', style: buttonTitleStyle,)),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_forward_ios, size: 20,),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    final getLocationButton = InkWell(
      onTap: () {
        profilePageController.getCurrentLocation();
      },
      child: DelayedDisplay(
        slidingBeginOffset: const Offset(0, -0.4),
        delay: const Duration(milliseconds: 100),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: size.width / 7,
          width: double.infinity,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(15,),
          ),
          child: Stack(
            children: const [
              Center(child: Text(
                'Tap To Get Location', style: buttonTitleStyle,)),
              Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.location_on_outlined, size: 20,),
              )
            ],
          ),
        ),
      ),
    );
    return Scaffold(
      // bottomNavigationBar: continueButton,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                appBar,
                SizedBox(height: size.width * 0.03),
                //Profile View
                DelayedDisplay(
                  delay: const Duration(milliseconds: 100),
                  slidingBeginOffset: const Offset(0, -0.4),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      //Profile Photo
                      const Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: CircleAvatar(
                          backgroundColor: primaryColor,
                          radius: 100,
                          child: CircleAvatar(
                            radius: 95,
                            backgroundImage: NetworkImage(demoImage),
                          ),
                        ),
                      ),
                      //Profile Edit Button
                      Container(
                          height: size.width / 12,
                          width: size.width / 5,
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: const Center(child: Text('Edit',
                            style: TextStyle(color: Colors.black),),)
                      )
                    ],
                  ),
                ),
                SizedBox(height: size.width * 0.05),
                //Name TextField
                Form(key:controller.profileFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(children: [SizedBox(height: size.width * 0.05),
                    //Name TextField
                    SizedBox(
                      width: size.width,
                      height: size.width / 5,
                      child: TextFormField(
                        controller: controller.studentNameController,
                        onSaved: (value)
                        {
                          controller.studentName.value = value!;
                        },
                        validator: (value) {
                          return controller.validateText(
                              value!, "Student Name".tr);
                        },
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          labelText: 'Full Name',
                          labelStyle: TextStyle(color: Colors.grey.shade400),
                          suffixIcon: Icon(
                            CupertinoIcons.person_add,
                            color: Colors.grey.shade400,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: redColor,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: primaryColor,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.width * 0.03),
                    //Parents Name TextField
                    SizedBox(
                      width: size.width,
                      height: size.width / 5,
                      child: TextFormField(
                        controller: controller.parentNameController,
                        onSaved: (value)
                        {
                          controller.parentName.value = value!;
                        },
                        validator: (value) {
                          return controller.validateText(
                              value!, "Parent Name".tr);
                        },
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          labelText: 'Parent\'s Name',
                          labelStyle: TextStyle(color: Colors.grey.shade400),
                          suffixIcon: Icon(
                            CupertinoIcons.person_2,
                            color: Colors.grey.shade400,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: redColor,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: primaryColor,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.width * 0.03),
                    //School Name
                    SizedBox(
                      width: size.width,
                      height: size.width / 5,
                      child: TextFormField(
                        controller: controller.schoolNameController,
                        onSaved: (value)
                        {
                          controller.schoolName.value = value!;
                        },
                        validator: (value) {
                          return controller.validateText(
                              value!, "School Name".tr);
                        },
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          labelText: 'School Name',
                          labelStyle: TextStyle(color: Colors.grey.shade400),
                          suffixIcon: Icon(
                            CupertinoIcons.house_alt,
                            color: Colors.grey.shade400,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: redColor,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: primaryColor,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.width * 0.03),
                    //DOB TextField
                    Obx(() {
                      return InkWell(
                        onTap: () =>
                            profilePageController.selectDateOfBirth(),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: size.width,
                          height: size.width / 7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(profilePageController.dateOfBirth.value,
                                  style: subTitle),
                              Icon(CupertinoIcons.calendar,
                                  color: Colors.grey.shade400)
                            ],),
                        ),
                      );
                    }),
                    SizedBox(height: size.width * 0.03),
                    //Mobile Number TextField
                    SizedBox(
                      width: size.width,
                      height: size.width / 5,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: controller.mobileController,
                        onSaved: (value)
                        {
                          controller.mobile.value = value!;
                        },
                        validator: (value)
                        {
                          //return controller.validateText(value!, "Mobile Number".tr);
                          return controller.validateLength(value!, 10, "Mobile Number");
                        },
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          labelText: 'Mobile Number',
                          labelStyle: TextStyle(color: Colors.grey.shade400),
                          suffixIcon: Icon(
                            CupertinoIcons.device_phone_portrait,
                            color: Colors.grey.shade400,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: redColor,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: primaryColor,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.width * 0.03),
                    // Gender Selection Button
                    Container(
                      width: size.width,
                      height: size.width / 5,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Obx(() {
                                  return Radio<String>(
                                    value: 'Boy',
                                    groupValue: controller.gender_type.value,
                                    onChanged: (value) {
                                      controller.setGender(value);
                                      //controller.address_type = valu!;
                                    },
                                    activeColor: Colors.purple,
                                    fillColor: MaterialStateProperty.all(
                                        primaryColor),
                                  );
                                }),
                                const Text(
                                  'Boy',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Obx(() {
                                  return Radio<String>(
                                    value: 'Girl',
                                    groupValue: controller.gender_type.value,
                                    onChanged: (value) {
                                      controller.setGender(value);
                                      //controller.address_type = valu!;
                                    },
                                    activeColor: Colors.purple,
                                    fillColor: MaterialStateProperty.all(
                                        primaryColor),
                                  );
                                }),
                                const Text(
                                  'Girl',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Obx(() {
                                  return Radio<String>(
                                    value: 'Other',
                                    groupValue: controller.gender_type.value,
                                    onChanged: (value) {
                                      controller.setGender(value);
                                      //controller.address_type = valu!;
                                    },
                                    activeColor: Colors.purple,
                                    fillColor: MaterialStateProperty.all(
                                        primaryColor),
                                  );
                                }),
                                const Text(
                                  'Other',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.width * 0.03),
                    //Button
                    InkWell(
                      onTap: () {
                        Get.toNamed('/select-interest');
                      },
                      child: EnterAnimation(
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          height: size.width / 7,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: InkWell(
                            onTap: ()=>{
                              controller.updateNow()
                            },
                            child: Stack(
                              children: const [
                                Center(
                                    child: Text(
                                      'Continue',
                                      style: buttonTitleStyle,
                                    )),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.width * 0.03),],),),
                SizedBox(height: size.width * 0.03),
                // Obx(() {
                //   return SizedBox(
                //     height: size.width * 0.15,
                //     width: double.infinity,
                //     child: profilePageController.currentAddress.value != ''
                //         ? Align(
                //       alignment: Alignment.centerLeft,
                //           child: Text(profilePageController.currentAddress.value,
                //           style: subTitle),
                //         )
                //         : profilePageController.isLocationLoading.value == true
                //         ? Center(child:Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: [
                //             LoadingAnimationWidget.threeRotatingDots(
                //                 color: secondaryColor, size: 20),
                //             SizedBox(width: size.width * 0.03),
                //             const Text('Searching Location')
                //           ],
                //         ),)
                //         : getLocationButton,
                //   );
                // }),
              ],),
          ),
        ),
      ),
    );
  }
}
