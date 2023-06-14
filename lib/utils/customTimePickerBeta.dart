import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/controllers/dateTimeHandler.dart';
import 'package:test_assignment/utils/testTimePicker.dart';

class CustomTimePickerBeta extends StatelessWidget {
  CustomTimePickerBeta(
      {Key? key,
      required this.boxTextString,
      required this.iconData,
      required this.timePicker})
      : super(key: key);
  var boxTextString;
  RxString timePicker;
  var iconData;

  DateTimeHandler timeController = Get.put(DateTimeHandler());
  CustomSpinnerTimePickerPopUP timePickerPopUp =
      Get.put(CustomSpinnerTimePickerPopUP());

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7))))),
      onPressed: () async {
      timePickerPopUp.timePickerPopUP(context, boxTextString);
      },
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            labelText(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                boxText(),
                iconData,
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            const Divider(
              thickness: 2,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  labelText() {
    if (timePicker.value == "") {
      return const SizedBox(height: 14);
    } else {
      return SizedBox(
        height: 14,
        child: Text(
          boxTextString,
          style: const TextStyle(
            fontSize: 10,
            fontFamily: 'Euclid',
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }
  }

  boxText() {
    if (timePicker.value == "") {
      return Text(boxTextString,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Euclid Regular',
            color: Colors.black,
          ));
    } else {
      return Text(
        timePicker.value,
        style: const TextStyle(
          fontSize: 14,
          fontFamily: 'Euclid Regular',
          color: Colors.black,
        ),
      );
    }
  }
}
