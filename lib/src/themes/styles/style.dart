import 'package:flutter/material.dart';

class AppColor {
  static const Color textColor = Color(0xFFFFFFFF);
  static const Color mainTextColor = Color(0xFF121917);
  static const Color subTextColor = Color(0xff959595);
  static const Color fontColor = Color(0xFF607173);
  static const Color iconColor = Color(0xFFB2B2B2);
  static const Color backgroundAppbarColor = Color(0xFFEE2C2C);
//  static const Color activeColor = Colors.black;
  static const Color borderColor = Color(0xFFEFEFEF);
  static const Color bgnen = Color(0xFFF8F8F8);
  static const Color buttonColor = Color(0xFFEE2C2C);

  static const Color secondColor = Color(0xffD13131);
  static const Color primaryColor = Color(0xFFD13131);
}

class AppText {
  static const middleSize = 16.0;

  static const middleText = TextStyle(
    color: AppColor.mainTextColor,
    fontSize: middleSize,
  );

  static const middleSubText = TextStyle(
    color: AppColor.subTextColor,
    fontSize: middleSize,
  );
}

class Gradients {
  static const Gradient defaultGradientBackground = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomLeft,
      colors: [
        AppColor.secondColor,
        AppColor.primaryColor,
      ],
  );
}

