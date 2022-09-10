import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.height(220);

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

//stop working when the page is no longer active
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        Container(
          //color: Colors.redAccent,
          height: Dimensions.height(320),
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),

        //dot
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: Size.square(Dimensions.height(9)),
            activeSize: Size(Dimensions.width(18), Dimensions.height(9)),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.height(5))),
          ),
        ),

        //popular text
        SizedBox(
          height: Dimensions.height(30),
        ),
        Container(
          margin: EdgeInsets.only(
            left: Dimensions.width(30),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(
                width: Dimensions.width(10),
              ),
              Container(
                margin: EdgeInsets.only(bottom: Dimensions.height(3)),
                child: BigText(
                  text: ".",
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                width: Dimensions.width(10),
              ),
              Container(
                margin: EdgeInsets.only(bottom: Dimensions.height(2)),
                child: SmallText(
                  text: "Food pairing",
                ),
              ),
            ],
          ),
        ),

        //list of foods and images
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                left: Dimensions.width(20),
                right: Dimensions.width(20),
                bottom: Dimensions.height(10),
              ),
              child: Row(
                children: [
                  //image section
                  Container(
                    height: Dimensions.height(120),
                    width: Dimensions.height(120),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.height(20)),
                      color: Colors.white38,
                      image: const DecorationImage(
                        image: AssetImage("assets/image/food0.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  //text container
                  Expanded(
                    child: Container(
                      height: Dimensions.height(110),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(
                            Dimensions.height(20),
                          ),
                          bottomRight: Radius.circular(
                            Dimensions.height(20),
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.width(10),
                            right: Dimensions.width(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(
                              text: "Nutritious fruit meal in China",
                            ),
                            SizedBox(
                              height: Dimensions.height(10),
                            ),
                            SmallText(text: "With chinese characteristics"),
                            SizedBox(
                              height: Dimensions.height(10),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                IconAndTextWidget(
                                    icon: Icons.circle_sharp,
                                    text: "Normal",
                                    iconColor: AppColors.iconColor1),
                                IconAndTextWidget(
                                    icon: Icons.location_on,
                                    text: "1.7km",
                                    iconColor: AppColors.mainColor),
                                IconAndTextWidget(
                                    icon: Icons.access_time_filled_rounded,
                                    text: "32min",
                                    iconColor: AppColors.iconColor2),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);

      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = _scaleFactor;
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.height(220),
            margin: EdgeInsets.only(
                left: Dimensions.width(10), right: Dimensions.width(10)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.height(30)),
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9294cc),
              image: const DecorationImage(
                  image: AssetImage(
                    "assets/image/food0.png",
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.height(120),
              margin: EdgeInsets.only(
                  left: Dimensions.width(30),
                  right: Dimensions.width(30),
                  bottom: Dimensions.height(30)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.height(20)),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    )
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height(10),
                    left: Dimensions.width(15),
                    right: Dimensions.width(15)),
                child:  const AppColumn(text: "Chinese Side"),
                 ),
            ),
          ),
        ],
      ),
    );
  }
}