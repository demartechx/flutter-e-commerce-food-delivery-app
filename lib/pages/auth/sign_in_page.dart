import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/auth/sign_up_page.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              Container(
                height: Dimensions.screenHeight * 0.25,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80,
                    backgroundImage: AssetImage("assets/image/logo part 1.png"),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: Dimensions.width(20)),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello",
                      style: TextStyle(
                          fontSize: Dimensions.height(70),
                          fontWeight: FontWeight.bold),
                    ),
                     Text(
                      "Sign into your account",
                      style: TextStyle(
                          fontSize: Dimensions.height(20),
                          color: Colors.grey[500]
                          // fontWeight: FontWeight.bold
                          ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height(20),
              ),
              AppTextField(
                textController: emailController,
                hintText: "Email",
                icon: Icons.email,
              ),
              SizedBox(
                height: Dimensions.height(20),
              ),
              AppTextField(
                textController: passwordController,
                hintText: "Password",
                icon: Icons.password_sharp,
              ),
              SizedBox(
                height: Dimensions.height(10),
              ),
              Row(
                children: [
                  Expanded(child: Container()),
                  RichText(
                    text: TextSpan(
                        text: "Sign into your account",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.height(20))),
                  ),
                  SizedBox(width: Dimensions.width(20),)
                ],
              ),
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              Container(
                width: Dimensions.screenWidth / 2,
                height: Dimensions.screenHeight / 13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Dimensions.height(30),
                    ),
                    color: AppColors.mainColor),
                child: Center(
                    child: BigText(
                  text: "Sign In",
                  size: Dimensions.height(30),
                  color: Colors.white,
                )),
              ),
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              RichText(
                text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimensions.height(20)),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage(), transition: Transition.fade),
                        text: "Create",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                            color: AppColors.mainBlackColor,
                            fontSize: Dimensions.height(20),
                            ),
                      )
                    ]),
              ),
            ],
          ),
        ));
  }
}
