import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mini_guru/app/modules/achievements/views/achievements_view.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
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
        const Text(
          'Profile 🌟',
          style: titleStyle,
        ),
        InkWell(
          onTap: () => Get.back(),
          child: Container(
            height: size.width / 7,
            width: size.width / 7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                border: Border.all(color: Colors.grey)),
            child: const Center(
              child: Icon(Icons.arrow_back_ios_new),
            ),
          ),
        )
      ],
    );
    Widget settingsWidget(
        {required GestureTapCallback onTap,
        required String title,
        required Color iconBackColor,
        required Color iconColor,
        required IconData iconData}) {
      return InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: size.width * 0.12,
                      width: size.width * 0.12,
                      decoration: BoxDecoration(
                        color: iconBackColor,
                        borderRadius: BorderRadius.circular(150),
                      ),
                      child: Center(
                        child: FaIcon(
                          iconData,
                          color: iconColor,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Text(title, style: headline),
                ],
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: EnterAnimation(
              Column(
                children: [
                  appBar,
                  SizedBox(height: size.width * 0.02),
                  //Profile View
                  Stack(
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
                          height: size.width / 12,
                          width: size.width / 5,
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                            child: Text(
                              'Edit',
                              style: TextStyle(color: Colors.black),
                            ),
                          ))
                    ],
                  ),
                  SizedBox(height: size.width * 0.05),
                  const Align(
                    alignment: Alignment.center,
                    child: Text('John Smith 💯', style: titleStyle),
                  ),
                  SizedBox(height: size.width * 0.02),
                  const Align(
                    alignment: Alignment.center,
                    child: Text('johnsmith@gmail.com', style: subTitle),
                  ),
                  SizedBox(height: size.width * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //Logout Button
                      Container(
                        height: size.width * 0.13,
                        width: size.width * 0.4,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                            child: Text(
                          'Log Out',
                          style: buttonTitleStyle,
                        )),
                      ),
                      //Edit Profile Button
                      Container(
                        height: size.width * 0.13,
                        width: size.width * 0.4,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                            child: Text(
                          'Edit',
                          style: buttonTitleStyle,
                        )),
                      ),
                    ],
                  ),
                  SizedBox(height: size.width * 0.05),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Settings ⚙', style: titleStyle),
                  ),
                  SizedBox(
                    height: size.width * 0.03,
                  ),
                  //Achievement
                  settingsWidget(
                      title: 'Achievement',
                      iconBackColor: primaryColor,
                      iconColor: Colors.white,
                      iconData: FontAwesomeIcons.file,
                      onTap: () {
                        Get.to(AchievementsView(),
                            transition: Transition.downToUp);
                      }),
                  SizedBox(
                    height: size.width * 0.03,
                  ),
                  //Achievement
                  settingsWidget(
                      title: 'Share Us',
                      iconBackColor: secondaryColor,
                      iconColor: Colors.white,
                      iconData: Icons.share,
                      onTap: () async {
                        Share.share('Share Us with Your Friend\'s & Family',
                            subject: 'This is our learning App');
                      }),
                  SizedBox(
                    height: size.width * 0.03,
                  ),
                  //About us
                  settingsWidget(
                      title: 'About Us',
                      iconBackColor: redColor,
                      iconColor: Colors.white,
                      iconData: FontAwesomeIcons.listUl,
                      onTap: () {}),
                  SizedBox(
                    height: size.width * 0.03,
                  ),
                  //Privacy Policy
                  settingsWidget(
                      title: 'Privacy Policy',
                      iconBackColor: greenColor,
                      iconColor: Colors.white,
                      iconData: Icons.privacy_tip_outlined,
                      onTap: () {
                        launchUrl(Uri.parse(
                            'https://developerzone.in/raddiwala/privacy-policy'));
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
