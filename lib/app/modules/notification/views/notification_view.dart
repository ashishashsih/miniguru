import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../../constants.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appBar = DelayedDisplay(
      delay: const Duration(milliseconds: 200),
      slidingBeginOffset: const Offset(0.4,0),
      child: SizedBox(
        height: size.width/6,
        child: Stack(
          children: [
            const Center(child: Text('Notifications',style: titleStyle,)),
            //Back Button
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: ()=> Get.back(),
                child: Container(
                  height: size.width * 0.15,
                  width: size.width* 0.15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      border: Border.all(color: Colors.grey)
                  ),
                  child: const Center(child: Icon(Icons.arrow_back_ios_new),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return Scaffold(
      body: SafeArea(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: SingleChildScrollView(
          child: DelayedDisplay(
            slidingCurve: Curves.easeInOutBack,
            delay: const Duration(milliseconds: 200),
            slidingBeginOffset: const Offset(0.4,0),
            child: Column(children: [
              appBar,
              SizedBox(
                height: size.width * 0.05,
              ),
              //New Courses
              Container(
                padding: const EdgeInsets.all(15),
                height: size.width * 0.45,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: size.width * 0.15,
                        width: size.width* 0.15,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(150),
                        ),
                        child: const Center(child: FaIcon(FontAwesomeIcons.file,color: Colors.white,size: 30,),),
                      ),
                    ),
                    SizedBox(width: size.width * 0.05,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('New Courses',style: titleStyle,),
                        Text('We have released 10 new\ncourses just for you',style: subTitle,),
                        Text('Now',style: subTitle,),
                      ],
                    ),
                  ],),
              ),
              SizedBox(
                height: size.width * 0.05,
              ),
              //New Achievement
              Container(
                padding: const EdgeInsets.all(15),
                height: size.width * 0.45,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: size.width * 0.15,
                        width: size.width* 0.15,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(150),
                        ),
                        child: const Center(child: FaIcon(FontAwesomeIcons.star,color: Colors.white,size: 30,),),
                      ),
                    ),
                    SizedBox(width: size.width * 0.05,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('New Achievement',style: titleStyle,),
                        Text('We have just received 1 new\nbadge for all your work',style: subTitle,),
                        Text('Yesterday',style: subTitle,),
                      ],
                    ),
                  ],),
              ),
              SizedBox(
                height: size.width * 0.05,
              ),
              //Complete Purchase
              Container(
                padding: const EdgeInsets.all(15),
                height: size.width * 0.45,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: size.width * 0.15,
                        width: size.width* 0.15,
                        decoration: BoxDecoration(
                          color: redColor,
                          borderRadius: BorderRadius.circular(150),
                        ),
                        child: const Center(child: FaIcon(FontAwesomeIcons.wallet,color: Colors.white,size: 30,),),
                      ),
                    ),
                    SizedBox(width: size.width * 0.05,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Complete Purchase',style: titleStyle,),
                        Text('Please Complete your \npurchase now to get\na 50% discount',style: subTitle,),
                        Text('7 days ago',style: subTitle,),
                      ],
                    ),
                  ],),
              ),
              SizedBox(
                height: size.width * 0.05,
              ),
              //Unread Message
              Container(
                padding: const EdgeInsets.all(15),
                height: size.width * 0.45,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: size.width * 0.15,
                        width: size.width* 0.15,
                        decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(150),
                        ),
                        child: const Center(child: FaIcon(FontAwesomeIcons.message,color: Colors.white,size: 30,),),
                      ),
                    ),
                    SizedBox(width: size.width * 0.05,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Complete Purchase',style: titleStyle,),
                        Text('You have 3 unread messages\nin your mail box',style: subTitle,),
                        Text('16 days ago',style: subTitle,),
                      ],
                    ),
                  ],),
              ),
            ],),
          ),
        ),
      ),),
    );
  }
}
