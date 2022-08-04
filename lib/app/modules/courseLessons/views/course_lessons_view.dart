import 'dart:math';

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants.dart';
import '../controllers/course_lessons_controller.dart';

class CourseLessonsView extends GetView<CourseLessonsController> {
  CourseLessonsController courseController = Get.put(CourseLessonsController());

  @override
  Widget build(BuildContext context) {
    const String demoImage = 'https://t3.ftcdn.net/jpg/02/22/85/16/360_F_222851624_jfoMGbJxwRi5AWGdPgXKSABMnzCQo9RN.jpg';
    final size = MediaQuery
        .of(context)
        .size;
    final appBar = SizedBox(
      height: size.width * 0.13,
      child: Stack(
        children: [
          const Center(
              child: Text(
                'JavaScript',
                style: titleStyle,
              )),
          //Back Button
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () => Get.back(),
              child: Container(
                height: size.width * 0.12,
                width: size.width * 0.12,
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
    //A,U,M,S,T Buttons
    Widget likeButtons({required String label, required String likes}) {
      return Badge(
        badgeColor: Colors.white70,
        badgeContent: Text(likes),
        child: Chip(
          padding: const EdgeInsets.all(0),
          backgroundColor: primaryColor,
          label: Text(
              label, style: const TextStyle(color: Colors.white, fontSize: 15,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w500)),
        ),
      );
    }
    // Widget commentsWidget(
    //     {required String userName, required String comment}) {
    //   return ;
    // }
    final addComment = SizedBox(
      height: size.width * 0.15,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(left: size.width * 0.05),
        child: Row(
          children: [
            //Comments Field
            Expanded(
              flex: 5,
              child: SizedBox(
                  height: size.width * 0.13,
                  child: CupertinoTextField(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    placeholder: 'Enter Comment',
                  )),
            ),
            SizedBox(width:size.width * 0.01),
            InkWell(
              onTap: () {
                courseController.showComment.value = false;
              },
              child: const Expanded(
                flex: 1,
                child: CircleAvatar(
                  backgroundColor: primaryColor,
                  radius: 25,
                  child: Center(child: Icon(
                    CupertinoIcons.arrow_right_circle, color: Colors.white,
                    size: 45,),),
                ),
              ),
            )
          ],
        ),
      ),
    );
    return Obx(() {
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: courseController.showComment.value == true
            ? EnterAnimation(addComment)
            : FloatingActionButton(
          onPressed: () {
            courseController.showComment.value = true;
            print(courseController.showComment.value);
          },
          backgroundColor: primaryColor,
          child: const Icon(
            CupertinoIcons.add_circled, size: 40, color: Colors.white,),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
            child: EnterAnimation(ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Column(
                  children: [
                    appBar,
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    //Video Widget
                    Container(
                      // margin: EdgeInsets.only(top: size.width * 0.2),
                        padding: const EdgeInsets.all(15),
                        height: size.width * 0.6,
                        width: size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'https://cdn.pixabay.com/photo/2015/01/08/18/25/desk-593327__340.jpg'),
                              fit: BoxFit.cover,
                            )),
                        child: Center(
                          child: Icon(
                            Icons.play_circle_filled_rounded,
                            size: 100,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        )),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    SizedBox(
                      height: size.height,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Wrap(
                            spacing: 20,
                            children: [
                              likeButtons(label: 'Aesthetic', likes: controller.aesthetic.value.toString()),
                              likeButtons(label: 'Unique', likes: controller.unique.value.toString()),
                              likeButtons(label: 'Creative', likes: controller.creative.value.toString()),
                              likeButtons(label: 'Useful', likes: controller.useful.value.toString()),
                              likeButtons(label: 'Interactive', likes: controller.interactive.value.toString()),
                              likeButtons(label: 'Gaming', likes: controller.gaming.value.toString()),
                            ],
                          ),
                          SizedBox(
                            height: size.width * 0.05,
                          ),
                          Text(
                            controller.title.value,
                            style: headline,
                          ),
                          SizedBox(
                            height: size.width * 0.01,
                          ),
                          Text(
                            controller.description.value,
                            style: subTitle,
                          ),
                          SizedBox(
                            height: size.width * 0.05,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Comment\'s',
                              style: titleStyle,
                            ),
                          ),
                          SizedBox(
                            height: size.width * 0.05,
                          ),
Column(children:
List.generate(controller.commentList.length, (index) =>
    Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: CircleAvatar(
              // backgroundColor:  Colors.primaries[Random().nextInt(Colors.primaries.length)],
              backgroundColor: courseController.generateRandomColor1(),
              radius: 20,
              child: Text(controller.commentList[index].name[0].toUpperCase(),style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(width: size.width * 0.02,),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(controller.commentList[index].name, style: headline1,),
                Text(controller.commentList[index].comment, style: subTitle,),
                Divider(color: Colors.black,)
              ],),
          )
        ],),
    )),)
                        ],),
                      ),
                    ),
                  ],
                )
              ],
            ),
            ),
          ),
        ),
      );
    });
  }
}
