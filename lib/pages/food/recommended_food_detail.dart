import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/controller/recommended_product_controller.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: Dimensions.height(80),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (() {
                      Get.toNamed(RouteHelper.getinitial());
                    }),
                    child: AppIcon(icon: Icons.clear),
                  ),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return GestureDetector(
                     
                        onTap: () {

                        controller.totalItems >= 1 ? Get.toNamed(RouteHelper.getCardPage()): '';
                      },
                      
                                          child: Stack(
                        children: [
                          AppIcon(icon: Icons.shopping_cart_outlined),
                          controller.totalItems >= 1
                              ? Positioned(
                                  right: 0,
                                  top: 0,
                                  child: AppIcon(
                                      icon: Icons.circle,
                                      size: 20,
                                      iconColor: Colors.transparent,
                                      backgroundColor: AppColors.mainColor,
                                    ),
                                  
                                )
                              : Container(),
                          controller.totalItems >= 1
                              ? Positioned(
                                  right: 4,
                                  top: 3,
                                  child: BigText(
                                    text: controller
                                        .totalItems
                                        .toString(),
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    );
                  }),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(Dimensions.height(20)),
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(
                      top: Dimensions.height(5), bottom: Dimensions.height(10)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.height(20)),
                        topRight: Radius.circular(Dimensions.height(20))),
                    color: Colors.white,
                  ),
                  child: Center(
                      child: BigText(
                    size: 26,
                    text: product.name!,
                  )),
                ),
              ),
              pinned: true,
              backgroundColor: AppColors.yellowColor,
              expandedHeight: Dimensions.height(300),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  '${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}/' +
                      product.img!,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.height(20),
                        right: Dimensions.height(20)),
                    child: ExpandableTextWidget(text: product.description!),
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar:
            GetBuilder<PopularProductController>(builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width(50),
                  right: Dimensions.width(50),
                  top: Dimensions.height(10),
                  bottom: Dimensions.height(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                        icon: Icons.remove,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: 24,
                      ),
                    ),
                    BigText(
                      text:
                          "\$ ${product.price!}  X  ${controller.inCartItems}",
                      color: AppColors.mainBlackColor,
                      size: Dimensions.width(26),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                        icon: Icons.add,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
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
                child: Row(
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
                        child: const Icon(
                          Icons.favorite,
                          color: AppColors.mainColor,
                        )),
                    GestureDetector(
                      onTap: (() {
                        controller.addItem(product);
                      }),
                      child: Container(
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
                        child: BigText(
                          text:
                              "\$ ${product.price * controller.inCartItems} | Add to cart",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
