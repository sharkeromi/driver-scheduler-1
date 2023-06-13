import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_assignment/screens/homepageBeta.dart';
import 'package:test_assignment/controllers/apiHandler.dart';

class LoginHandler extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool passwordVisible = true.obs;
  final RxBool isLoading = RxBool(false);

  Future<void> login() async {
    isLoading.value = true;
    var credentials = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    var res = await api().postData(credentials, '/auth/login');
    var body = json.decode(res.body);
    print(res.body);
    if (body['code'] == 200) {
      print(body);
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('token', body['data']['token']);
      Get.offAll(() => HomePageBeta());
    } else {
      print(body['code']);
    }
    isLoading.value = false;
    update();
  }

  iconChange() {
    passwordVisible.value = !passwordVisible.value;
    update();
  }
}
