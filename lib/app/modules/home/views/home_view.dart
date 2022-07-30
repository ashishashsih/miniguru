import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_guru/app/modules/courseLessons/views/course_lessons_view.dart';
import 'package:mini_guru/app/modules/filters/views/filters_view.dart';
import 'package:mini_guru/app/modules/indroduction/views/indroduction_view.dart';
import 'package:mini_guru/app/modules/notification/views/notification_view.dart';
import 'package:mini_guru/app/modules/shopItem/controllers/shop_item_controller.dart';
import 'package:mini_guru/constants.dart';
import '../../appProfile/views/app_profile_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeController homeController = Get.put(HomeController());
  //ShopItemController shopController = Get.put(ShopItemController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    const String demoImage = 'https://bsmedia.business-standard.com/_media/bs/img/article/2021-01/21/full/1611251685-5188.jpg';

    final courseDescriptionWidget = Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Video Widget
          InkWell(
            onTap: () =>
                Get.to(CourseLessonsView(), transition: Transition.downToUp),
            child: Container(
              height: size.width * 0.3,
              width: size.width,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://bsmedia.business-standard.com/_media/bs/img/article/2021-01/21/full/1611251685-5188.jpg'),
                    fit: BoxFit.cover
                ),
              ),
              child: Center(child: Icon(Icons.play_circle_filled_rounded,
                color: Colors.white.withOpacity(0.7), size: 45,),),
            ),
          ),
          const Text(
              'Java Script: Complete Beginner\'s guide', style: headline1),
          SizedBox(height: size.width * 0.02),
          const Text('John Smith ✔', style: buttonSubTitleStyle),
          SizedBox(height: size.width * 0.001),
          const Text.rich(TextSpan(
              text: '🌟 Rating: ',
              style: buttonSubTitleStyle,
              children: [
                TextSpan(
                    text: '4.5',
                    style: headline1
                )
              ]
          )),
        ],),
    );
    //AppBar
    final appBar = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () =>
              Get.to(AppProfileView(), transition: Transition.downToUp,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Hello,', style: subTitle),
              Text('John Smith 🖐️', style: titleStyle),
            ],
          ),
        ),
        //Wallet Button
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () =>
                Get.to(NotificationView(),
                    transition: Transition.rightToLeftWithFade),
            child: Container(
              height: size.width * 0.13,
              width: size.width * 0.13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  border: Border.all(color: Colors.grey)),
              child: const Center(
                child: Icon(CupertinoIcons.bell, size: 25,),
              ),
            ),
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
          onTap: () => Get.to(FiltersView(), transition: Transition.upToDown),
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
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: EnterAnimation(Column(
              children: [
                Expanded(
                  flex: 0,
                  child: Column(children: [
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
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 20, left: 15),
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
                                      Text('Score',
                                          style: TextStyle(fontSize: 25,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1)),
                                      Text(
                                          controller.score.value, style: TextStyle(fontSize: 20,
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
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: secondaryColor,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 20, left: 15),
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
                                          fontSize: 25,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1)),
                                      Text(
                                          controller.wallet_balance.value, style: TextStyle(fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5)),
                                    ],)
                                  ],),
                              )
                          ),
                        ),
                      ],);
                    }),
                    SizedBox(
                      height: size.width * 0.02,
                    ),
                  ],),
                ),
                Expanded(
                  flex: 1,
                  child: Obx(() {
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                          //childAspectRatio: size.width * 70 / size.width * 0.01,
                          childAspectRatio: .9,
                        ),
                        itemCount: controller.fdrList.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          return Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //Video Widget
                                InkWell(
                                  onTap: () =>
                                      Get.to(CourseLessonsView(),
                                          transition: Transition.downToUp),
                                  child: Container(
                                    height: size.width * 0.3,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
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
                                Text(
                                    controller.fdrList[index].title,
                                    style: headline1),
                                SizedBox(height: size.width * 0.02),
                                Text('${controller.fdrList[index].author} ✔',
                                    style: buttonSubTitleStyle),
                                SizedBox(height: size.width * 0.001),
                                Text.rich(TextSpan(
                                  text: '🌟 ${controller.fdrList[index].rating
                                      .toString()} ',
                                  style: buttonSubTitleStyle,

                                )),
                              ],),
                          );
                        }
                    );
                  }),
                ),
              ],
            ),
            ),
          ),
        ));
  }
}
