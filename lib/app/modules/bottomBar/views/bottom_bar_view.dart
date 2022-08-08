import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_guru/app/modules/bottomBar/controllers/bottom_bar_controller.dart';
import 'package:mini_guru/app/modules/home/views/home_view.dart';
import 'package:mini_guru/app/modules/myProjects/views/my_projects_view.dart';
import 'package:mini_guru/app/modules/projectList/views/project_list_view.dart';
import 'package:mini_guru/app/modules/shop/views/shop_view.dart';
import 'package:mini_guru/constants.dart';
import '../../orderList/views/order_list_view.dart';
import '../../progressReport/views/progress_report_view.dart';

class BottomBarView extends GetView<BottomBarController>
{
  BottomBarController barController = Get.put(BottomBarController());
  @override
  Widget build(BuildContext context)
  {
    final size = MediaQuery
        .of(context)
        .size;
    Future<bool> showExitPopup() async {
      return await
      showDialog(
        //show confirm dialogue
        //the return value will be from "Yes" or "No" options
        context: context,
        builder: (context) => AlertDialog(

          title: Row(
            children: [
              Icon(Icons.exit_to_app,color: secondaryColor,),
              SizedBox(width: 10,),
              Text("Exit App".tr,style: TextStyle(fontFamily: "Varela")),
            ],
          ),
          elevation: 5.0,
          content: Text("Do you want to exit from the app".tr,style: TextStyle(fontFamily: "Varela")),
          actions:
          [
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green),),
              child: Text("Cancel".tr,style: TextStyle(fontFamily: "Varela",color: Colors.white),),
              onPressed:  ()
              {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red),),
              child: Text("Exit".tr,style: TextStyle(fontFamily: "Varela",color: Colors.white)),
              onPressed:() async
              {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        ),
      ) ??
          false; //if showDialouge had returned null, then return false
    }
    return new WillPopScope(
        onWillPop: showExitPopup,
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: barController.pageController,
        children: [
          HomeView(),
          const ProgressReportView(),
          const ProjectListView(),
          const ShopView(),
          const OrderListView(),
          const OrderListView(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Get.to(MyProjectsView(),transition: Transition.downToUp),
        backgroundColor: primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset('images/plus.png'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: Obx(() {
        return SizedBox(
          height: size.width * 0.15,
          width: size.width,
          child: BubbleBottomBar(
            opacity: 0.2,
            currentIndex: barController.currentIndex.value,
            onTap: (index) {
              barController.currentIndex.value = index!;
              barController.pageController.jumpToPage(index);
            },
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            elevation: 10,
            fabLocation: BubbleBottomBarFabLocation.end,
            //new
            hasNotch: true,
            //new
            hasInk: true,
            //new, gives a cute ink effect
            inkColor: Colors.black12,
            //optional, uses theme color if not specified
            items: const <BubbleBottomBarItem>[
              BubbleBottomBarItem(
                  backgroundColor: primaryColor,
                  icon: Icon(CupertinoIcons.house_alt, color: Colors.black54,),
                  activeIcon: Icon(CupertinoIcons.house_alt, color: primaryColor,),
                  title: Text("Home",style: TextStyle(fontSize: 12),)),

              BubbleBottomBarItem(
                  backgroundColor: secondaryColor,
                  icon: Icon(CupertinoIcons.graph_circle, color: Colors.black54,),
                  activeIcon: Icon(CupertinoIcons.graph_circle, color: secondaryColor,),
                  title: Text("Report",style: TextStyle(fontSize: 12))),

              BubbleBottomBarItem(
                  backgroundColor: redColor,
                  icon: Icon(Icons.folder_open, color: Colors.black54,),
                  activeIcon: Icon(Icons.folder_open, color: redColor,),
                  title: Text("Project\'s",style: TextStyle(fontSize: 12))),

              BubbleBottomBarItem(
                  backgroundColor: greenColor,
                  icon: Icon(CupertinoIcons.shopping_cart, color: Colors.black54,),
                  activeIcon: Icon(CupertinoIcons.shopping_cart, color: greenColor,),
                  title: Text("Shop",style: TextStyle(fontSize: 12))),

              BubbleBottomBarItem(
                  backgroundColor: primaryColor,
                  icon: Icon(CupertinoIcons.bag, color: Colors.black54,),
                  activeIcon: Icon(CupertinoIcons.bag, color: primaryColor,),
                  title: Text("Order\'s",style: TextStyle(fontSize: 12))),
            ],
          ),
        );
      }),
        )
    );
  }
}
