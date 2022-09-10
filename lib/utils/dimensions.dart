import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;


  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;

  static height(double value){
    return screenHeight / (926 / value);
  }

  static width(double value){
    return screenWidth / (428 / value);
  }

  // static getHeight(double pixels) {
  //   double x = getScreenHeight() / pixels;
  //   return getScreenHeight()/x;
  // }
}
