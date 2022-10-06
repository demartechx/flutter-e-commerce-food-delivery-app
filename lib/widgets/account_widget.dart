import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;
  AccountWidget({super.key, required this.appIcon, required this.bigText});

  @override
  Widget build(BuildContext context) {
    return Container(
     
      padding: EdgeInsets.only(
          left: Dimensions.width(20),
          top: Dimensions.width(10),
          bottom: Dimensions.width(10)),
        child: Row(
          children: [
            appIcon,
            SizedBox(width: Dimensions.width(20),),
            bigText
          ],
        ),
        decoration: BoxDecoration(
           color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              offset: Offset(0, 2),
              color: Colors.grey.withOpacity(0.2)
            )
          ]
        ),
    );
  }
}
