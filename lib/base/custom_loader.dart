import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';

class CustomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("I am printing the loading state");
    return Center(
      child: Container(
        height: Dimensions.height(100),
        width: Dimensions.height(100),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.height(50)),
            color: AppColors.mainColor),
        alignment: Alignment.center,
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
