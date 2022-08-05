import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../constants.dart';
import '../../../../others/NameIdModel.dart';
import '../controllers/my_projects_controller.dart';

class MyProjectsView extends GetView<MyProjectsController> {
  const MyProjectsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyProjectsController controller = Get.put(MyProjectsController());
    const String demoImage = 'https://bsmedia.business-standard.com/_media/bs/img/article/2021-01/21/full/1611251685-5188.jpg';
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
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey.shade300),
                        boxShadow: [
                          // Shadow for top-left corner
                          BoxShadow(
                            color: Colors.grey.shade500,
                            offset: const Offset(10, 10),
                            blurRadius: 6,
                            spreadRadius: 1,
                          ),
                          // Shadow for bottom-right corner
                          const BoxShadow(
                            color: Colors.white70,
                            offset: Offset(-10, -10),
                            blurRadius: 6,
                            spreadRadius: 1,
                          ),
                        ]
                    ),
                    child: Form(
                      key: controller.profileFormKey,
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
                              onSaved: (value) {
                                controller.projectTitle.value = value!;
                              },
                              validator: (value) {
                                return controller.validateText(
                                    value!, "Project Title".tr);
                              },
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                labelText: 'Enter Title',
                                contentPadding: const EdgeInsets.only(
                                    bottom: 5, left: 10),
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
                            onSaved: (value) {
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
                          //Sketch Attachment & Start, End Date
                          Row(
                            children: [
                              Obx(() {
                                return Expanded(
                                  flex: 1,
                                  child: DottedBorder(
                                    strokeWidth: 1,
                                    borderType: BorderType.RRect,
                                    color: primaryColor,
                                    radius: const Radius.circular(15),
                                    padding: const EdgeInsets.all(5),
                                    child: InkWell(
                                      onTap: () {
                                        Get.defaultDialog(
                                            middleText: 'Select Image',
                                            title: 'My Project Sketch',
                                            barrierDismissible: true,
                                            radius: 5.0,
                                            confirm: InkWell(
                                              onTap: () {
                                                Get.back();
                                                controller.getImage(
                                                    ImageSource.gallery);
                                              },
                                              child: Card(
                                                elevation: 5,
                                                child: Container(
                                                    height: size.width * 0.25,
                                                    width: size.width * 0.25,
                                                    decoration: BoxDecoration(
                                                      color: primaryColor,
                                                      borderRadius:
                                                      BorderRadius.circular(5),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: const [
                                                        Icon(
                                                          CupertinoIcons
                                                              .photo_on_rectangle,
                                                          size: 50,
                                                          color: Colors.white,
                                                        ),
                                                        Text(
                                                          "Gallery",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontSize: 15),
                                                        )
                                                      ],
                                                    )),
                                              ),
                                            ),
                                            cancel: InkWell(
                                              onTap: () {
                                                Get.back();
                                                controller.getImage(
                                                    ImageSource.camera);
                                              },
                                              child: Card(
                                                elevation: 5,
                                                child: Container(
                                                    height: size.width * 0.25,
                                                    width: size.width * 0.25,
                                                    decoration: BoxDecoration(
                                                      color: primaryColor,
                                                      borderRadius:
                                                      BorderRadius.circular(5),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: const [
                                                        Icon(
                                                          CupertinoIcons
                                                              .camera_on_rectangle,
                                                          size: 50,
                                                          color: Colors.white,
                                                        ),
                                                        Text(
                                                          "Camera",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontSize: 15),
                                                        )
                                                      ],
                                                    )),
                                              ),
                                            ));
                                      },
                                      child: Container(
                                          height: size.width * 0.3,
                                          width: size.width,
                                          decoration: BoxDecoration(
                                              color: primaryColor.withOpacity(
                                                  0.1),
                                              borderRadius: BorderRadius
                                                  .circular(10)
                                          ),
                                          child: controller.sketch.value != ''
                                              ? ClipRRect(
                                              borderRadius: BorderRadius
                                                  .circular(10),
                                              child: Image.file(
                                                  File(controller.sketch.value),
                                                  fit: BoxFit.cover))
                                              : const Center(child: Text(
                                            'Tap To Select\nImage',
                                            textAlign: TextAlign.center,
                                            style: subTitle,))
                                      ),
                                    ),
                                  ),
                                );
                              }),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    //Start Date Button
                                    Container(
                                      height: size.width * 0.1,
                                      width: size.width * 0.35,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: const Offset(0, 5),
                                              color: Colors.grey.withOpacity(
                                                  0.4),
                                              blurRadius: 4,
                                            ),
                                          ]
                                      ),
                                      child: Center(child: InkWell(onTap: () =>
                                      {
                                        controller.selectStartDate()
                                      }, child: Obx(() {
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceAround,
                                          children: [
                                            const Icon(
                                              Icons.calendar_month_outlined,
                                              color: Colors.white,),
                                            Text(controller.startDate.value,
                                              style: blueButtonSubTitle,),
                                          ],
                                        );
                                      })),),
                                    ),
                                    SizedBox(height: size.width * 0.05,),
                                    //Start Date Button
                                    Container(
                                      height: size.width * 0.1,
                                      width: size.width * 0.35,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: const Offset(0, 5),
                                              color: Colors.grey.withOpacity(
                                                  0.4),
                                              blurRadius: 4,
                                            ),
                                          ]
                                      ),
                                      child: Center(child: InkWell(onTap: () =>
                                      {
                                        controller.selectEndDate()
                                      }, child: Obx(() {
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceAround,
                                          children: [
                                            const Icon(
                                              Icons.calendar_month_outlined,
                                              color: Colors.white,),
                                            //SizedBox(width: 5,),
                                            Text(controller.endDate.value,
                                              style: blueButtonSubTitle,),
                                          ],
                                        );
                                      })),),
                                    ),
                                  ],),
                              ),
                            ],
                          ),
                          SizedBox(height: size.width * 0.05,),
                          //Drop Down Widget & Material Select
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: size.width * 0.1,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Center(
                                    child: Obx(() {
                                      return DropdownButtonHideUnderline(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: DropdownButton2(
                                            dropdownDecoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.grey.shade400),
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
                                            onChanged: (data) {
                                              controller.selectedAgeGroup.value =
                                                  int.parse(data.toString());
                                              print(controller.selectedAgeGroup.value);
                                            },
                                            items: controller.ageList.map<
                                                DropdownMenuItem<String>>((
                                                NameIdModel value) {
                                              return DropdownMenuItem<String>(
                                                value: value.id.toString(),
                                                child: Text(
                                                  value.name, style: headline1,),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
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
                                  child: Center(child: InkWell(
                                    onTap: (){
                                      Get.bottomSheet(Container(
                                            height: size.height/1,
                                            width: size.width,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                )
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                              child: Column(children: [
                                                const Text('Search Material\'s',style: titleStyle,),
                                                SizedBox(height: size.width * 0.03),
                                                //Search TxtField
                                                Container(
                                                  padding: const EdgeInsets.only(left: 10, right: 20),
                                                  width: size.width,
                                                  height: size.width * 0.13,
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
                                                SizedBox(height: size.width * 0.03),
                                                //Material List
                                                Expanded(child: ListView.builder(
                                                  itemCount: 5,
                                                  itemBuilder: (_,int index){
                                                    return Column(
                                                      children: [
                                                        ListTile(
                                                          leading: Container(
                                                            height: size.width * 0.15,
                                                            width: size.width * 0.15,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(5),
                                                              image: const DecorationImage(
                                                                  image: NetworkImage(demoImage),
                                                                  fit: BoxFit.cover
                                                              ),
                                                            ),
                                                          ),
                                                          //Item Name
                                                          title: const Text(
                                                            'Material Name',
                                                            style: headline1,
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                          //Item Price
                                                          subtitle: const Text(
                                                              '₹ 1900/-',
                                                              style: buttonTitleStyle),
                                                          //Counter Button
                                                          trailing: Checkbox(onChanged: (bool? value) {value = value!;}, value: false,)
                                                          ,
                                                        ),
                                                        const Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                                          child: Divider(),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),),
                                              ],),
                                            ),
                                          )
                                      );
                                    }
                                    ,
                                    child: const Text(
                                      'Select Material', style: blueButtonSubTitle,),
                                  ),),
                                ),
                              ),
                            ],
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
                                child: Center(child: InkWell(
                                  onTap: (){controller.createProject();}
                                  ,
                                  child: const Text(
                                    'Create Project', style: blueButtonSubTitle,),
                                ),),
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
