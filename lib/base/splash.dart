import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mypens/constants/my_pens_nav_routes.dart';
import '../features/auth/screens/login.dart';
import '../../../constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('assets/images/top.png'), context);
    precacheImage(const AssetImage('assets/images/logo.png'), context);
    precacheImage(const AssetImage('assets/images/bot.png'), context);
    precacheImage(const AssetImage('assets/images/sun.png'), context);
    precacheImage(const AssetImage('assets/images/moon.png'), context);

    Timer(const Duration(milliseconds: 2700), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
        MyPensNavRoutes.login,
        (route) => false
      );
    });

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: bluePens,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));

    return SafeArea(
        child: Scaffold(
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/top.png'),
              SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/images/logo.png')),
              Image.asset('assets/images/bot.png'),
            ],
          )),
    ));
  }
}
