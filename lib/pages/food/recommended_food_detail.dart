import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: Dimensions.height(80),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
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
                  text: "Chinese Side",
                )),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: Dimensions.height(300),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food0.png",
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
                  child: const ExpandableTextWidget(
                      text:
                          "Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize "),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
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
                const AppIcon(
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: 24,
                ),
                BigText(
                  text: "\$12.88  X  0 ",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.width(26),
                ),
                const AppIcon(
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: 24,
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
                  )
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
                  child: BigText(
                    text: "\$10 | Add to cart",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
