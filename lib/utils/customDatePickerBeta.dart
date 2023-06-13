import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/controllers/dateTimeHandler.dart';

class CustomDatePickerBeta extends StatelessWidget {
  CustomDatePickerBeta(
      {Key? key,
      required this.boxTextString,
      required this.iconData,
      required this.datePicker})
      : super(key: key);

  var boxTextString;
  RxString datePicker;
  var iconData;

  DateTimeHandler dateController = Get.put(DateTimeHandler());
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7))))),
      onPressed: () async {
        boxTextString == "Start Date"
            ? dateController.starDateChecker(context)
            : dateController.endDateChecker(context);
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
    if (datePicker.value == "") {
      return const SizedBox(height: 14);
    } else {
      return SizedBox(
        height: 14,
        child: Text(boxTextString,
            style: const TextStyle(
                fontSize: 10,
                fontFamily: 'Euclid',
                color: Colors.grey,
                fontWeight: FontWeight.w500)),
      );
    }
  }

  boxText() {
    if (datePicker.value == "") {
      return Text(boxTextString,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Euclid Regular',
            color: Colors.black,
          ));
    } else {
      return Text(datePicker.value,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Euclid Regular',
            color: Colors.black,
          ));
    }
  }
}
