import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants.dart';
import '../controllers/my_projects_controller.dart';

class MyProjectsView extends GetView<MyProjectsController> {
  @override
  Widget build(BuildContext context) {
    MyProjectsController controller = Get.put(MyProjectsController());
    final size = MediaQuery
        .of(context)
        .size;
    //AppBar
    final appBar = SizedBox(
      height: size.width / 6,
      child: Stack(
        children: [
          const Center(
              child: Text(
                'Add Project',
                style: titleStyle,
              )),
          //Back Button
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () => Get.back(),
              child: Container(
                height: size.width * 0.15,
                width: size.width * 0.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    border: Border.all(color: Colors.grey)),
                child: const Center(
                  child: Icon(Icons.arrow_back_ios_new),
                ),
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
                width: size.width * 0.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    border: Border.all(color: Colors.grey)),
                child: const Center(
                  child: Icon(Icons.account_balance_wallet_outlined),
                ),
              ),
            ),
          )
        ],
      ),
    );
    final floatingButton = Container();
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: floatingButton,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
            child: EnterAnimation(SingleChildScrollView(
              child: Column(
                children: [
                  appBar,
                  SizedBox(height: size.width * 0.1),
                  Container(
                    padding: const EdgeInsets.all(10),
                    //Main Height of the container
                    height: size.width * 1.3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey.shade300),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: const Offset(-3, 3),
                          ),
                          const BoxShadow(
                            color: Colors.white70,
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: Offset(3, -3),
                          ),
                        ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Project Title', style: headline1),
                        SizedBox(height: size.width * 0.01,),
                        //Project Title Field
                        SizedBox(
                            height: size.width * 0.13,
                            width: size.width,
                            child: CupertinoTextField(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              placeholder: 'Enter Title',
                            )),
                        SizedBox(height: size.width * 0.03,),
                        const Text('Description', style: headline1),
                        SizedBox(height: size.width * 0.01,),
                        //Project Title Field
                        SizedBox(
                            height: size.width * 0.3,
                            width: size.width,
                            child: CupertinoTextField(
                              maxLines: 5,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              placeholder: 'Write a detailed Description....',
                            )),
                        SizedBox(height: size.width * 0.03,),
                        //Start & End Date
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //Start Date Button
                            Container(
                              height: size.width * 0.1,
                              width: size.width * 0.35,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 5),
                                      color: Colors.grey.withOpacity(0.4),
                                      blurRadius: 4,
                                    ),
                                  ]
                              ),
                              child: Center(child: InkWell(onTap: () =>
                              {
                                controller.selectStartDate()
                              }, child: Obx(() {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [Icon(Icons.calendar_month_outlined,color: Colors.white,),
                                    Text('${controller.startDate.value}',
                                      style: blueButtonSubTitle,),
                                  ],
                                );
                              })),),
                            ),
                            //Start Date Button
                            Container(
                              height: size.width * 0.1,
                              width: size.width * 0.35,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 5),
                                      color: Colors.grey.withOpacity(0.4),
                                      blurRadius: 4,
                                    ),
                                  ]
                              ),
                              child: Center(child: InkWell(onTap: () =>
                              {
                                controller.selectEndDate()
                              }, child: Obx(() {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [Icon(Icons.calendar_month_outlined,color: Colors.white,),
                                    //SizedBox(width: 5,),
                                    Text('${controller.endDate.value}',
                                      style: blueButtonSubTitle,),
                                  ],
                                );
                              })),),
                            ),
                          ],),
                        SizedBox(height: size.width * 0.03,),
                        const Text('Sketch', style: headline1),
                        //Sketch Attachment
                        DottedBorder(
                          strokeWidth: 1,
                          borderType: BorderType.RRect,
                          color: primaryColor,
                          radius: const Radius.circular(15),
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            height: size.width * 0.2,
                            width: size.width,
                            decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: const Center(
                              child: Text('Tap To Select', style: subTitle,),),
                          ),
                        ),
                        const Spacer(),
                        //Cancel & Upload Button
                        Row(children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: size.width * 0.12,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Center(child: Text(
                                'Cancel', style: buttonSubTitleStyle,),),
                            ),
                          ),
                          SizedBox(width: size.width * 0.02,),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: size.width * 0.12,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Center(child: Text(
                                'Upload', style: blueButtonSubTitle,),),
                            ),
                          ),
                        ],)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ),
          ),
        ));
  }
}
