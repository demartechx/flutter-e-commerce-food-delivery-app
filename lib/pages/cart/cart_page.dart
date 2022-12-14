import 'package:flutter/material.dart';
import 'package:food_delivery/base/no_data_page.dart';
import 'package:food_delivery/controller/auth_controller.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/controller/recommended_product_controller.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';
import '../../routes/route_helper.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

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
                const AppIcon(
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
                    Get.toNamed(RouteHelper.getinitial());
                  },
                  child: const AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: 24,
                  ),
                ),
                const AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: 24,
                ),
              ],
            ),
          ),
          GetBuilder<CartController>(builder: (_cartController) {
            return _cartController.getItems.length > 0
                ? Positioned(
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
                        child: GetBuilder<CartController>(
                            builder: (cartController) {
                          var _cartList = cartController.getItems;

                          return ListView.builder(
                            itemCount: _cartList.length,
                            itemBuilder: (_, index) {
                              return SizedBox(
                                height: Dimensions.height(100),
                                width: double.maxFinite,
                                // color: Colors.blue,
                                // margin: EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: (() {
                                        var popularIndex =
                                            Get.find<PopularProductController>()
                                                .PopularProductList
                                                .indexOf(
                                                    _cartList[index].product!);

                                        if (popularIndex >= 0) {
                                          Get.toNamed(
                                              RouteHelper.getPopularFood(
                                                  popularIndex, "cartpage"));
                                        } else {
                                          var recommendedIndex = Get.find<
                                                  RecommendedProductController>()
                                              .recommendedProductList
                                              .indexOf(
                                                  _cartList[index].product!);
                                          if (recommendedIndex < 0) {
                                            Get.snackbar(
                                              "History Product",
                                              "Product review is not available for history product",
                                              backgroundColor:
                                                  AppColors.mainColor,
                                              colorText: Colors.white,
                                            );
                                          } else {
                                            Get.toNamed(
                                                RouteHelper.getRecommendedFood(
                                                    recommendedIndex,
                                                    "cartpage"));
                                          }
                                        }
                                      }),
                                      child: Container(
                                        width: Dimensions.height(100),
                                        height: Dimensions.height(100),
                                        margin: EdgeInsets.only(
                                            bottom: Dimensions.height(10)),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(AppConstants
                                                        .BASE_URL +
                                                    AppConstants.UPLOAD_URL +
                                                    '/' +
                                                    _cartList[index].img!),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.height(20)),
                                            color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: Dimensions.width(10),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: Dimensions.height(100),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            BigText(
                                              text: _cartList[index].name!,
                                              color: Colors.black54,
                                            ),
                                            SmallText(text: "Spicy"),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                BigText(
                                                  text: _cartList[index]
                                                      .price
                                                      .toString(),
                                                  color: Colors.redAccent,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      top:
                                                          Dimensions.height(10),
                                                      bottom:
                                                          Dimensions.height(10),
                                                      left:
                                                          Dimensions.width(10),
                                                      right:
                                                          Dimensions.width(10)),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              Dimensions.height(
                                                                  20)),
                                                      color: Colors.white),
                                                  child: Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: (() {
                                                          cartController
                                                              .addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  -1);
                                                        }),
                                                        child: const Icon(
                                                          Icons.remove,
                                                          color: AppColors
                                                              .signColor,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            Dimensions.width(5),
                                                      ),
                                                      BigText(
                                                        text: _cartList[index]
                                                            .quantity
                                                            .toString(), //popularProduct.inCartItems
                                                        //.toString(),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            Dimensions.width(5),
                                                      ),
                                                      GestureDetector(
                                                        onTap: (() {
                                                          cartController
                                                              .addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  1);
                                                          print("being tapped");
                                                        }),
                                                        child: const Icon(
                                                          Icons.add,
                                                          color: AppColors
                                                              .signColor,
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
                  )
                : NoDataPage(text: "Your cart is empty");
          })
        ],
      ),
      bottomNavigationBar:
          GetBuilder<CartController>(builder: (cartController) {
        return Container(
            height: Dimensions.height(120),
            padding: EdgeInsets.only(
                top: Dimensions.height(30),
                bottom: Dimensions.height(30),
                left: Dimensions.width(20),
                right: Dimensions.width(20)),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.height(40)),
                    topRight: Radius.circular(Dimensions.height(40)))),
            child: cartController.getItems.length > 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.height(20),
                            bottom: Dimensions.height(20),
                            left: Dimensions.width(20),
                            right: Dimensions.width(20)),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.height(20)),
                            color: Colors.white),
                        child: Row(
                          children: [
                            SizedBox(
                              width: Dimensions.width(5),
                            ),
                            BigText(text: "\$ ${cartController.totalAmount}"),
                            SizedBox(
                              width: Dimensions.width(5),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.height(20),
                            bottom: Dimensions.height(20),
                            left: Dimensions.width(20),
                            right: Dimensions.width(20)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimensions.height(20),
                            ),
                            color: AppColors.mainColor),
                        child: GestureDetector(
                          onTap: (() {
                            if (Get.find<AuthController>().userHasLoggedIn()) {
                              cartController.addToHistory();
                            } else {
                              Get.toNamed(RouteHelper.getSignInPage());
                            }

                            //popularProduct.addItem(product);
                            // print("tapped");
                          }),
                          child: BigText(
                            text: "Check out",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                : Container());
      }),
    );
  }
}
