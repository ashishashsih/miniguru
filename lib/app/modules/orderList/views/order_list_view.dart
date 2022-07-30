import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/order_list_controller.dart';
import 'package:mini_guru/constants.dart';

class OrderListView extends GetView<OrderListController> {
  const OrderListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appBar = SizedBox(
      height: size.width * 0.1,
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 5),
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.bottomLeft,
                child: Text('Billing Detail\'s',style: titleStyle)),
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
      length: 2,
      child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: EnterAnimation(Column(
                children: [
                  appBar,
                  SizedBox(height: size.width * 0.05,),
                  //TabBar Tab's
                  Expanded(
                    flex: 0,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: secondaryColor,width: 2.5),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: TabBar(
                          labelStyle: headline1,
                          labelColor: Colors.black,
                          indicatorColor: Colors.black,
                          indicatorWeight: 5,
                          indicatorSize: TabBarIndicatorSize.tab,
                          isScrollable: true,
                          tabs: [
                            Tab(
                              text: 'Pending Orders',
                            ),
                            Tab(
                              text: 'Completed Orders',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.width * 0.05,),
                  //TabBar View's
                  Expanded(
                    flex: 1,
                    child: TabBarView(
                      children: [
                        ///Pending Orders
                        ListView.builder(
                            itemCount: 2,
                            itemBuilder: (BuildContext ctx, int index) {
                              return Container(
                                width: size.width,
                                margin: const EdgeInsets.only(left: 10,right: 10,bottom: 15),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const[
                                      Text('Item Total:',style: headline1),
                                      Text('₹ 1290/-',style: buttonSubTitleStyle),
                                    ],),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text('Order Date:',style: headline1),
                                      Text('DD/MM/YY',style: buttonSubTitleStyle),
                                    ],),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text('Order Status:',style: headline1),
                                      Text('Pending',style: TextStyle(color: redColor,fontWeight: FontWeight.bold,fontSize: 15),),
                                    ],),
                                  const Divider(),
                                ExpandableNotifier(
                                    child: ScrollOnExpand(
                                      scrollOnExpand: true,
                                      scrollOnCollapse: false,
                                      child: ExpandablePanel(
                                        header: const Text(
                                          'Order Detail\'s',
                                          style: headline1,
                                        ),
                                        collapsed: Container(),
                                        expanded: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: Colors.black),
                                          ),
                                          child: Column(children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: const[
                                                Text('Glue Gun:',style: headline1),
                                                Text('₹ 290/-',style: buttonSubTitleStyle),
                                              ],),
                                            const Divider(),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: const[
                                                Text('Glue Stick:',style: headline1),
                                                Text('₹ 90/-',style: buttonSubTitleStyle),
                                              ],),
                                            const Divider(),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: const[
                                                Text('Hammer:',style: headline1),
                                                Text('₹ 100/-',style: buttonSubTitleStyle),
                                              ],),
                                          ],),
                                        ),
                                        builder: (_, collapsed, expanded) {
                                          return Expandable(
                                            collapsed: collapsed,
                                            expanded: expanded,
                                          );
                                        },
                                      ),
                                    )),
                                ],),
                              );
                            }),
                        ///Complete Orders
                        ListView.builder(
                            itemCount: 2,
                            itemBuilder: (BuildContext ctx, int index) {
                              return Container(
                                width: size.width,
                                margin: const EdgeInsets.only(left: 10,right: 10,bottom: 15),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const[
                                      Text('Item Total:',style: headline1),
                                      Text('₹ 1290/-',style: headline1),
                                    ],),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text('Order Date:',style: headline1),
                                      Text('DD-MM-YY',style: headline1),
                                    ],),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text('Order Status:',style: headline1),
                                      Text('Complete',style: TextStyle(color: greenColor,fontWeight: FontWeight.bold,fontSize:15 ),),
                                    ],),
                                  const Divider(),
                                  ExpandableNotifier(
                                      child: ScrollOnExpand(
                                        scrollOnExpand: true,
                                        scrollOnCollapse: false,
                                        child: ExpandablePanel(
                                          header: const Text(
                                            'Order Detail\'s',
                                            style: headline1,
                                          ),
                                          collapsed: Container(),
                                          expanded: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(color: Colors.black),
                                            ),
                                            child: Column(children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: const[
                                                  Text('Glue Gun:',style: headline1),
                                                  Text('₹ 290/-',style: buttonSubTitleStyle),
                                                ],),
                                              const Divider(),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: const[
                                                  Text('Glue Stick:',style: headline1),
                                                  Text('₹ 90/-',style: buttonSubTitleStyle),
                                                ],),
                                              const Divider(),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: const[
                                                  Text('Hammer:',style: headline1),
                                                  Text('₹ 100/-',style: buttonSubTitleStyle),
                                                ],),
                                            ],),
                                          ),
                                          builder: (_, collapsed, expanded) {
                                            return Expandable(
                                              collapsed: collapsed,
                                              expanded: expanded,
                                            );
                                          },
                                        ),
                                      )),
                                ],),
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
              ),
            ),
          )),
    );
  }
}

