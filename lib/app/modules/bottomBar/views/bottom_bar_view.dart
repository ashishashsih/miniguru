import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_guru/app/modules/home/views/home_view.dart';
import 'package:mini_guru/app/modules/myProjects/views/my_projects_view.dart';
import 'package:mini_guru/app/modules/projectList/views/project_list_view.dart';
import 'package:mini_guru/app/modules/shop/views/shop_view.dart';
import 'package:mini_guru/constants.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../orderList/views/order_list_view.dart';
import '../../progressReport/views/progress_report_view.dart';
import '../controllers/bottom_bar_controller.dart';

class BottomBarView extends GetView<BottomBarController> {
  BottomBarController barController = Get.put(BottomBarController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: barController.pageController,
        children: [
          HomeView(),
          const ProgressReportView(),
          const ProjectListView(),
          const ShopView(),
          const OrderListView(),
        ],
      ),
      floatingActionButton: Obx((){
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(100)
          ),
          child: SalomonBottomBar(
              onTap: (index) {
                barController.currentIndex.value = index;
                barController.pageController.jumpToPage(index);
              },
              currentIndex: barController.currentIndex.value,
              items:[
                SalomonBottomBarItem(
                  icon: Icon(CupertinoIcons.house_alt),
                  title: Text('Home'),
                  selectedColor: primaryColor,
                ),

                /// Home
                SalomonBottomBarItem(
                  icon: Icon(CupertinoIcons.graph_circle),
                  title: Text('Report'),
                  selectedColor: secondaryColor,
                ),

                /// Search
                SalomonBottomBarItem(
                  icon: Icon(CupertinoIcons.tv_circle),
                  title: Text("Project List"),
                  selectedColor: redColor,
                ),

                /// Profile
                SalomonBottomBarItem(
                  icon: Icon(CupertinoIcons.shopping_cart),
                  title: Text("Shop"),
                  selectedColor: greenColor,
                ),
                /// Profile
                SalomonBottomBarItem(
                  icon: Icon(CupertinoIcons.bag),
                  title: Text("Orders"),
                  selectedColor: primaryColor,
                ),
              ]),
        );
      }),
      // bottomNavigationBar: Obx(() {
      //   return AnimatedBottomNavigationBar(
      //     height: size.width * 0.17,
      //     activeColor: Colors.black,
      //     splashColor: Colors.black,
      //     splashRadius: 50.0,
      //     inactiveColor: Colors.black38,
      //     backgroundColor: Colors.white,
      //     borderColor: Colors.black,
      //     borderWidth: 3,
      //     iconSize: 30,
      //     notchMargin: 10,
      //     icons: const [
      //       CupertinoIcons.house_alt,
      //       CupertinoIcons.graph_circle,
      //       CupertinoIcons.tv_circle,
      //       CupertinoIcons.shopping_cart,
      //       CupertinoIcons.bag,
      //     ],
      //     shadow: const Shadow(
      //       color: Colors.grey,
      //       blurRadius: 7.0,
      //     ),
      //     gapLocation: GapLocation.end,
      //     notchSmoothness: NotchSmoothness.sharpEdge,
      //     onTap: (index) {
      //       barController.currentIndex.value = index;
      //       barController.pageController.jumpToPage(index);
      //     },
      //     activeIndex: barController.currentIndex.value,
      //     //other params
      //   );
      // }),
      // floatingActionButton: SizedBox(
      //   height: size.width * 0.15,
      //   width: size.width * 0.15,
      //   child: FloatingActionButton(
      //     backgroundColor: Colors.white,
      //     onPressed: () =>
      //         Get.to(MyProjectsView(), transition: Transition.downToUp),
      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Image.asset('images/plus.png', fit: BoxFit.cover,),
      //     ),
      //   ),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
