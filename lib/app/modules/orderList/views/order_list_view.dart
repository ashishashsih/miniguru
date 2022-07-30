import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_list_controller.dart';
import 'package:mini_guru/constants.dart';
import 'package:intl/intl.dart';

class OrderListView extends GetView<OrderListController> {
  const OrderListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: EnterAnimation(Column(
                children: [
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
                  Expanded(
                    flex: 1,
                    child: TabBarView(
                      children: [
                        ///Pending Orders
                        ListView.builder(
                            itemCount: 4,
                            itemBuilder: (BuildContext ctx, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Card(
                                  elevation: 5.0,
                                  shadowColor: Colors.grey.shade400,
                                  child: ListTile(
                                    leading: Container(
                                      height: size.width * 0.15,
                                      width: size.width * 0.15,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: const DecorationImage(
                                            image: NetworkImage('https://popuplearning.pk/wp-content/uploads/2020/02/1-141-dc-gear-motor-for-robot-2-motors-with-wheels.jpg'),
                                            fit: BoxFit.cover
                                        ),
                                      ),
                                    ),
                                    //Item Name
                                    title: const Text('DC Robot Motor',
                                      style: headline1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    //Item Price
                                    subtitle:const Text('₹ 1900/-',
                                        style: buttonTitleStyle),
                                    trailing: Text(DateFormat("yyyy-MM-dd").format(DateTime.now())),
                                  ),
                                ),
                              );
                            }),
                        ///Completed Orders
                        ListView.builder(
                            itemCount: 2,
                            itemBuilder: (BuildContext ctx, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Card(
                                  elevation: 5.0,
                                  shadowColor: Colors.grey.shade400,
                                  child: ListTile(
                                    leading: Container(
                                      height: size.width * 0.15,
                                      width: size.width * 0.15,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: const DecorationImage(
                                            image: NetworkImage('https://popuplearning.pk/wp-content/uploads/2020/02/1-141-dc-gear-motor-for-robot-2-motors-with-wheels.jpg'),
                                            fit: BoxFit.cover
                                        ),
                                      ),
                                    ),
                                    //Item Name
                                    title: const Text('DC Robot Motor',
                                      style: headline1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    //Item Price
                                    subtitle: const Text('₹ 1800/-',
                                        style: buttonTitleStyle),
                                    trailing: Text(DateFormat("yyyy-MM-dd").format(DateTime.now())),
                                  ),
                                ),
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

