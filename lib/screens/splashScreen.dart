import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:get/get.dart';
import 'package:test_assignment/controllers/splashScreen.dart';
import 'package:test_assignment/screens/homepageBeta.dart';

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
