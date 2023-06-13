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
    Timer(Duration(seconds: 3), () async {
      var token = await sharedDataManageService.getToken();
      print(token);
      if (token == null) {
        isLoggedIn.value = false;
        Get.offAll(() => LogInScreenBeta());
        print("token is Null");
      } else {
        //print(sharedPreferences.getString('token'));
        isLoggedIn.value = true;
        print("Already Logged In");
        //  Fluttertoast.showToast(msg: "Already Logged In");
        Get.offAll(() => HomePageBeta());
      }
    });
  }
}
