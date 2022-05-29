import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_show_app/interceptors/appInterceptor.dart';
import 'package:flutter_show_app/shared/reusableWidgets.dart';
import 'package:flutter_show_app/store/userStore.dart';

class SignInServices {
  VoidCallback? manualSignIn(
      BuildContext context,
      GlobalKey<FormFieldState> formFieldKeySignInEmail,
      GlobalKey<FormFieldState> formFieldKeySignInPassword,
      TextEditingController signInEmailController,
      TextEditingController signInPasswordController) {
    return () async {
      FocusScope.of(context).unfocus();
      ReusableWidgets.showLoader(context);
      formFieldKeySignInEmail.currentState!.validate();
      formFieldKeySignInPassword.currentState!.validate();
      if (formFieldKeySignInEmail.currentState!.validate() &&
          formFieldKeySignInPassword.currentState!.validate()) {
        final response = await http.post(
          '/authentication/login',
          data: {
            "userName": signInEmailController.text,
            "password": signInPasswordController.text
          },
        );

        print(response.data);
        print(response.statusCode);

        if (response.statusCode == 200) {
          userStore.setUserToken(response.data["Token"]);
          ReusableWidgets.popLoader();
          signInEmailController.clear();
          signInPasswordController.clear();
        }
      } else {
        ReusableWidgets.popLoader();
      }
    };
  }
}
