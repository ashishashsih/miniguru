import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../../constants.dart';
import '../controllers/project_list_controller.dart';

class ProjectListView extends GetView<ProjectListController> {
  const ProjectListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProjectListController projectListController = Get.put(
        ProjectListController());
    const String demoImage = 'https://t3.ftcdn.net/jpg/02/22/85/16/360_F_222851624_jfoMGbJxwRi5AWGdPgXKSABMnzCQo9RN.jpg';
    final size = MediaQuery
        .of(context)
        .size;
    final appBar = SizedBox(
      height: size.width * 0.1,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: Stack(
          children: [
            const Align(
                alignment: Alignment.bottomLeft,
                child: Text('Project List', style: titleStyle)),
            Align(
              alignment: Alignment.centerRight,
              child: Lottie.network(
                  'https://assets5.lottiefiles.com/packages/lf20_65fiagjg.json',
                  width: size.width * 0.15,
                  fit: BoxFit.cover
              ),
            ),
          ],
        ),
      ),
    );
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
          child: EnterAnimation(Column(children: [
            appBar,
            SizedBox(height: size.width * 0.05),
            //TabBar Tab's
            Expanded(flex: 0,child: Container(
              margin: const EdgeInsets.all(5),
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: redColor, width: 2.5),
              ),
              child: const Align(
                alignment: Alignment.center,
                child: TabBar(
                  labelStyle: headline,
                  labelColor: redColor,
                  indicatorColor: redColor,
                  unselectedLabelColor: Colors.grey,
                  unselectedLabelStyle: headline1,
                  indicatorWeight: 5,
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: true,
                  tabs: [
                    Tab(
                      text: 'Ongoing',
                    ),
                    Tab(
                      text: 'Completed',
                    ),
                    Tab(
                      text: 'In Future',
                    ),
                  ],
                ),
              ),
            ),
            ),
            SizedBox(height: size.width * 0.05),
            Obx(() {
              return Expanded(
                  flex: 1,
                  child: TabBarView(
                    physics: const ScrollPhysics(),
                    children: [
                      //OnGoing Projects
                      ListView.builder(
                          itemCount: projectListController.myProjectList.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return InkWell(
                              onTap:(){
                                if(projectListController.myProjectList[index].progress==100)
                                  {
                                     Fluttertoast.showToast(msg: "Project Already Completed");
                                  }else
                                    {
                                      Get.bottomSheet(Container(
                                        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                                        height: size.height/6,
                                        width: size.width,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            topLeft:  Radius.circular(20),
                                          ),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(children: [
                                            Text(projectListController.myProjectList[index].title,
                                              overflow: TextOverflow.ellipsis,
                                              style: titleStyle,
                                              maxLines: 2,),
                                            SizedBox(height: size.width * 0.05,),
                                            Row(
                                              children: [
                                                //Project Progress TextField
                                                Expanded(
                                                  flex: 1,
                                                  child: SizedBox(
                                                    height: size.width * 0.1,
                                                    width: size.width,
                                                    child: TextFormField(
                                                      controller: projectListController.textEditingControllerProgress,
                                                      keyboardType: TextInputType.number,
                                                      decoration: InputDecoration(
                                                        alignLabelWithHint: true,
                                                        contentPadding: const EdgeInsets.only(bottom: 5,left: 10),
                                                        labelText: 'Update Progress',
                                                        labelStyle: subTitle,
                                                        suffixIcon: const Icon(CupertinoIcons.percent,size: 20,),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(10),
                                                          borderSide: const BorderSide(
                                                            color: primaryColor,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        enabledBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(10),
                                                          borderSide: const BorderSide(
                                                            color: primaryColor,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: size.width * 0.01,),
                                                //Submit Button
                                                // Expanded(
                                                //   flex: 1,
                                                //     child: Container(
                                                //       height: size.width * 0.1,
                                                //       width: size.width,
                                                //       decoration: BoxDecoration(
                                                //         borderRadius: BorderRadius.circular(10),
                                                //         color: secondaryColor,
                                                //       ),
                                                //       child: const Center(child: Text('Upload Video',style: blueButtonSubTitle,),),
                                                //     )),
                                                // SizedBox(width: size.width * 0.01,),
                                                Expanded(
                                                    flex: 1,
                                                    child: InkWell(
                                                      onTap: ()=>
                                                      {
                                                        projectListController.setProgress()
                                                      },
                                                      child: Container(
                                                        height: size.width * 0.1,
                                                        width: size.width,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                          color: primaryColor,
                                                        ),
                                                        child: const Center(child: Text('Submit',style: blueButtonSubTitle,),),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ],),
                                        ),
                                      ));
                                    }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(7),
                                margin: const EdgeInsets.only(bottom: 20),
                                height: size.width * 0.5,
                                width: size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Column(
                                  children: [
                                    //Image & Title,Subtitle
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10),
                                        child: Row(
                                          children: [
                                            //Project Image
                                            Expanded(flex: 1, child: Container(
                                              margin: EdgeInsets.only(right: 10),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey.shade300),
                                                  borderRadius: BorderRadius.circular(
                                                      15),
                                                  image: const DecorationImage(
                                                      image: NetworkImage(demoImage),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                            ),
                                            //Title & Description
                                            Expanded(flex: 2, child: Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(projectListController.myProjectList[index].title,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: titleStyle,
                                                      maxLines: 2,),
                                                    Text(projectListController.myProjectList[index].description,
                                                      style: subTitle,
                                                      maxLines: 3,
                                                      overflow: TextOverflow.ellipsis,),
                                                  ],),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text('Start Date',
                                                          style: buttonSubTitleStyle,),
                                                        Text(
                                                          projectListController.myProjectList[index].startDate, style: subTitle,),
                                                      ],),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text('End Date',
                                                          style: buttonSubTitleStyle,),
                                                        Text(
                                                          projectListController.myProjectList[index].endDate, style: subTitle,),
                                                      ],),
                                                  ],
                                                ),
                                              ],)),
                                          ],),
                                      ),
                                    ),
                                    //Progress Indicator
                                    Expanded(
                                      flex: 0,
                                      child: LinearPercentIndicator(
                                        barRadius: const Radius.circular(30),
                                        lineHeight: size.width * 0.02,
                                        percent: setPercent(double.parse(projectListController.myProjectList[index].progress.toString())),
                                        backgroundColor: Colors.grey.shade300,
                                        progressColor: setColor(projectListController.myProjectList[index].progress),
                                        trailing: Text('${projectListController.myProjectList[index].progress}%', style: subTitle,),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                      //Completed Projects
                      ListView.builder(
                          itemCount: projectListController.myProjectList.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return InkWell(
                              onTap:(){
                                if(projectListController.myProjectList[index].progress==100)
                                {
                                  Fluttertoast.showToast(msg: "Project Already Complted");
                                }else
                                {
                                  Get.bottomSheet(Container(
                                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                                    height: size.height/6,
                                    width: size.width,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft:  Radius.circular(20),
                                      ),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(children: [
                                        Text(projectListController.myProjectList[index].title,
                                          overflow: TextOverflow.ellipsis,
                                          style: titleStyle,
                                          maxLines: 2,),
                                        SizedBox(height: size.width * 0.05,),
                                        Row(
                                          children: [
                                            //Project Progress TextField
                                            Expanded(
                                              flex: 1,
                                              child: SizedBox(
                                                height: size.width * 0.1,
                                                width: size.width,
                                                child: TextFormField(
                                                  controller: projectListController.textEditingControllerProgress,
                                                  keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                    alignLabelWithHint: true,
                                                    contentPadding: const EdgeInsets.only(bottom: 5,left: 10),
                                                    labelText: 'Update Progress',
                                                    labelStyle: subTitle,
                                                    suffixIcon: const Icon(CupertinoIcons.percent,size: 20,),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      borderSide: const BorderSide(
                                                        color: primaryColor,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      borderSide: const BorderSide(
                                                        color: primaryColor,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: size.width * 0.01,),
                                            //Submit Button
                                            // Expanded(
                                            //   flex: 1,
                                            //     child: Container(
                                            //       height: size.width * 0.1,
                                            //       width: size.width,
                                            //       decoration: BoxDecoration(
                                            //         borderRadius: BorderRadius.circular(10),
                                            //         color: secondaryColor,
                                            //       ),
                                            //       child: const Center(child: Text('Upload Video',style: blueButtonSubTitle,),),
                                            //     )),
                                            // SizedBox(width: size.width * 0.01,),
                                            Expanded(
                                                flex: 1,
                                                child: InkWell(
                                                  onTap: ()=>
                                                  {
                                                    projectListController.setProgress()
                                                  },
                                                  child: Container(
                                                    height: size.width * 0.1,
                                                    width: size.width,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: primaryColor,
                                                    ),
                                                    child: const Center(child: Text('Submit',style: blueButtonSubTitle,),),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ],),
                                    ),
                                  ));
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(7),
                                margin: const EdgeInsets.only(bottom: 20),
                                height: size.width * 0.5,
                                width: size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Column(
                                  children: [
                                    //Image & Title,Subtitle
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10),
                                        child: Row(
                                          children: [
                                            //Project Image
                                            Expanded(flex: 1, child: Container(
                                              margin: EdgeInsets.only(right: 10),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey.shade300),
                                                  borderRadius: BorderRadius.circular(
                                                      15),
                                                  image: const DecorationImage(
                                                      image: NetworkImage(demoImage),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                            ),
                                            //Title & Description
                                            Expanded(flex: 2, child: Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(projectListController.myProjectList[index].title,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: titleStyle,
                                                      maxLines: 2,),
                                                    Text(projectListController.myProjectList[index].description,
                                                      style: subTitle,
                                                      maxLines: 3,
                                                      overflow: TextOverflow.ellipsis,),
                                                  ],),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text('Start Date',
                                                          style: buttonSubTitleStyle,),
                                                        Text(
                                                          projectListController.myProjectList[index].startDate, style: subTitle,),
                                                      ],),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text('End Date',
                                                          style: buttonSubTitleStyle,),
                                                        Text(
                                                          projectListController.myProjectList[index].endDate, style: subTitle,),
                                                      ],),
                                                  ],
                                                ),
                                              ],)),
                                          ],),
                                      ),
                                    ),
                                    //Progress Indicator
                                    Expanded(
                                      flex: 0,
                                      child: LinearPercentIndicator(
                                        barRadius: const Radius.circular(30),
                                        lineHeight: size.width * 0.02,
                                        percent: setPercent(double.parse(projectListController.myProjectList[index].progress.toString())),
                                        backgroundColor: Colors.grey.shade300,
                                        progressColor: setColor(projectListController.myProjectList[index].progress),
                                        trailing: Text('${projectListController.myProjectList[index].progress}%', style: subTitle,),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                      //In Future Project's
                      ListView.builder(
                          itemCount: projectListController.myProjectList.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return InkWell(
                              onTap:(){
                                if(projectListController.myProjectList[index].progress==100)
                                {
                                  Fluttertoast.showToast(msg: "Project Already Complted");
                                }else
                                {
                                  Get.bottomSheet(Container(
                                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                                    height: size.height/6,
                                    width: size.width,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft:  Radius.circular(20),
                                      ),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(children: [
                                        Text(projectListController.myProjectList[index].title,
                                          overflow: TextOverflow.ellipsis,
                                          style: titleStyle,
                                          maxLines: 2,),
                                        SizedBox(height: size.width * 0.05,),
                                        Row(
                                          children: [
                                            //Project Progress TextField
                                            Expanded(
                                              flex: 1,
                                              child: SizedBox(
                                                height: size.width * 0.1,
                                                width: size.width,
                                                child: TextFormField(
                                                  controller: projectListController.textEditingControllerProgress,
                                                  keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                    alignLabelWithHint: true,
                                                    contentPadding: const EdgeInsets.only(bottom: 5,left: 10),
                                                    labelText: 'Update Progress',
                                                    labelStyle: subTitle,
                                                    suffixIcon: const Icon(CupertinoIcons.percent,size: 20),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      borderSide: const BorderSide(
                                                        color: primaryColor,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      borderSide: const BorderSide(
                                                        color: primaryColor,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: size.width * 0.01,),
                                            //Submit Button
                                            // Expanded(
                                            //   flex: 1,
                                            //     child: Container(
                                            //       height: size.width * 0.1,
                                            //       width: size.width,
                                            //       decoration: BoxDecoration(
                                            //         borderRadius: BorderRadius.circular(10),
                                            //         color: secondaryColor,
                                            //       ),
                                            //       child: const Center(child: Text('Upload Video',style: blueButtonSubTitle,),),
                                            //     )),
                                            // SizedBox(width: size.width * 0.01,),
                                            Expanded(
                                                flex: 1,
                                                child: InkWell(
                                                  onTap: ()=>
                                                  {
                                                    projectListController.setProgress()
                                                  },
                                                  child: Container(
                                                    height: size.width * 0.1,
                                                    width: size.width,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: primaryColor,
                                                    ),
                                                    child: const Center(child: Text('Submit',style: blueButtonSubTitle,),),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ],),
                                    ),
                                  ));
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(7),
                                margin: const EdgeInsets.only(bottom: 20),
                                height: size.width * 0.5,
                                width: size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Column(
                                  children: [
                                    //Image & Title,Subtitle
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10),
                                        child: Row(
                                          children: [
                                            //Project Image
                                            Expanded(flex: 1, child: Container(
                                              margin: EdgeInsets.only(right: 10),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey.shade300),
                                                  borderRadius: BorderRadius.circular(
                                                      15),
                                                  image: const DecorationImage(
                                                      image: NetworkImage(demoImage),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                            ),
                                            //Title & Description
                                            Expanded(flex: 2, child: Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(projectListController.myProjectList[index].title,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: titleStyle,
                                                      maxLines: 2,),
                                                    Text(projectListController.myProjectList[index].description,
                                                      style: subTitle,
                                                      maxLines: 3,
                                                      overflow: TextOverflow.ellipsis,),
                                                  ],),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text('Start Date',
                                                          style: buttonSubTitleStyle,),
                                                        Text(
                                                          projectListController.myProjectList[index].startDate, style: subTitle,),
                                                      ],),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text('End Date',
                                                          style: buttonSubTitleStyle,),
                                                        Text(
                                                          projectListController.myProjectList[index].endDate, style: subTitle,),
                                                      ],),
                                                  ],
                                                ),
                                              ],)),
                                          ],),
                                      ),
                                    ),
                                    //Progress Indicator
                                    Expanded(
                                      flex: 0,
                                      child: LinearPercentIndicator(
                                        barRadius: const Radius.circular(30),
                                        lineHeight: size.width * 0.02,
                                        percent: setPercent(double.parse(projectListController.myProjectList[index].progress.toString())),
                                        backgroundColor: Colors.grey.shade300,
                                        progressColor: setColor(projectListController.myProjectList[index].progress),
                                        trailing: Text('${projectListController.myProjectList[index].progress}%', style: subTitle,),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ],
                  ));
            }),
          ],),
          ),
        ),),
      ),
    );
  }
  double setPercent(double asm)
  {
    double vvel=asm/100;
    return vvel;
  }

  setColor(int asm)
  {
    if(asm<40)
      {
       return Colors.red;
      }else if(asm<70)
      {
       return Colors.yellow;
      }else
      {
       return Colors.green;
      }
  }
}
