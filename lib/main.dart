import 'package:bmi_cal/bmi/view/home_screen.dart';
import 'package:bmi_cal/bmi/view/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

void main()
{
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/':(p0) => SplashScreen(),
      'home':(p0) => HomeScreen(),
    },
  ));
}