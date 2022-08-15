import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_guru/constants.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController>
{
  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context)
  {
    cartController.setCartValue();
    final size = MediaQuery
        .of(context)
        .size;
    final appBar = SizedBox(
      height: size.width * 0.15,
      child: Stack(
        children: [
          const Center(
              child: Text(
                'My Cart',
                style: titleStyle,
              )),
          //Back Button
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () => Get.back(),
              child: Container(
                height: size.width * 0.13,
                width: size.width * 0.13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    border: Border.all(color: Colors.grey)),
                child: const Center(
                  child: Icon(Icons.arrow_back_ios_new),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    final wallet = Container(
      width: size.width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: secondaryColor,
          // border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 10,
                offset: const Offset(5, 10))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Wallet Balance', style: headline1),
              SizedBox(
                height: size.width * 0.01,
              ),
              const Text.rich(
                  TextSpan(text: '₹ ', style: titleStyle, children: [
                    TextSpan(
                      text: '1,900/-',
                      style: headline,
                    )
                  ])),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Column(
              children: [
                Lottie.network(
                    'https://assets9.lottiefiles.com/packages/lf20_xUyFWi.json',
                    height: size.width * 0.10,
                    fit: BoxFit.cover),
                SizedBox(
                  height: size.width * 0.01,
                ),
                const Text('Add Balance', style: buttonSubTitleStyle),
              ],
            ),
          ),
        ],
      ),
    );
    final addToCart = InkWell(
      onTap: (){},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: size.width / 7,
        width: double.infinity,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        child: Stack(
          children: [
            Obx(() {
              return Center(
                  child: InkWell(
                    onTap: (()=>
                    {
                      Get.toNamed('/display-address',arguments: [cartController.cartValue.value])
                    }),
                    child: Text.rich(
                        TextSpan(
                            text: 'Item Total : ',style: buttonTitleStyle, children: [
                          TextSpan(
                            text: '₹${cartController.cartValue.value.toString()}/-',
                            style: headline,
                          )
                        ])),
                  ));
            }),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                child: Icon(
                  CupertinoIcons.arrow_right_circle,
                  size: 20,
                ),
              ),
            )
          ],
        ),
      ),
    ); //Button

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: addToCart,
        ),
        body: SafeArea(
          child: Padding(
            padding:
            const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 80),
            child: EnterAnimation(
              Column(
                children: [
                  Flexible(
                    flex: 0,
                    child: Column(
                      children: [
                        appBar,
                        SizedBox(
                          height: size.width * 0.03,
                        ),
                        wallet
                      ],
                    ),
                  ),
                  SizedBox(height: size.width * 0.05),
                  Obx(() {
                    return Flexible(
                      flex: 1,
                      child: ListView.builder(
                          itemCount: controller.productList.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child:
                              Badge(
                                borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2
                                ),
                                badgeColor: Colors.red,
                                toAnimate: false,
                                shape: BadgeShape.square,
                                elevation: 2.0,
                                position: BadgePosition.topEnd(top: 1,end: 5),
                                borderRadius: BorderRadius.circular(10),
                                badgeContent: InkWell(
                                  onTap: ()=>controller.showConfirmDialog(context, index),
                                  child: Text("Delete", style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1,
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold)),
                                ),
                                // shape: BadgeShape.square,
                                // badgeContent: InkWell(onTap: ()=>controller.showConfirmDialog(context, index),
                                //     //child: const Icon(Icons.delete,color: Colors.white,size: 16,)),
                                //     child: const Text("Delete",style: TextStyle(color: Colors.white),)),
                                // position: BadgePosition.topEnd(),
                                // borderRadius: BorderRadiusGeometry(),
                                child: Card(
                                  elevation: 5.0,
                                  shadowColor: Colors.grey.shade400,
                                  child: ListTile(
                                    leading: Container(
                                      height: size.width * 0.15,
                                      width: size.width * 0.15,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                controller.productList[index]
                                                    .image),
                                            fit: BoxFit.cover
                                        ),
                                      ),
                                    ),
                                    //Item Name
                                    title: Text(
                                      controller.productList[index].name,
                                      style: headline1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    //Item Price
                                    subtitle: Text(
                                        '₹ ${controller.productList[index]
                                            .price}/-',
                                        style: buttonTitleStyle),
                                    //Counter Button
                                    trailing: Container(
                                      height: size.width * 0.1,
                                      width: size.width * 0.2,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey.shade400),
                                        borderRadius: BorderRadius.circular(7),
                                        // color: primaryColor,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  if (cartController
                                                      .productList[index]
                                                      .quantity == 1) {

                                                  } else {
                                                    cartController
                                                        .productList[index]
                                                        .quantity--;

                                                    cartController.productList
                                                        .refresh();
                                                    cartController
                                                        .setCartValue();
                                                  }
                                                },
                                                child: const Icon(
                                                  CupertinoIcons.minus_circle,
                                                  color: Colors.black,
                                                  size: 20,)),
                                            Obx(() {
                                              return Text(
                                                cartController
                                                    .productList[index]
                                                    .quantity.toString(),
                                                style: headline,);
                                            }),
                                            InkWell(
                                                onTap: () {
                                                  cartController
                                                      .productList[index]
                                                      .quantity++;
                                                  cartController.productList
                                                      .refresh();
                                                  cartController.setCartValue();
                                                },
                                                child: const Icon(
                                                  CupertinoIcons.plus_circle,
                                                  color: Colors.black,
                                                  size: 20,))
                                          ],),
                                      ),
                                    )
                                    ,
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  }),
                ],
              ),
            ),
          ),
        ));
  }
}
