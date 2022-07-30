import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_guru/app/modules/home/views/home_view.dart';
import 'package:mini_guru/app/modules/indroduction/views/indroduction_view.dart';
import 'package:mini_guru/app/modules/myProjects/views/my_projects_view.dart';
import 'package:mini_guru/app/modules/projectList/views/project_list_view.dart';
import 'package:mini_guru/app/modules/shop/views/shop_view.dart';
import '../../myCourses/views/my_courses_view.dart';
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
          ProjectListView(),
          const ShopView(),
          OrderListView(),
        ],
      ),
      bottomNavigationBar: Obx(() {
        return AnimatedBottomNavigationBar(
          height: size.width * 0.17,
          activeColor: Colors.black,
          splashColor: Colors.black,
          splashRadius: 50.0,
          inactiveColor: Colors.black38,
          backgroundColor: Colors.white,
          borderColor: Colors.black,
          borderWidth: 3,
          iconSize: 30,
          notchMargin: 10,
          icons: const [
            CupertinoIcons.house_alt,
            CupertinoIcons.graph_circle,
            CupertinoIcons.tv_circle,
            CupertinoIcons.shopping_cart,
            CupertinoIcons.bag,
          ],
          shadow: const Shadow(
            color: Colors.grey,
            blurRadius: 7.0,
          ),
          gapLocation: GapLocation.end,
          notchSmoothness: NotchSmoothness.sharpEdge,
          onTap: (index) {
            barController.currentIndex.value = index;
            barController.pageController.jumpToPage(index);
          },
          activeIndex: barController.currentIndex.value,
          //other params
        );
      }),
      floatingActionButton: SizedBox(
        height: size.width * 0.15,
        width: size.width * 0.15,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () =>
              Get.to(MyProjectsView(), transition: Transition.downToUp),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/plus.png', fit: BoxFit.cover,),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
