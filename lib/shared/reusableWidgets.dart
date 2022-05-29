import 'package:flutter/material.dart';
import 'package:flutter_show_app/shared/appColors.dart';
import 'package:flutter_show_app/shared/appTextStyles.dart';

///Class for reusable widgets accross app like sized box, texts, textStyles ...
///call ReusableWidgets.function();
class ReusableWidgets {
  static BuildContext? _jsLoaderContext;

  ///shared app bar with sj logo and custom actionButton on right side
  static PreferredSizeWidget appBarWithCustomAction(
      bool hasLogo, BuildContext context, List<Widget> customActions) {
    return PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: AppBar(
          //ignore: deprecated_member_use
          //brightness: Brightness.light,
          backgroundColor: Colors.white,
          leadingWidth: 150,
          elevation: 0,
          leading: hasLogo
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      //in layout there is 20 pixel margin to left
                      padding: EdgeInsets.only(top: 10, left: 20, right: 10),
                      //logo
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          "assets/images/logo.png",
                          height: 39,
                          width: 39,
                          // color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
              : null,
          title: Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              "Rezervacija",
              style: AppTextStyles.newStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //Custom action widget from parameter
          actions: customActions
              .map((action) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      action,
                      SizedBox(width: 15),
                    ],
                  ))
              .toList()),
    );
  }

  static Widget labelOfTextWithBiggerTextSize(
      BuildContext context, String text) {
    return Text(
      text,
      style: AppTextStyles.newStyle(fontSize: 22, fontWeight: FontWeight.w600),
    );
  }

  ///Function to show loader, displaying as widget in center of dialog that is taking 100% of width and height
  ///loader can't be dismissed on tap (only back button for now)
  static Future<dynamic> showLoader(
    BuildContext context,
  ) async {
    _jsLoaderContext = context;
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white.withOpacity(0.2),
            child: Container(
                height: 45,
                width: 45,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  color: AppColors.mainGreenColor,
                )),
          );
        });
  }

  ///Function to pop sj loader
  static void popLoader() {
    if (_jsLoaderContext == null || !Navigator.of(_jsLoaderContext!).canPop())
      return;
    Navigator.of(_jsLoaderContext!).pop();
    _jsLoaderContext = null;
  }

  static Widget showLoaderWithoutDialog(BuildContext context) {
    return Container(
        child: Container(
            height: 45,
            width: 45,
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              strokeWidth: 5,
              color: AppColors.mainGreenColor,
            )));
  }
}
