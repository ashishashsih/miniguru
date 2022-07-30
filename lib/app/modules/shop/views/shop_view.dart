import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
import 'package:get/get.dart';
import 'package:mini_guru/app/modules/model/shopItems.dart';
import 'package:mini_guru/app/modules/profilePage/controllers/profile_page_controller.dart';
import 'package:mini_guru/app/modules/shopItem/views/shop_item_view.dart';
import 'package:mini_guru/others/NameIdModel.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../constants.dart';
import '../../appProfile/views/app_profile_view.dart';
import '../controllers/shop_controller.dart';

class ShopView extends GetView<ShopController> {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ShopController controller = Get.put(ShopController());
    ProfilePageController profilePageController=Get.put(ProfilePageController());
    final size = MediaQuery
        .of(context)
        .size;

    // final List<ShopItems> shopItems = [
    //   ShopItems(
    //       itemImage: 'https://popuplearning.pk/wp-content/uploads/2020/02/1-141-dc-gear-motor-for-robot-2-motors-with-wheels.jpg',
    //       itemName: 'DC Robot Motor wkdjawkdjkklwdb',
    //       itemPrice: '1900'
    //   ),
    //   ShopItems(
    //       itemImage: 'https://upload.wikimedia.org/wikipedia/commons/b/b2/Stanley-Hot-Glue-Gun-GR35K.jpg',
    //       itemName: 'Glue Gun',
    //       itemPrice: '700'
    //   ),
    //   ShopItems(
    //       itemImage: 'https://www.woodtoolsanddeco.com/8232-medium_default/basic-soldering-iron-30-w-12-meters-cable.jpg',
    //       itemName: 'Soldering Rod',
    //       itemPrice: '900'
    //   ),
    //   ShopItems(
    //       itemImage: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/estwing-framing-hammer-1647440220.jpg',
    //       itemName: 'Hammer',
    //       itemPrice: '1500'
    //   ),
    //   ShopItems(
    //       itemImage: 'https://pimdatacdn.bahco.com/media/sub623/16a0feb9514f183f.png',
    //       itemName: 'Screw Driver',
    //       itemPrice: '1799'
    //   ),
    // ];

    //AppBar
    final appBar = Row(
      children: [
        //const Text('John Smith 🖐️', style: titleStyle),
        Expanded(
          flex: 3,
            child: FittedBox(child: Text('John Smith 🖐️', style: titleStyle),
            //Text('${profilePageController.studentName.value} 🖐️', style: titleStyle)
            )),
        Spacer(),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed("/cart");
                },
                child: Badge(
                  badgeContent: Obx(() {
                    return Text(controller.productList.length.toString(),
                      style: TextStyle(fontSize: 10, color: Colors.white),);
                  }),
                  child: Image.asset(
                    'images/cart.png',
                    height: size.width * 0.06,
                    width: size.width * 0.06,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: size.width * 0.05),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  'images/wallet.png',
                  height: size.width * 0.06,
                  width: size.width * 0.06,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ],
    );
    //Search TextField
    final searchField = Container(
      padding: const EdgeInsets.only(left: 10, right: 20),
      width: size.width,
      height: size.width / 7,
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(15)),
      child: CupertinoTextField(
        controller: controller.searchController,
        onChanged: (value)
        {
          controller.filterNow(value);
        },
        placeholder: 'Search',
        placeholderStyle: subTitle,
        suffix: const Icon(Icons.search),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: EnterAnimation(Column(children: [
            Flexible(
                flex: 0,
                child: Column(children: [
                  appBar,
                  SizedBox(height: size.height * 0.02),
                  // TextField(
                  //   style: TextStyle(fontSize: 18),
                  //   controller: controller.searchController,
                  //   onChanged: (value)
                  //   {
                  //     // setState(() {
                  //     //   searchCategory=categoryList.where((element) =>element.name.toLowerCase().contains(value.toLowerCase())).toList();
                  //     // });
                  //   },
                  //   //decoration: InputDecoration(hintText: "Search Category",border: OutlineInputBorder(),contentPadding: EdgeInsets.only(left: 10,top: 5,bottom: 5)),
                  //   decoration: InputDecoration(
                  //     hintText: 'Search Category',
                  //     filled: true,
                  //     fillColor: Colors.white,
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  //       borderSide: BorderSide(color: primaryColor, width: 2),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  //       borderSide: BorderSide(color: primaryColor),
                  //     ),
                  //   ),),
                  searchField,
                  SizedBox(height: size.height * 0.02),
                  // const Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text('Shopping', style: headline,),
                  // ),
                  // SizedBox(height: size.height * 0.02),
                  // //Toggle Button's
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child:
                  //   Obx(() {
                  //     return Container(
                  //       width: size.width,
                  //       height: 40,
                  //       child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  //         children: List.generate(
                  //           controller.categoryList.length, (index) =>
                  //             getChip(controller.categoryList[index], index),
                  //         ),
                  //       ),
                  //     );
                  //   }),),
                  // ToggleSwitch(
                  //   minWidth: size.width,
                  //   dividerColor: Colors.black54,
                  //   inactiveBgColor: Colors.grey.shade200,
                  //   activeBgColor: const [secondaryColor],
                  //   activeFgColor: Colors.black,//Active Text Color
                  //   inactiveFgColor: Colors.black38,//Inactive Text Color
                  //   animate: true,
                  //   animationDuration: 300,
                  //   initialLabelIndex: 0,
                  //   totalSwitches: 3,
                  //   labels: ['Trending', 'All', 'New'],
                  //   fontSize: size.width * 0.03,
                  //   onToggle: (value)
                  //   {
                  //       print(value);
                  //   },
                  // ),
                ],)),
            SizedBox(height: size.width * 0.03,),
            Obx(() {
              return Flexible(
                flex: 1,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2,
                      childAspectRatio: size.width * 80 / size.width * 0.01,
                    ),
                    itemCount: controller.filteredProductList.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Image Container
                            Expanded(
                              flex: 3,
                              child: InkWell(
                                onTap: () =>
                                    Get.to(ShopItemView(),
                                        transition: Transition.downToUp,
                                        arguments: [
                                          controller.filteredProductList[index]
                                              .id
                                        ]),
                                //Get.toNamed('/shop-item',arguments:[controller.filteredProductList[index].id]),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            controller.productList[index]
                                                .image),
                                        fit: BoxFit.cover
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller.filteredProductList[index]
                                        .name,
                                      style: headline1,
                                      overflow: TextOverflow.ellipsis,),
                                    SizedBox(height: size.width * 0.01),
                                    Text('₹ ${controller
                                        .filteredProductList[index]
                                        .price}/-', style: buttonSubTitleStyle),
                                  ],),
                              ),
                            )
                          ],),
                      );
                    }
                ),
              );
            }),
          ],)),
        ),),
    );
  }

  Widget getChip(NameIdModel nameIdBean, int index) {
    return Padding(
        padding: EdgeInsets.only(left: 2),
        child: ChoiceChip3D(
          style: ChoiceChip3DStyle(
            topColor: controller.selectedCategory.value == nameIdBean.id
                ? secondaryColor
                : Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
          onSelected: () {
            controller.selectedCategory.value = nameIdBean.id;
            controller.filterProduct();
          },
          onUnSelected: () {},
          child: Text(nameIdBean.name, style: headline1,),
        ));
  }
}
