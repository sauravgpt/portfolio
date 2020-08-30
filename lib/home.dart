import 'package:flutter/material.dart';
import 'package:sauravgupta/footer.dart';
import 'package:sauravgupta/header.dart';
import 'package:sauravgupta/middle.dart';
import 'package:sauravgupta/myColors.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: MyColors.primaryColor,
      child: VStack([
        HeaderScreen(),
        if(context.isMobile) IntroductionWidget().p16(),
        MiddleScreen(),
        FooterScreen(),
      ]).scrollVertical(),
    );
  }
}