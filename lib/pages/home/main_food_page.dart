import 'package:flutter/material.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/controller/recommended_product_controller.dart';
import 'package:food_delivery/pages/home/food_page_body.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _loadResources,
              child: Column(
          children: [
            //showing the header
            Container(
                margin: EdgeInsets.only(
                    top: Dimensions.height(45), bottom: Dimensions.height(15)),
                padding: EdgeInsets.only(
                    left: Dimensions.width(20), right: Dimensions.width(20)),
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
                              borderRadius:
                                  BorderRadius.circular(Dimensions.height(15)),
                              color: AppColors.mainColor),
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                    )
                  ],
                )),
            //showing the body
            const Expanded(
              child: SingleChildScrollView(
                child: FoodPageBody(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
