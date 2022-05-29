import 'package:flutter/material.dart';
import 'package:flutter_show_app/services/splashServices.dart';
import 'package:flutter_show_app/shared/sizeConfig.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    SplashServices.splashInitialization(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(SizeConfig.blockSizeHorizontal * 4),
          child: Image.asset(
            "assets/images/logo.png",
            width: SizeConfig.blockSizeHorizontal * 45,
          ),
        ),
      ),
    );
  }
}
