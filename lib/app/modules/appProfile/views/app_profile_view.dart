import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mini_guru/app/modules/achievements/views/achievements_view.dart';
import 'package:mini_guru/app/modules/notificationSettings/views/notification_settings_view.dart';
import 'package:mini_guru/app/modules/prefrences/views/prefrences_view.dart';
import '../../../../constants.dart';
import '../controllers/app_profile_controller.dart';

class AppProfileView extends GetView<AppProfileController> {
  const AppProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appBar = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Profile 🌟',style: titleStyle,),
        InkWell(
          onTap: ()=> Get.back(),
          child: Container(
            height: size.width/7,
            width: size.width/7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                border: Border.all(color: Colors.grey)
            ),
            child: const Center(child: Icon(Icons.arrow_back_ios_new),),
          ),
        )
      ],
    );
    Widget settingsWidget(
        {required String title,
        required String description,
        required Color iconBackColor,
        required Color iconColor,
        required IconData iconData}){
      return DelayedDisplay(
        delay: const Duration(milliseconds: 200),
        slidingBeginOffset: const Offset(0, -0.4),
        child: Container(
          padding: const EdgeInsets.all(15),
          height: size.width * 0.3,
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
                  height: size.width * 0.12,
                  width: size.width* 0.12,
                  decoration: BoxDecoration(
                    color: iconBackColor,
                    borderRadius: BorderRadius.circular(150),
                  ),
                  child: Center(child: FaIcon(iconData,color: iconColor,size: 25,),),
                ),
              ),
              SizedBox(width: size.width * 0.05,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(title,style: headline,),
                  Text(description,style: subTitle,),
                ],
              ),
            ],),
        ),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(children: [
              appBar,
              SizedBox(height: size.width * 0.02),
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
                          backgroundImage: NetworkImage(
                              'https://t3.ftcdn.net/jpg/02/22/85/16/360_F_222851624_jfoMGbJxwRi5AWGdPgXKSABMnzCQo9RN.jpg',
                          ),
                        ),
                      ),
                    ),
                    //Profile Edit Button
                    Container(
                        height: size.width/12,
                        width: size.width/5,
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child:const Center(child: Text('Edit',style: TextStyle(color: Colors.black),),)
                    )
                  ],
                ),
              ),
              SizedBox(height: size.width * 0.05),
              const Align(
                  alignment: Alignment.center,
                  child: Text('John Smith 💯',style: titleStyle),
              ),
              SizedBox(height: size.width * 0.02),
              const Align(
                  alignment: Alignment.center,
                  child: Text('johnsmith@gmail.com',style: subTitle),
              ),
              SizedBox(height: size.width * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Container(
                  height: size.width * 0.15,
                  width: size.width * 0.4,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(child: Text('Log Out',style: buttonTitleStyle,)),
                ),
                Container(
                  height: size.width * 0.15,
                  width: size.width * 0.4,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(child: Text('Edit',style: buttonTitleStyle,)),
                ),
              ],),
              SizedBox(height: size.width * 0.05),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Settings ⚙',style: titleStyle),
              ),
              SizedBox(
                height: size.width * 0.05,
              ),
              //Achievement
              InkWell(
                onTap: ()=> Get.to(AchievementsView(),transition: Transition.downToUp),
                child: settingsWidget(
                    title: 'Achievement',
                    description: 'You have received 10\nnew badges this month',
                   iconBackColor: primaryColor,
                   iconColor:Colors.white,
                  iconData:FontAwesomeIcons.file
                ),
              ),
              SizedBox(
                height: size.width * 0.05,
              ),
              //Notifications
              InkWell(
                onTap: ()=>Get.to(NotificationSettingsView(),transition: Transition.downToUp),
                child: settingsWidget(
                    title:'Notifications',
                    description:'Manage how we send\nyou notifications',
                    iconBackColor: secondaryColor,
                    iconColor:Colors.white,
                    iconData: FontAwesomeIcons.star
                ),
              ),
              SizedBox(
                height: size.width * 0.05,
              ),
              //Preferences
              InkWell(
                onTap: ()=> Get.to(PrefrencesView(),transition: Transition.downToUp),
                child: settingsWidget(
                    title:'Preferences',
                    description:'Manage all preferences\nand permissions',
                    iconBackColor: redColor,
                    iconColor:Colors.white,
                    iconData: FontAwesomeIcons.heart
                ),
              ),
            ],),
          ),
        ),
      ),
    );
  }
}
