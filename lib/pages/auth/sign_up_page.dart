import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/show_custom_snackbar.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = ["t.png", "f.png", "g.png"];

    void _registration() {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar("Type in your name",  title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type in your phone number",  title: "Phone number");
      } else if (email.isEmpty) {
        showCustomSnackBar("Type in your email address",  title: "Email address");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in a valid email address",  title: "Valid Email Address");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password",  title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password can not be less than six characters",  title: "Password");
      } else {
        showCustomSnackBar("All went well",  title: "Perfect");

      }
    }

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
                height: Dimensions.height(20),
              ),
              AppTextField(
                textController: nameController,
                hintText: "Name",
                icon: Icons.person,
              ),
              SizedBox(
                height: Dimensions.height(20),
              ),
              AppTextField(
                textController: phoneController,
                hintText: "Phone",
                icon: Icons.phone,
              ),
              SizedBox(
                height: Dimensions.height(20),
              ),
              GestureDetector(
                onTap: (() {
                  _registration();
                }),
                child: Container(
                  width: Dimensions.screenWidth / 2,
                  height: Dimensions.screenHeight / 13,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimensions.height(30),
                      ),
                      color: AppColors.mainColor),
                  child: Center(
                      child: BigText(
                    text: "Sign Up",
                    size: Dimensions.height(30),
                    color: Colors.white,
                  )),
                ),
              ),
              SizedBox(
                height: Dimensions.height(10),
              ),
              RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.back(),
                    text: "Have an account already?",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimensions.height(20))),
              ),
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              RichText(
                text: TextSpan(
                    text: "Sign up using one of the following methods",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimensions.height(16))),
              ),
              Wrap(
                children: List.generate(
                    3,
                    (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: Dimensions.height(30),
                            backgroundImage: AssetImage(
                                "assets/image/" + signUpImages[index]),
                          ),
                        )),
              )
            ],
          ),
        ));
  }
}
