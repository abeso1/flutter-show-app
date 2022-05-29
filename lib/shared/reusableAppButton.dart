import 'package:flutter/material.dart';
import 'package:flutter_show_app/shared/appColors.dart';
import 'package:flutter_show_app/shared/appTextStyles.dart';

///reusable app button, with border radius of 15 and initial color of main green which can be used in whole app
class ReusableAppButton extends StatelessWidget {
  final String? text;
  final VoidCallback? function;
  final Color color;

  ReusableAppButton(this.text, this.function,
      {this.color = AppColors.mainGreenColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: double.infinity,
      //ignore: deprecated_member_use
      child: FlatButton(
        disabledColor: color.withOpacity(0.3),
        color: color,
        onPressed: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text!,
              style: function == null
                  ? AppTextStyles.newStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )
                  : AppTextStyles.newStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
      ),
    );
  }
}
