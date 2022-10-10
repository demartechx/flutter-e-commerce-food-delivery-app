import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/controller/auth_controller.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/controller/user_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/account_widget.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userHasLoggedIn();

    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
      print("user has logged in");
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: BigText(
            text: "Profile",
            size: 24,
            color: Colors.white,
          ),
        ),
        body: GetBuilder<UserController>(
          builder: (userController) {
            return _userLoggedIn
                ? (userController.isLoading
                    ? Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(top: Dimensions.height(20)),
                        child: Column(
                          children: [
                            //profile icon
                            AppIcon(
                              icon: Icons.person,
                              backgroundColor: AppColors.mainColor,
                              iconColor: Colors.white,
                              iconSize: 75,
                              size: 150,
                            ),
                            SizedBox(
                              height: Dimensions.height(30),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    //name
                                    AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.person,
                                        backgroundColor: AppColors.mainColor,
                                        iconColor: Colors.white,
                                        iconSize: 25,
                                        size: 50,
                                      ),
                                      bigText: BigText(
                                          text: userController.userModel.name),
                                    ),
                                    SizedBox(
                                      height: Dimensions.height(20),
                                    ),
                                    //phone
                                    AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.phone,
                                        backgroundColor: AppColors.yellowColor,
                                        iconColor: Colors.white,
                                        iconSize: 25,
                                        size: 50,
                                      ),
                                      bigText: BigText(
                                          text: userController.userModel.phone),
                                    ),
                                    SizedBox(
                                      height: Dimensions.height(20),
                                    ),
                                    //email
                                    AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.email,
                                        backgroundColor: AppColors.yellowColor,
                                        iconColor: Colors.white,
                                        iconSize: 25,
                                        size: 50,
                                      ),
                                      bigText: BigText(
                                          text: userController.userModel.email),
                                    ),
                                    SizedBox(
                                      height: Dimensions.height(20),
                                    ),
                                    //address
                                    AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.location_on,
                                        backgroundColor: AppColors.yellowColor,
                                        iconColor: Colors.white,
                                        iconSize: 25,
                                        size: 50,
                                      ),
                                      bigText:
                                          BigText(text: "Fill in your address"),
                                    ),
                                    SizedBox(
                                      height: Dimensions.height(20),
                                    ),
                                    //message
                                    AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.message_outlined,
                                        backgroundColor: Colors.redAccent,
                                        iconColor: Colors.white,
                                        iconSize: 25,
                                        size: 50,
                                      ),
                                      bigText: BigText(text: "Messages"),
                                    ),

                                    SizedBox(
                                      height: Dimensions.height(20),
                                    ),
                                    //message
                                    GestureDetector(
                                      onTap: (() {
                                        if (Get.find<AuthController>()
                                            .userHasLoggedIn()) {
                                          Get.find<AuthController>()
                                              .clearSharedData();
                                          Get.find<CartController>().clear();
                                          Get.find<CartController>()
                                              .clearCartHistory();
                                          Get.offNamed(
                                              RouteHelper.getSignInPage());
                                        } else {
                                          print("you logged out");
                                          Get.offNamed(
                                              RouteHelper.getSignInPage());
                                        }
                                      }),
                                      child: AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.logout,
                                          backgroundColor: Colors.redAccent,
                                          iconColor: Colors.white,
                                          iconSize: 25,
                                          size: 50,
                                        ),
                                        bigText: BigText(text: "Logout"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : CustomLoader())
                : Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: double.maxFinite,
                            height: Dimensions.height(160),
                            margin: EdgeInsets.only(
                                left: Dimensions.width(20),
                                right: Dimensions.width(20)),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.height(20)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/image/signintocontinue.png"))),
                          ),
                          GestureDetector(
                            onTap: (() {
                              Get.toNamed(RouteHelper.getSignInPage());
                            }),
                            child: Container(
                              width: double.maxFinite,
                              height: Dimensions.height(160),
                              margin: EdgeInsets.only(
                                  left: Dimensions.width(20),
                                  right: Dimensions.width(20)),
                              decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.circular(
                                    Dimensions.height(20)),
                              ),
                              child: Center(
                                  child: BigText(
                                text: "Sign in",
                                color: Colors.white,
                                size: Dimensions.height(26),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ));
  }
}
