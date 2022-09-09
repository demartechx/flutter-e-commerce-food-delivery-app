import 'package:flutter/material.dart';
import 'package:food_delivery/home/food_page_body.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
            child: Container(
                margin:  EdgeInsets.only(top: Dimensions.height(45), bottom: Dimensions.height(15)),
                padding:  EdgeInsets.only(left: Dimensions.width(20), right: Dimensions.width(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: "Bangladesh",
                          color: AppColors.mainColor,
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: "Narsingdi",
                              color: Colors.black54,
                            ),
                            const Icon(
                              Icons.arrow_drop_down_rounded,
                            )
                          ],
                        )
                      ],
                    ),
                    // Expanded(child: Container()),
                    Center(
                      child: Container(
                          width: Dimensions.width(45),
                          height: Dimensions.height(45),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.height(15)),
                              color: AppColors.mainColor),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                    )
                  ],
                )),
          ),
          //showing the body
          const FoodPageBody(), 
        ],
        
      ),
    );
  }
}
