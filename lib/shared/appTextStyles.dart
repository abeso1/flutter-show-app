import 'package:flutter/material.dart';
import 'package:flutter_show_app/shared/appColors.dart';

///Class for textStyles used in app
class AppTextStyles {
  ///styles in format of textStyle[fontSize]_[fontWeight]
  static const textStyle24_700 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 24,
  );

  static const textStyle14_700 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );

  static const textStyle14_400_mainGreen = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: AppColors.mainGreenColor,
  );

  ///add new style with defined parameters
  static TextStyle newStyle(
      {double fontSize = 14,
      FontWeight fontWeight = FontWeight.w400,
      Color color = Colors.black,
      TextDecoration textDecoration = TextDecoration.none}) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        decoration: textDecoration);
  }
}
