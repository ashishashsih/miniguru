import 'package:d_chart/d_chart.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../../constants.dart';
import '../controllers/progress_report_controller.dart';

class ProgressReportView extends GetView<ProgressReportController> {
  const ProgressReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProgressReportController controller = Get.put(ProgressReportController());
    final size = MediaQuery
        .of(context)
        .size;
    final appBar = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Progress Report',
          style: titleStyle,
        ),
        //Wallet Button
        InkWell(
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
        )
      ],
    );
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: SingleChildScrollView(
              child: EnterAnimation(Column(
                children: [
                  appBar,
                  SizedBox(height: size.width * 0.1),
                  Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    //Height of the main Container
                    height: size.width * 1.5,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Project Health card  📊', style: titleStyle,),
                        SizedBox(height: size.width * 0.01),
                        const Divider(thickness: 1,),
                        SizedBox(height: size.width * 0.01),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'No. of projects per month', style: headline1,),
                              Container(
                                height: size.width * 0.08,
                                width: size.width * 0.15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Center(child: Obx(() {
                                  return Text(
                                    controller.total_project.value.toString(),
                                    style: buttonTitleStyle,);
                                })),
                              ),
                            ],),
                        ),
                        SizedBox(height: size.width * 0.01),
                        const Divider(thickness: 1,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Complete Project', style: headline1,),
                              Container(
                                height: size.width * 0.08,
                                width: size.width * 0.15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Center(child: Obx(() {
                                  return Text(
                                    controller.complete_project.value
                                        .toString(),
                                    style: buttonTitleStyle,);
                                })),
                              ),
                            ],),
                        ),
                        SizedBox(height: size.width * 0.01),
                        // const Divider(thickness: 1,),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 10, right: 10),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       const Text(
                        //         'In Process Project', style: headline1,),
                        //       Container(
                        //         height: size.width * 0.08,
                        //         width: size.width * 0.15,
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(20),
                        //           border: Border.all(color: Colors.grey),
                        //         ),
                        //         child: Center(child: Obx(() {
                        //           return Text(
                        //             controller.complete_project.value
                        //                 .toString(),
                        //             style: buttonTitleStyle,);
                        //         })),
                        //       ),
                        //     ],),
                        // ),
                        // SizedBox(height: size.width * 0.01),
                        const Divider(thickness: 1),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Material used Graph', style: headline1,),
                              LinearPercentIndicator(
                                barRadius: const Radius.circular(30),
                                width: size.width * 0.3,
                                lineHeight: size.width * 0.02,
                                percent: 0.7,
                                backgroundColor: Colors.grey.shade300,
                                progressColor: primaryColor,
                                trailing: const Text('70%', style: subTitle,),
                              ),
                            ],),
                        ),
                        SizedBox(height: size.width * 0.01),
                        const Divider(thickness: 1),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Comment Graph', style: headline1,),
                              LinearPercentIndicator(
                                barRadius: const Radius.circular(30),
                                width: size.width * 0.3,
                                lineHeight: size.width * 0.02,
                                percent: 0.5,
                                backgroundColor: Colors.grey.shade300,
                                progressColor: primaryColor,
                                trailing: const Text('50%', style: subTitle,),
                              ),
                            ],),
                        ),
                        SizedBox(height: size.width * 0.01),
                        const Divider(thickness: 1),
                        Obx(() {
                          return Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: SizedBox(
                              height: size.width * 0.5,
                              child: DChartBar(
                                data: [
                                  {
                                    'id': 'Bar',
                                    'data':
                                    controller.chartData.map((element) {
                                      return {
                                        'domain': element['domain'],
                                        'measure': element['measure']
                                      };
                                    }).toList()
                                    // {'domain': 'Projects', 'measure': 3},
                                    // {'domain': 'Completed', 'measure': 4},
                                    // {'domain': 'Material', 'measure': 6},
                                    // {'domain': 'Comment\'s', 'measure': 2},

                                  },
                                ],
                                domainLabelPaddingToAxisLine: 16,
                                axisLineTick: 2,
                                axisLinePointTick: 2,
                                axisLinePointWidth: 10,
                                axisLineColor: Colors.black,
                                measureLabelPaddingToAxisLine: 20,
                                barColor: (barData, index, id) => primaryColor,
                                showBarValue: true,
                              ),
                            ),
                          );
                        }),
                      ],),
                  ),
                ],
              )),
            ),
          ),
        ));
  }
}
