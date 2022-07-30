import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:mini_guru/app/modules/cart/controllers/cart_controller.dart';
import 'package:mini_guru/app/modules/cart/views/cart_view.dart';
import 'package:mini_guru/app/modules/model/CartModel.dart';
import 'package:mini_guru/constants.dart';

import '../controllers/shop_item_controller.dart';

class ShopItemView extends GetView<ShopItemController> {
  const ShopItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    ShopItemController controller = Get.put(ShopItemController());
    final size = MediaQuery
        .of(context)
        .size;
    //AppBar
    final appBar = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('John Smith 🖐️', style: titleStyle),
          SizedBox(width: size.width * 0.05),
          InkWell(
            onTap: () => Get.to(CartView(), transition: Transition.upToDown),
            child: Badge(
              badgeContent: Obx(() {
                return Text(
                  cartController.productList.length != null ? cartController
                      .productList.length.toString() : "0",
                  style: blueButtonSubTitle,);
              }),
              //badgeColor: Colors.black.withOpacity(0.6),
              child: Image.asset(
                'images/cart.png',
                height: size.width * 0.075,
                width: size.width * 0.075,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
    //Button
    final addToCart = SizedBox(
      height: size.width * 0.1,
      child: Obx(() {
        return Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (controller.quant.value == 0) {

                            } else {
                              controller.quant.value--;
                            }
                          },
                          child: Container(
                            height: size.width * 0.14,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                            child: const Icon(
                              CupertinoIcons.minus_circle,
                              color: Colors.white,),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          controller.quant.value.toString(),
                          style: headline,
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () =>
                          {
                            controller.quant.value++
                          }, //shopController.itemCount.value++,
                          child: Container(
                            height: size.width * 0.14,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: const Icon(
                              CupertinoIcons.plus_circle, color: Colors.white,),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            SizedBox(width: size.width * 0.01),

            controller.quant.value == 0 ? Container() : Expanded(
              flex: 1,
              child: InkWell(
                onTap: () =>
                {
                cartController.searthProd.value=cartController.productList.where((element) => element.productId.isEqual(controller.productId.value)).toList(),
                  print("${cartController.productList.length}Size is here${cartController.searthProd.length}"),
                  cartController.productList.add(CartModel(id: 0,
                      productId: controller.productId.value,
                      name: controller.productName.value,
                      quantity: controller.quant.value,
                      price: controller.price.value,
                      image: controller.image.value))
                // if(cartController.searthProd.isEmpty)
                //   {
                //     cartController.productList.add(CartModel(id: 0,
                //         productId: controller.productId.value,
                //         name: controller.productName.value,
                //         quantity: controller.quant.value,
                //         price: controller.price.value,
                //         image: controller.image.value))
                //   }else
                //     {
                //     Fluttertoast.showToast(msg: "Product already  in cart")
                //     }
                },
                child: Container(
                  // height: size.width * 0.12,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                  child: Stack(
                    children: [
                      const Center(child: Text(
                          'Add to cart', style: buttonTitleStyle)),
                      SizedBox(width: size.width * 0.02),
                      const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(CupertinoIcons.arrow_right, size: 20))
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: size.width / 7,
            width: double.infinity,
            // decoration: BoxDecoration(
            //   color: secondaryColor,
            //   borderRadius: BorderRadius.circular(15,),
            // )
            child:
            addToCart,
          ),),
        body: Obx(() {
          return SafeArea(child: Padding(padding: const EdgeInsets.only(
              left: 10, right: 10, top: 15, bottom: 80),
            child: EnterAnimation(SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appBar,
                  SizedBox(height: size.width * 0.05,),
                  Container(
                    height: size.width * 1,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey.shade300),
                        image: DecorationImage(
                          image: NetworkImage(controller.image.value),
                          fit: BoxFit.cover,
                        )
                    ),
                  ),
                  SizedBox(height: size.width * 0.05,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('DC Robotic Motor', style: headline,),
                      Container(
                        height: size.width * 0.1,
                        width: size.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                          boxShadow: [BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 2,
                          )
                          ],
                        ),
                        child: Center(
                          child: Text('₹ ${controller.price.value}/-',
                            style: buttonTitleStyle,),),
                      ),
                    ],
                  ),
                  SizedBox(height: size.width * 0.03,),
                  Text(controller.description.value,
                    style: headline1,),
                  SizedBox(height: size.width * 0.03,),
                  const Text('Quantity: Pack of (2 PC)', style: subTitle,),
                ],),
            )),
          ),);
        })
    );
  }
}
