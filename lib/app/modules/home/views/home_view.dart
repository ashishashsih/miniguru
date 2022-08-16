import 'package:confetti/confetti.dart';
import 'package:custom_pin_screen/custom_pin_screen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_guru/app/modules/courseLessons/views/course_lessons_view.dart';
import 'package:mini_guru/app/modules/notification/views/notification_view.dart';
import 'package:mini_guru/app/modules/profilePage/controllers/profile_page_controller.dart';
import 'package:mini_guru/app/modules/profilePage/views/profile_page_view.dart';
import 'package:mini_guru/constants.dart';
import 'package:mini_guru/others/NameIdModel.dart';
import '../../appProfile/views/app_profile_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeController homeController = Get.put(HomeController());
  ProfilePageController profilePageController = Get.put(
      ProfilePageController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    const String demoImage = 'https://bsmedia.business-standard.com/_media/bs/img/article/2021-01/21/full/1611251685-5188.jpg';

    var ageList = <NameIdModel>[
      NameIdModel(id: 1, name: '5-7'),
      NameIdModel(id: 1, name: '7-10'),
      NameIdModel(id: 1, name: '10-13')
    ];
    final appBar = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello,', style: subTitle),
              Text(getData(), style: headline),
            ],
          );
        }),
        //Notifications
        Align(
          alignment: Alignment.centerRight,
          child: Row(
            children: [
              InkWell(
                // onTap: () => Get.to(()=> const AppProfileView(),transition: Transition.downToUp),
                onTap: () {
                  Get.to(EnterAnimation(PinAuthentication(
                    pinTheme: PinTheme(
                        backgroundColor: secondaryColor,
                        textColor: Colors.black,
                        keysColor: Colors.black,
                        activeColor: Colors.black,
                        inactiveFillColor: Colors.black,
                        selectedFillColor: Colors.black,
                        activeFillColor: Colors.black,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    onSpecialKeyTap: ()=> print('Get Finger Print'),
                    useFingerprint: true,
                    action: 'Parental Control',
                    actionDescription: 'Provide us with the your Pin to continue',
                    onChanged: (val){
                      homeController.parentalPin.value = int.parse(val);
                    },
                    onbuttonClick: (){},
                    submitLabel: FloatingActionButton.extended(
                        backgroundColor: Colors.black,
                        onPressed: (){
                          if(homeController.parentalPin.value == 1111){
                            Get.back();
                            Get.to(()=> const AppProfileView(),transition: Transition.downToUp);
                          }else {
                            Get.snackbar(
                              'Incorrect Pin',
                              'Pin You Entered Was Incorrect',
                              colorText: Colors.white,
                              margin: const EdgeInsets.all(20),
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.black.withOpacity(0.6),
                            );
                          }
                        },
                        label: Text('SUBMIT',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1),)),
                  ),
                  ));
                },
                child: const Center(
                  child: Icon(
                    CupertinoIcons.person_alt_circle,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(width: size.width * 0.02),
              InkWell(
                onTap: () => Get.to(() => NotificationView(),
                    transition: Transition.rightToLeftWithFade),
                child: const Center(
                  child: Icon(
                    CupertinoIcons.bell,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
    //Search TextField
    final searchField = Row(children: [
      Expanded(
        flex: 6,
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 20),
          width: size.width,
          height: size.width / 7,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(150)),
          child: CupertinoTextField(
            placeholder: 'Search',
            placeholderStyle: subTitle,
            suffix: const Icon(Icons.search),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
      SizedBox(width: size.width * 0.02),
      Expanded(
        flex: 1,
        child: InkWell(
          onTap: () {
            Get.bottomSheet(Container(
              height: size.height / 2.5,
              width: size.width,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: EnterAnimation(Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Filters', style: buttonTitleStyle,),
                  //Age Filter
                  Container(
                    height: size.width * 0.12,
                    width: size.width,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
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
                              'Age',
                              style: buttonSubTitleStyle
                          ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                          ),
                          onChanged: (_) {},
                          items: ageList.map((NameIdModel value) {
                            return DropdownMenuItem<String>(
                              value: value.id.toString(),
                              child: Text(value.name),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  //Comments Filter
                  Container(
                    height: size.width * 0.12,
                    width: size.width,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
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
                              'Comments',
                              style: buttonSubTitleStyle
                          ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                          ),
                          onChanged: (_) {},
                          items: ageList.map((NameIdModel value) {
                            return DropdownMenuItem<String>(
                              value: value.id.toString(),
                              child: Text(value.name),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  //Material Filter
                  Container(
                    height: size.width * 0.12,
                    width: size.width,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
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
                              'Material',
                              style: buttonSubTitleStyle
                          ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                          ),
                          onChanged: (_) {},
                          items: ageList.map((NameIdModel value) {
                            return DropdownMenuItem<String>(
                              value: value.id.toString(),
                              child: Text(value.name),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  //Cancel & Upload Button
                  Row(children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: size.width * 0.1,
                        decoration: BoxDecoration(
                          border: Border.all(color: primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(child: Text(
                          'Cancel', style: buttonSubTitleStyle,),),
                      ),
                    ),
                    SizedBox(width: size.width * 0.03,),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(child: Text(
                          'Apply', style: blueButtonSubTitle,),),
                      ),
                    ),
                  ],),
                ],),
              ),
            ));
          },
          child: Image.asset(
            'images/filter.png',
            height: size.width * 0.1,
            width: size.width * 0.1,
          ),
        ),
      ),
    ],);
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 10, right: 10, top: 20, bottom: 5),
            child: EnterAnimation(Stack(
              children: [
                Column(
                  children: [
                    //Appbar, Search, Score, wallet & Filter
                    Expanded(flex: 0, child: Column(children: [
                      appBar,
                      SizedBox(
                        height: size.width * 0.04,
                      ),
                      searchField,
                      SizedBox(
                        height: size.width * 0.04,
                      ),
                      //Score & wallet Cards
                      Obx(() {
                        return Row(children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: primaryColor),
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Colors.cyan,
                                        Colors.indigo,
                                      ],
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        blurRadius: 5,
                                        spreadRadius: 2,
                                        offset: const Offset(-2, 3),
                                      ),
                                    ]
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 30, left: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Lottie.network(
                                          'https://assets3.lottiefiles.com/packages/lf20_fBCpuQ.json',
                                          height: size.width * 0.15,
                                          width: size.width * 0.05,
                                          fit: BoxFit.cover),
                                      Column(children: [
                                        const Text('Score',
                                            style: TextStyle(fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1)),
                                        Text(
                                            controller.score.value,
                                            style: const TextStyle(fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5)),
                                      ],)
                                    ],),
                                )
                            ),
                          ),
                          SizedBox(width: size.width * 0.03,),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              //Add To wallet
                              onTap: () {
                                Get.dialog(AlertDialog(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  content: EnterAnimation(Container(
                                    height: size.width * 0.5,
                                    width: size.width,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                      // gradient: const LinearGradient(
                                      //   colors: [
                                      //     Colors.indigo,
                                      //     Colors.cyan,
                                      //   ],
                                      // ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        const Text('Add Money To wallet',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: primaryColor,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1)),
                                        //Add Amount TextField
                                        SizedBox(
                                          height: size.width * 0.1,
                                          width: size.width,
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            controller: profilePageController.rechargeAmountController,
                                            decoration: InputDecoration(
                                              alignLabelWithHint: true,
                                              contentPadding: const EdgeInsets
                                                  .only(bottom: 5, left: 10),
                                              hintText: "Enter Amount",
                                              labelStyle: const TextStyle(
                                                  letterSpacing: 1,
                                                  fontSize: 15),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius
                                                    .circular(2),
                                                borderSide: const BorderSide(
                                                  width: 2.0,
                                                  color: Colors.black
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius
                                                    .circular(2),
                                                borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        //Cancel & Upload Button
                                        Row(children: [
                                          //Cancel Button
                                          Expanded(
                                            flex: 1,
                                            child: InkWell(
                                              onTap: () => Get.back(),
                                              child: Container(
                                                height: size.width * 0.1,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.white),
                                                  borderRadius: BorderRadius
                                                      .circular(10),
                                                ),
                                                child: const Center(child: Text(
                                                  'Cancel', style: TextStyle(
                                                    color: Colors.white),),),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: size.width * 0.03,),
                                          //Payment Button
                                          Expanded(
                                            flex: 1,
                                            child: InkWell(
                                              onTap: ()
                                              {
                                                profilePageController.openCheckout();
                                                homeController.isAnimate = true;
                                                homeController
                                                    .coinAnimationController
                                                    .play();
                                                Get.back();
                                              },
                                              child: Container(
                                                height: size.width * 0.1,
                                                decoration: BoxDecoration(
                                                  color: primaryColor,
                                                  border: Border.all(
                                                      color: Colors.white),
                                                  borderRadius: BorderRadius
                                                      .circular(10),
                                                ),
                                                child: const Center(child: Text(
                                                  'Add',
                                                  style: blueButtonSubTitle,),),
                                              ),
                                            ),
                                          ),
                                        ],),
                                      ],),
                                  ),
                                  ),
                                ));
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: primaryColor),
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Colors.indigo,
                                          Colors.cyan,
                                        ],
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade300,
                                          blurRadius: 5,
                                          spreadRadius: 2,
                                          offset: const Offset(-2, 3),
                                        ),
                                      ]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 30, left: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Lottie.network(
                                            'https://assets7.lottiefiles.com/packages/lf20_sifvozg6.json',
                                            height: size.width * 0.15,
                                            width: size.width * 0.05,
                                            fit: BoxFit.cover),
                                        Column(children: [
                                          Text('Wallet', style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1)),
                                          Text(
                                              controller.wallet_balance.value,
                                              style: TextStyle(fontSize: 15,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 0.5)),
                                        ],)
                                      ],),
                                  )
                              ),
                            ),
                          ),
                        ],);
                      }),
                      SizedBox(
                        height: size.width * 0.04,
                      ),
                    ],),
                    ),
                    //Video List's
                    Expanded(flex: 1, child: Obx(() {
                      return GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                          ),
                          itemCount: controller.fdrList.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //Video Widget
                                  Expanded(
                                    child: InkWell(
                                      onTap: () =>
                                          Get.to(CourseLessonsView(),
                                              transition: Transition.downToUp),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey),
                                          borderRadius: BorderRadius.circular(
                                              7),
                                          image: const DecorationImage(
                                              image: NetworkImage(
                                                  'https://bsmedia.business-standard.com/_media/bs/img/article/2021-01/21/full/1611251685-5188.jpg'),
                                              fit: BoxFit.cover
                                          ),
                                        ),
                                        child: Center(child: Icon(
                                          Icons.play_circle_filled_rounded,
                                          color: Colors.white.withOpacity(0.7),
                                          size: 45,),),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(controller.fdrList[index].title,
                                          style: headline1),
                                      SizedBox(height: size.width * 0.01),
                                      Text('${controller.fdrList[index]
                                          .author} ✔',
                                          style: buttonSubTitleStyle),
                                      SizedBox(height: size.width * 0.002),
                                      Text.rich(TextSpan(
                                        text: '🌟 ${controller.fdrList[index]
                                            .rating
                                            .toString()} ',
                                        style: buttonSubTitleStyle,
                                      )),
                                    ],),
                                ],),
                            );
                          }
                      );
                    }),
                    ),
                  ],
                ),
                homeController.isAnimate == true
                    ? Align(
                  alignment: Alignment.center,
                  child: ConfettiWidget(
                    confettiController: homeController.coinAnimationController,
                    blastDirectionality: BlastDirectionality.explosive,
                    shouldLoop: false,
                    colors: const [
                      primaryColor,
                      secondaryColor,
                      greenColor,
                      redColor
                    ],
                  ),
                )
                    : Container(),
              ],
            ),
            ),
          ),
        ));
  }

  String getData() {
    if (int.parse(controller.score.value) < 100) {
      return "${profilePageController.studentName.value}👍";
    } else if (int.parse(controller.score.value) >= 100 &&
        int.parse(controller.score.value) <= 500) {
      return "${profilePageController.studentName.value}👌";
    }
    return "${profilePageController.studentName.value}👑";
  }
}
