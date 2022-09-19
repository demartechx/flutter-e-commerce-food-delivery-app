import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class CartHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();

    Map<String, int> cartItemsPerOrder = Map();

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<int> itemsPerOrder = cartOrderTimeToList();

    var listCounter = 0;

    // for(int x=0; x< cartItemsPerOrder.length; x++){
    //   for(int y=0; y<OrderItems[x]; y++){

    //   }
    // }

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: Dimensions.height(100),
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(
                  text: "Cart History",
                  color: Colors.white,
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: AppColors.mainColor,
                  backgroundColor: AppColors.yellowColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              // height: Dimensions.height(500),
              margin: EdgeInsets.only(
                  top: Dimensions.height(20),
                  left: Dimensions.width(20),
                  right: Dimensions.width(20)),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView(
                  children: [
                    for (int i = 0; i < itemsPerOrder.length; i++)
                      Container(
                        margin: EdgeInsets.only(bottom: Dimensions.height(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: "05/02/2021"),
                            SizedBox(
                              height: Dimensions.height(10),
                            ),
                            Row(
                              children: [
                                Wrap(
                                  direction: Axis.horizontal,
                                  children: List.generate(
                                    itemsPerOrder[i],
                                    (index) {
                                      if (listCounter <
                                          getCartHistoryList.length) {
                                        listCounter++;
                                      }
                                      return index<2 ? Container(
                                        height: Dimensions.height(80),
                                        width: Dimensions.height(80),
                                        margin: EdgeInsets.only(right: Dimensions.width(5)),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.height(8)),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              '${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}/${getCartHistoryList[listCounter - 1].img}',
                                            ),
                                          ),
                                        ),
                                      ) : Container();
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
