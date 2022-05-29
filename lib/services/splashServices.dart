import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_show_app/views/loginView/loginView.dart';

class SplashServices {
  static splashInitialization(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginInView()));
    });
  }
}
