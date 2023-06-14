import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/controllers/splashScreen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  SplashScreenController splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset("assets/genie.png")),
    );
  }
}
