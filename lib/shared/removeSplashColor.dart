import 'package:flutter/material.dart';

///Removing scroll splash that can be seen on scrollable widgets
///Used in behaviour property of ScrollConfiguration widget wrapping scrollable widget
class RemovedScrollSplash extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
