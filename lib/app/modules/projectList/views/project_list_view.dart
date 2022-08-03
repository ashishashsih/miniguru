import 'package:flutter/material.dart';
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
    const String demoImage = 'https://t3.ftcdn.net/jpg/02/22/85/16/360_F_222851624_jfoMGbJxwRi5AWGdPgXKSABMnzCQo9RN.jpg';
    final size = MediaQuery.of(context).size;
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
    return Scaffold(
      body: SafeArea(child: Padding(padding: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 5),
        child: EnterAnimation(Column(children: [
          Expanded(
            flex: 0,
              child: Column(
                children: [
            appBar,
            SizedBox(
              height: size.width * 0.05,
            ),
          ],)),
          Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: 2,
                  itemBuilder: (BuildContext ctx, int index){
                return Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(bottom: 20),
                  height: size.width * 0.45,
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
                        child: Row(
                          children: [
                            //Project Image
                            Expanded(flex:1,child: Container(
                              margin: EdgeInsets.only(right: 10,bottom: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(15),
                                  image: const DecorationImage(
                                    image: NetworkImage(demoImage),
                                    fit: BoxFit.cover
                                  )
                                ),
                              ),
                            ),
                            //Title Subtitle
                            Expanded(flex: 2,child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                               Text('Title of the Project',style: titleStyle,),
                               Text('Advance web Applications.',style: subTitle,),
                            ],)),
                          ],),
                      ),
                      //Progress Indicator
                      Expanded(
                        flex: 0,
                        child: LinearPercentIndicator(
                          barRadius: const Radius.circular(30),
                          lineHeight: size.width * 0.02,
                          percent: 0.7,
                          backgroundColor: Colors.grey.shade300,
                          progressColor: primaryColor,
                          trailing: const Text('70%',style: subTitle,),
                        ),
                      ),
                    ],
                  ),
                );
              })),
          ],),
        ),
      ),),
    );
  }
}
