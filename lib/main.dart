import 'package:flutter/material.dart';
import 'package:flutter_show_app/shared/appColors.dart';
import 'package:flutter_show_app/views/splashView/splashView.dart';

final rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.mainGreenColor,
      ),
      home: const SplashView(),
    );
  }
}
