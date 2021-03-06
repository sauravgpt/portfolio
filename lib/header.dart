import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:sauravgupta/myColors.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nameWidget = "Saurav\nGupta."
        .text
        .white
        .xl6
        .lineHeight(1)
        .size(context.isMobile ? 15 : 20)
        .bold
        .make()
        .shimmer();
    return SafeArea(
      child: VxBox(
              child: VStack([
        ZStack(
          [
            // PictureWidget(),
            Row(
              children: [
                VStack([
                  if (context.isMobile) 50.heightBox else 10.heightBox,
                  CustomAppBar()
                      .shimmer(primaryColor: MyColors.accentColor),
                  30.heightBox,
                  nameWidget,
                  20.heightBox,
                  VxBox()
                      .color(MyColors.accentColor)
                      .size(60, 10)
                      .make()
                      .px4()
                      .shimmer(primaryColor: MyColors.accentColor),
                  30.heightBox,
                  SocialAccounts(),
                ]).pSymmetric(
                  h: context.percentWidth * 10,
                  v: 32,
                ),
                Expanded(
                  child: VxResponsive(
                    medium: IntroductionWidget()
                        .pOnly(left: 120)
                        .h(context.percentHeight * 60),
                    large: IntroductionWidget()
                        .pOnly(left: 120)
                        .h(context.percentHeight * 60),
                    fallback: const Offstage(),
                  ),
                )
              ],
            ).w(context.screenWidth)
          ],
        )
      ]))
          .size(context.screenWidth, context.percentHeight * 60)
          .color(MyColors.secondaryColor)
          .make(),
    );
  }
}

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        [
          " - Introduction".text.gray500.widest.sm.make(),
          10.heightBox,
          "@Flutter Enthusiast.\nProblem Solver.\nStudent at NIT, Trichy"
              .text
              .white
              .xl3
              .maxLines(5)
              .make()
              .w(context.isMobile
                  ? context.screenWidth
                  : context.percentWidth * 40),
          20.heightBox,
        ].vStack(),
      ],
      alignment: MainAxisAlignment.spaceEvenly,
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      AntDesign.codesquare,
      size: 50,
      color: MyColors.accentColor,
    );
  }
}

// class PictureWidget extends StatelessWidget {
//   const PictureWidget({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Transform(
//       alignment: Alignment.center,
//       origin: Offset(context.percentWidth * 2, 0),
//       transform: Matrix4.rotationY(pi),
//       child: Image.asset(
//         "assets/pic.png",
//         fit: BoxFit.cover,
//         height: context.percentHeight * 60,
//       ),
//     );
//   }
// }

class SocialAccounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return [
      Icon(
        AntDesign.twitter,
        color: Colors.white,
      ).mdClick(() {
        launch("https://twitter.com/sauravgpt");
      }).make(),
      20.widthBox,
      Icon(
        AntDesign.instagram,
        color: Colors.white,
      ).mdClick(() {
        launch("https://instagram.com/sauravgpt");
      }).make(),
      20.widthBox,
      Icon(
        AntDesign.linkedin_square,
        color: Colors.white,
      ).mdClick(() {
        launch("https://linkedin.com/in/sauravgpt");
      }).make(),
      20.widthBox,
      Icon(
        AntDesign.github,
        color: Colors.white,
      ).mdClick(() {
        launch("https://github.com/sauravgpt");
      }).make()
    ].hStack();
  }
}
