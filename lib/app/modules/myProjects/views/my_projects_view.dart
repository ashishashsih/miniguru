import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants.dart';
import '../../../../others/NameIdModel.dart';
import '../controllers/my_projects_controller.dart';

class MyProjectsView extends GetView<MyProjectsController> {
  const MyProjectsView({Key? key}) : super(key: key);

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
        ],
      ),
    );

    final GlobalKey formKey = GlobalKey();
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
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
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Project Title', style: headline1),
                          SizedBox(height: size.width * 0.02,),
                          //Project Title Field
                          SizedBox(
                            width: size.width,
                            height: size.width * 0.12,
                            child: TextFormField(
                              controller: controller.editingControllerTitle,
                              onSaved: (value)
                              {
                                controller.projectTitle.value = value!;
                              },
                              validator: (value) {
                                return controller.validateText(
                                    value!, "Project Title".tr);
                              },
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                labelText: 'Enter Title',
                                contentPadding: const EdgeInsets.only(bottom: 5,left: 10),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.width * 0.05,),
                          const Text('Description', style: headline1),
                          SizedBox(height: size.width * 0.02,),
                          //Project Title Field
                          TextFormField(
                            maxLines: 3,
                            controller: controller.editingControllerDescription,
                            onSaved: (value)
                            {
                              controller.projectDescription.value = value!;
                            },
                            validator: (value) {
                              return controller.validateText(
                                  value!, "Project Description".tr);
                            },
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              labelText: 'Write a detailed description...',
                              // contentPadding: const EdgeInsets.only(bottom: 5,left: 10),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: primaryColor,
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.width * 0.05,),
                          //Start & End Date
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          SizedBox(height: size.width * 0.05,),
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
                          SizedBox(height: size.width * 0.05,),
                          //Drop Down Widget
                          Container(
                            height: size.width * 0.1,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius:BorderRadius.circular(7),
                            ),
                            child: Center(
                              child: DropdownButtonHideUnderline(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: DropdownButton2(
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey.shade400),
                                    ),
                                    isExpanded: true,
                                    isDense: true,
                                    hint: const Text(
                                      'Select Age Group',
                                      style: blueButtonSubTitle
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                    ),
                                    onChanged: (_)
                                    {

                                    },
                                    items: controller.ageList.map<DropdownMenuItem<String>>((NameIdModel value) {
                                      return DropdownMenuItem<String>(
                                        value: value.id.toString(),
                                        child: Text(value.name,style: headline1,),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.width * 0.05,),
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
                            SizedBox(width: size.width * 0.03,),
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
                          ],),
                        ],
                      ),
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
