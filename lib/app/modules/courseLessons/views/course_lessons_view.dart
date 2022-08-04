import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_viewer/video_viewer.dart';
import '../../../../constants.dart';
import '../controllers/course_lessons_controller.dart';

class CourseLessonsView extends GetView<CourseLessonsController> {
  CourseLessonsController courseController = Get.put(CourseLessonsController());

  @override
  Widget build(BuildContext context) {
    const String demoImage =
        'https://t3.ftcdn.net/jpg/02/22/85/16/360_F_222851624_jfoMGbJxwRi5AWGdPgXKSABMnzCQo9RN.jpg';
    final size = MediaQuery.of(context).size;
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
          label: Text(label,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w500)),
        ),
      );
    }
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
            SizedBox(width: size.width * 0.01),
            InkWell(
              onTap: () {
                courseController.showComment.value = false;
              },
              child: const Expanded(
                flex: 1,
                child: CircleAvatar(
                  backgroundColor: primaryColor,
                  radius: 25,
                  child: Center(
                    child: Icon(
                      CupertinoIcons.arrow_right_circle,
                      color: Colors.white,
                      size: 45,
                    ),
                  ),
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
                  CupertinoIcons.add_circled,
                  size: 40,
                  color: Colors.white,
                ),
              ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
            child: EnterAnimation(Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    appBar,
                    SizedBox(height: size.width * 0.05),
                    //Video Widget
                    SizedBox(
                        width: size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: VideoViewer(
                            looping: true,
                            controller: courseController.videoController,
                            source: {
                              'Video': VideoSource(
                                video: VideoPlayerController.network('https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4')
                              )
                            },
                          ),
                        ),
                    ),
                    SizedBox(height: size.width * 0.05),
                    //Like Buttons
                    Wrap(
                      spacing: 20,
                      children: [
                        likeButtons(
                            label: 'Aesthetic',
                            likes: controller.aesthetic.value.toString()),
                        likeButtons(
                            label: 'Unique',
                            likes: controller.unique.value.toString()),
                        likeButtons(
                            label: 'Creative',
                            likes: controller.creative.value.toString()),
                        likeButtons(
                            label: 'Useful',
                            likes: controller.useful.value.toString()),
                        likeButtons(
                            label: 'Interactive',
                            likes: controller.interactive.value.toString()),
                        likeButtons(
                            label: 'Gaming',
                            likes: controller.gaming.value.toString()),
                      ],
                    ),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    //Title
                    Text(
                      controller.title.value,
                      style: headline,
                    ),
                    SizedBox(
                      height: size.width * 0.01,
                    ),
                    //Description
                    Text(
                      controller.description.value,
                      style: subTitle,
                    ),
                    Divider(),
                  ],),
                  SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Comment Text
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Comment\'s',
                              style: titleStyle,
                            ),
                          ),
                          SizedBox(
                            height: size.width * 0.03,
                          ),
                          Column(children: List.generate(
                                controller.commentList.length,
                                (index) => Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: CircleAvatar(
                                                  backgroundColor: courseController.generateRandomColor(),
                                                  radius: 20,
                                                  child: Text(
                                                    controller
                                                        .commentList[index].name[0]
                                                        .toUpperCase(),
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.02,
                                              ),
                                              Expanded(
                                                flex: 6,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      controller
                                                          .commentList[index].name,
                                                      style: headline1,
                                                    ),
                                                    Text(
                                                      controller
                                                          .commentList[index].comment,
                                                      style: subTitle,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          const Divider(),
                                        ],
                                      ),
                                    )),)
                        ],
                      ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
