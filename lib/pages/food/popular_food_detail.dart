import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/food0.png"),
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
                children: const [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_outlined),
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
                  const AppColumn(text: "Chinese Side"),
                  SizedBox(height: Dimensions.height(20),),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.height(20),),
                  const Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: "Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize Every other day i organize ",
                  
                  )))

                ],
              ),
            ),
          ),



        ],
        
      ),
      bottomNavigationBar: Container(
        height: Dimensions.height(120),
        padding: EdgeInsets.only(top: Dimensions.height(30), bottom: Dimensions.height(30), left: Dimensions.width(20), right: Dimensions.width(20)),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.height(40)),
            topRight: Radius.circular(Dimensions.height(40))
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height(20), bottom: Dimensions.height(20), left: Dimensions.width(20), right: Dimensions.width(20)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height(20)),
                color: Colors.white
              ),
              child: Row(
                children: [
                  const Icon(Icons.remove, color: AppColors.signColor,),
                  SizedBox(width: Dimensions.width(5),),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width(5),),
                  const Icon(Icons.add, color: AppColors.signColor,),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.height(20), bottom: Dimensions.height(20), left: Dimensions.width(20), right: Dimensions.width(20)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height(20),),
                color: AppColors.mainColor
              ),
              child: BigText(text: "\$10 | Add to cart", color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }
}
