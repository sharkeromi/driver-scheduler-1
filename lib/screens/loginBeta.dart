import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/controllers/loginHandlerBeta.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LogInScreenBeta extends StatelessWidget {
  LogInScreenBeta({Key? key}) : super(key: key);
  LoginHandler _loginHandler = Get.put(LoginHandler());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
              child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              TextFormField(
                controller: _loginHandler.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => TextFormField(
                  controller: _loginHandler.passwordController,
                  obscureText: _loginHandler.passwordVisible.value,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Password",
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {
                            _loginHandler.passwordVisible.value =
                                !_loginHandler.passwordVisible.value;
                          },
                          icon: Icon(
                            _loginHandler.passwordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ))),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () async {
                  await _loginHandler.login();
                },
                child: Obx(() => Container(
                      height: height * 0.07,
                      width: width * 0.65,
                      decoration: BoxDecoration(
                        color: const Color(0xffF89818),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _loginHandler.isLoading.value
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text("Logging In...",
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                            fontFamily: 'Euclid')),
                                    SizedBox(width: 5),
                                    SpinKitPouringHourGlass(
                                        size: 25, color: Colors.white),
                                  ],
                                )
                              : const Text("Log In",
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontFamily: 'Euclid')),
                        ],
                      ),
                    )),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
