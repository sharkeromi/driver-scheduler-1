import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/screens/homepage.dart';
import 'package:test_assignment/screens/login.dart';
import 'package:test_assignment/screens/loginBeta.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(240, 46, 47, 47)),
        useMaterial3: true,
      ),
      //home: const LogInScreen(),
      //home: const HomePage()
      home:  LogInScreenBeta(),
    );
  }
}
