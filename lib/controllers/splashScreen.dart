import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_assignment/controllers/apiHandler.dart';
import 'package:test_assignment/screens/homepageBeta.dart';
import 'package:test_assignment/screens/loginBeta.dart';

class SplashScreenController extends GetxController {
  SharedDataManageService sharedDataManageService = SharedDataManageService();

  RxBool isLoggedIn = RxBool(false);
  @override
  void onInit() {
    super.onInit();
    isLogin();
  }

  isLogin() async {
    // await sharedDataManageService.removeToken();
    Timer(
      const Duration(seconds: 3),
      () async {
        var token = await sharedDataManageService.getToken();
        if (token == null) {
          isLoggedIn.value = false;
          Get.offAll(() => LogInScreenBeta());
        } else {
          isLoggedIn.value = true;
          Get.offAll(() => HomePageBeta());
        }
      },
    );
  }
}
