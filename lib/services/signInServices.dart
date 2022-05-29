import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_show_app/interceptors/appInterceptor.dart';
import 'package:flutter_show_app/shared/reusableWidgets.dart';
import 'package:flutter_show_app/store/userStore.dart';
import 'package:flutter_show_app/views/mainView/mainView.dart';

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
        try {
          final response = await http.post(
            '/authentication/login',
            data: {
              "userName": signInEmailController.text,
              "password": signInPasswordController.text
            },
          );

          if (response.statusCode == 200) {
            userStore.setUserToken(response.data["Token"]);
            ReusableWidgets.popLoader();
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MainView()));
            signInEmailController.clear();
            signInPasswordController.clear();
          }
        } on DioError catch (e) {
          print(e);
          ReusableWidgets.popLoader();
        }
      } else {
        ReusableWidgets.popLoader();
      }
    };
  }
}
