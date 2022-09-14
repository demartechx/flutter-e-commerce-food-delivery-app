import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  const PopularFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().PopularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(Get.find<CartController>());

    //print("page id is" + pageId.toString());
    //print("product name is" + product.name.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.height(350),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        '${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}/' +
                            product.img!),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          //top icons widget
          Positioned(
              top: Dimensions.height(45),
              left: Dimensions.width(20),
              right: Dimensions.width(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getinitial());
                    },
                    child: const AppIcon(
                      icon: Icons.arrow_back_ios,
                    ),
                  ),
                  const AppIcon(icon: Icons.shopping_cart_outlined),
                ],
              )),

          //introduction of food & expandable text widget
          Positioned(
            top: Dimensions.height(320),
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width(20),
                  right: Dimensions.width(20),
                  top: Dimensions.height(20)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.height(20)),
                    topLeft: Radius.circular(Dimensions.height(20)),
                  ),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: product.name!),
                  SizedBox(
                    height: Dimensions.height(20),
                  ),
                  BigText(text: "Introduce"),
                  SizedBox(
                    height: Dimensions.height(20),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableTextWidget(
                    text: product.description!,
                  )))
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (popularProduct) {
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
                    borderRadius: BorderRadius.circular(Dimensions.height(20)),
                    color: Colors.white),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (() {
                        popularProduct.setQuantity(false);
                      }),
                      child: const Icon(
                        Icons.remove,
                        color: AppColors.signColor,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width(5),
                    ),
                    BigText(text: popularProduct.quantity.toString()),
                    SizedBox(
                      width: Dimensions.width(5),
                    ),
                    GestureDetector(
                      onTap: (() {
                        popularProduct.setQuantity(true);
                      }),
                      child: const Icon(
                        Icons.add,
                        color: AppColors.signColor,
                      ),
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
                    popularProduct.addItem(product);
                  }),
                  child: BigText(
                    text: "\$${product.price!} | Add to cart",
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
