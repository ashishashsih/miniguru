import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
import 'package:get/get.dart';
import 'package:mini_guru/app/modules/cart/controllers/cart_controller.dart';
import 'package:mini_guru/app/modules/profilePage/controllers/profile_page_controller.dart';
import 'package:mini_guru/app/modules/shopItem/views/shop_item_view.dart';
import 'package:mini_guru/others/NameIdModel.dart';
import '../../../../constants.dart';
import '../controllers/shop_controller.dart';

class ShopView extends GetView<ShopController> {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ShopController controller = Get.put(ShopController());
    ProfilePageController profilePageController=Get.put(ProfilePageController());
    CartController cartController=Get.put(CartController());
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
        Expanded(
          flex: 1,
            child: FittedBox(child: Text('John Smith 🖐️', style: titleStyle),
            //Text('${profilePageController.studentName.value} 🖐️', style: titleStyle)
            )),
        Spacer(),
        Expanded(
          flex: 0,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed("/cart");
                },
                child: Badge(
                  badgeContent: Obx(() {
                    return Text(cartController.productList.length.toString(),
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
        padding: EdgeInsets.only(top: 5,left: 5),
        placeholder: 'Search Product\'s',
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
                  searchField,
                  SizedBox(height: size.height * 0.02),
                ],)),
            SizedBox(height: size.width * 0.01,),
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
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            border: Border.all(color:Colors.grey.shade400),
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
                                    Get.to(const ShopItemView(),
                                        transition: Transition.downToUp,
                                        arguments: [
                                          controller.filteredProductList[index].id
                                        ]),
                                //Get.toNamed('/shop-item',arguments:[controller.filteredProductList[index].id]),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color:Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            controller.productList[index].image),
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
