import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4),(){
      Get.offAndToNamed('home');
    });
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff0F1537),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 180),
                Hero(
                  tag: "bmi",
                  child: Image.asset(
                    "assets/images/heartbeat.png",
                    height: 100,
                    width: 100,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "BMI CALCULATOR",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      letterSpacing: 1,
                      fontSize: 25
                  ),
                ),
                SizedBox(height: 200),
                SpinKitPulsingGrid(
                  color: Colors.white70,
                  size: 65,
                )
              ],
            ),
          ),
        ));
  }
}
