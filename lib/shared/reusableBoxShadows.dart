import 'package:flutter/material.dart';

///Class for box shadows used in decorations accross app
class ReusableBoxShadows {
  static BoxShadow defaultContainerShadow() {
    return BoxShadow(
      color: Colors.black12,
      blurRadius: 20.0,
      offset: Offset(0, 5),
    );
  }

  static BoxShadow defaultContainerShadow2() {
    return BoxShadow(
      color: Colors.black38,
      blurRadius: 20.0,
      offset: Offset(0, 5),
    );
  }
}
