import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test_assignment/utils/testTimePicker.dart';

class TestScreen extends StatelessWidget {
  TestScreen({Key? key}) : super(key: key);

  CustomSpinnerTimePickerPopUP timePicker = CustomSpinnerTimePickerPopUP();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: TextButton(
        onPressed: () {
          timePicker.timePickerPopUP(context, "asda");
        },
        child: Text("Test"),
      ),
    ));
  }
}
