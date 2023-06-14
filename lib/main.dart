import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/screens/splashScreen.dart';
import 'package:test_assignment/screens/testScreen.dart';

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
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(240, 46, 47, 47)),
        useMaterial3: true,
      ),
      //home: LogInScreenBeta(),
      //home: TestScreen(),
      home: SplashScreen(),
    );
  }
}
