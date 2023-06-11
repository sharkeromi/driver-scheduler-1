import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_assignment/screens/homepage.dart';
import 'package:test_assignment/utils/apiHandler.dart';

class LoginHandler extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool passwordVisible = true.obs;
  RxBool isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;
    var credentials = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    var res = await api().postData(credentials, '/auth/login');
    var body = json.decode(res.body);
    if (res.statusCode == 200) {
      print(body['data']['token']);
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('token', body['data']['token']);
      Get.to(() => HomePage());
    } else {
      //errorSnackBar(context, body['message']);
    }
    update();
  }

  iconChange() {
    passwordVisible.value = !passwordVisible.value;
    update();
  }
}
