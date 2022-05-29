import 'package:flutter/material.dart';
import 'package:flutter_show_app/shared/appColors.dart';
import 'package:flutter_show_app/shared/appTextStyles.dart';

///this is a terms and policy text with blueish color in sign up screen
class TextWithLink extends StatelessWidget {
  final String text;
  final String link;
  final dynamic function;

  TextWithLink(this.text, this.link, this.function);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
        child: Row(
          children: [
            Text(
              text,
              style: AppTextStyles.newStyle(fontSize: 14),
            ),
            Text(
              link,
              style: AppTextStyles.newStyle(
                  fontSize: 14, color: AppColors.mainBlueColor),
            ),
          ],
        ),
      ),
    );
  }
}
