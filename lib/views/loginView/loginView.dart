import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_show_app/services/signInServices.dart';
import 'package:flutter_show_app/shared/appTextStyles.dart';
import 'package:flutter_show_app/shared/removeSplashColor.dart';
import 'package:flutter_show_app/shared/reusableAppButton.dart';
import 'package:flutter_show_app/shared/reusableTextFormField.dart';
import 'package:flutter_show_app/shared/reusableWidgets.dart';
import 'package:flutter_show_app/shared/textFieldValidators.dart';
import 'package:flutter_show_app/store/userStore.dart';

class LoginInView extends StatefulWidget {
  @override
  _LoginInViewState createState() => _LoginInViewState();
}

class _LoginInViewState extends State<LoginInView> {
  GlobalKey<FormFieldState> formFieldKeySignInEmail =
      GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> formFieldKeySignInPassword =
      GlobalKey<FormFieldState>();

  FocusNode focusNodeSignInEmail = FocusNode();
  FocusNode focusNodeSignInPassword = FocusNode();

  TextEditingController signInEmailController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              userStore.setUserType(UserType.guest);
            },
            child: Text(
              "Preskoči",
              style: AppTextStyles.textStyle14_400_mainGreen,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: ScrollConfiguration(
          behavior: RemovedScrollSplash(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 85,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/logo.png",
                            height: 120,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReusableWidgets.labelOfTextWithBiggerTextSize(
                            context, "Dobrodošli nazad!"),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ReusableTextFormField(
                      "Korisničko ime ili email",
                      TextInputType.emailAddress,
                      formFieldKeySignInEmail,
                      focusNodeSignInEmail,
                      TextFormFieldsValidator.nameValidator(
                          "Korisničko ime nije validno"),
                      signInEmailController,
                      TextCapitalization.none,
                      formatter: true,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    ReusableTextFormField(
                      "Lozinka",
                      TextInputType.visiblePassword,
                      formFieldKeySignInPassword,
                      //passwordValidator,
                      focusNodeSignInPassword,
                      TextFormFieldsValidator.passwordValidator(
                          "Neispravna lozinka, lozinka mora imati minimalno 8 karaktera"),
                      signInPasswordController, TextCapitalization.none,
                      isObscureText: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ReusableAppButton(
                      "Prijavi se",
                      SignInServices().manualSignIn(
                          context,
                          formFieldKeySignInEmail,
                          formFieldKeySignInPassword,
                          signInEmailController,
                          signInPasswordController),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
