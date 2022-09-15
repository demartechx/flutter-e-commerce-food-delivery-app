import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: Dimensions.height(60),
          left: Dimensions.width(20),
          right: Dimensions.width(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(
                icon: Icons.arrow_back_ios,
                iconColor: Colors.white,
                backgroundColor: AppColors.mainColor,
                iconSize: 24,
              ),
              SizedBox(
                width: Dimensions.width(100),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => MainFoodPage());
                },
                child: AppIcon(
                  icon: Icons.home_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: 24,
                ),
              ),
              AppIcon(
                icon: Icons.shopping_cart,
                iconColor: Colors.white,
                backgroundColor: AppColors.mainColor,
                iconSize: 24,
              ),
            ],
          ),
        ),
        Positioned(
          top: Dimensions.height(100),
          left: Dimensions.width(20),
          right: Dimensions.width(20),
          bottom: 0,
          child: Container(
            margin: EdgeInsets.only(top: Dimensions.height(15)),
            // color: Colors.red,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: GetBuilder<CartController>(builder: (cartController) {
                return ListView.builder(
                  itemCount: cartController.getItems.length,
                  itemBuilder: (_, index) {
                    return Container(
                      height: Dimensions.height(100),
                      width: double.maxFinite,
                      // color: Colors.blue,
                      // margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            width: Dimensions.height(100),
                            height: Dimensions.height(100),
                            margin:
                                EdgeInsets.only(bottom: Dimensions.height(10)),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(AppConstants.BASE_URL +
                                        AppConstants.UPLOAD_URL +
                                        '/' +
                                        cartController.getItems[index].img!),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(
                                    Dimensions.height(20)),
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: Dimensions.width(10),
                          ),
                          Expanded(
                            child: Container(
                              height: Dimensions.height(100),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  BigText(
                                    text: cartController.getItems[index].name!,
                                    color: Colors.black54,
                                  ),
                                  SmallText(text: "Spicy"),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(
                                        text: cartController
                                            .getItems[index].price
                                            .toString(),
                                        color: Colors.redAccent,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: Dimensions.height(10),
                                            bottom: Dimensions.height(10),
                                            left: Dimensions.width(10),
                                            right: Dimensions.width(10)),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.height(20)),
                                            color: Colors.white),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: (() {
                                                // popularProduct.setQuantity(false);
                                              }),
                                              child: const Icon(
                                                Icons.remove,
                                                color: AppColors.signColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: Dimensions.width(5),
                                            ),
                                            BigText(
                                              text:
                                                  "0", //popularProduct.inCartItems
                                              //.toString(),
                                            ),
                                            SizedBox(
                                              width: Dimensions.width(5),
                                            ),
                                            GestureDetector(
                                              onTap: (() {
                                                //popularProduct.setQuantity(true);
                                              }),
                                              child: const Icon(
                                                Icons.add,
                                                color: AppColors.signColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ),
      ],
    ));
  }
}
