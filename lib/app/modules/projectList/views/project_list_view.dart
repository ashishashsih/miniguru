import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../../constants.dart';
import '../controllers/project_list_controller.dart';

class ProjectListView extends GetView<ProjectListController> {
  const ProjectListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appBar = SizedBox(
      height: size.width/6,
      child: Stack(
        children: [
          const Center(child: Text('Project List',style: titleStyle,)),
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
          //Wallet Button
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {},
              child: Container(
                height: size.width * 0.15,
                width: size.width* 0.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    border: Border.all(color: Colors.grey)
                ),
                child: const Center(child: Icon(Icons.account_balance_wallet_outlined),),
              ),
            ),
          )
        ],
      ),
    );
    return Scaffold(
      body: SafeArea(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: SingleChildScrollView(
          child: EnterAnimation(Column(children: [
              appBar,
              SizedBox(
                height: size.width * 0.05,
              ),
              //Introduction & Basics
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
                        child: const Center(child: FaIcon(FontAwesomeIcons.magnifyingGlass,color: Colors.white,size: 30,),),
                      ),
                    ),
                    SizedBox(width: size.width * 0.05,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Introduction & Basics',style: titleStyle,),
                        const Text('Advance web Applications.',style: subTitle,),
                        LinearPercentIndicator(
                          barRadius: const Radius.circular(30),
                          width: size.width * 0.5,
                          lineHeight: size.width * 0.02,
                          percent: 0.7,
                          backgroundColor: Colors.grey.shade300,
                          progressColor: primaryColor,
                          trailing: const Text('70%',style: subTitle,),
                        ),
                      ],
                    ),
                  ],),
              ),
              SizedBox(
                height: size.width * 0.05,
              ),
            ],),
          ),
        ),
      ),),
    );
  }
}
