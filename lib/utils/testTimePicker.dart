import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:test_assignment/controllers/timePickerSpinner.dart';

class CustomSpinnerTimePickerPopUP {
  TimePickerSpinnerController timePickerSpinnerController =
      TimePickerSpinnerController();
  timePickerPopUP(context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            insetPadding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                height: height - 450,
                width: width - 40,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            NumberPicker(
                              minValue: 0,
                              maxValue: 23,
                              value: timePickerSpinnerController.hour.value,
                              zeroPad: true,
                              infiniteLoop: true,
                              itemWidth: 80,
                              itemHeight: 60,
                              onChanged: (value) {
                                timePickerSpinnerController.hour.value = value;
                              },
                              textStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 20),
                              selectedTextStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontFamily: 'Euclid Regular',
                                  fontWeight: FontWeight.bold),
                              decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                      color: Colors.grey,
                                    ),
                                    bottom: BorderSide(color: Colors.grey)),
                              ),
                            ),
                            NumberPicker(
                              minValue: 0,
                              step: 15,
                              maxValue: 59,
                              value: timePickerSpinnerController.min.value,
                              zeroPad: true,
                              infiniteLoop: true,
                              itemWidth: 80,
                              itemHeight: 60,
                              onChanged: (value) {
                                timePickerSpinnerController.min.value = value;
                              },
                              textStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 20),
                              selectedTextStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontFamily: 'Euclid Regular',
                                  fontWeight: FontWeight.bold),
                              decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                      color: Colors.grey,
                                    ),
                                    bottom: BorderSide(color: Colors.grey)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.black45,
                      height: 0.8,
                      width: width - 40,
                    ),
                    Row(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              //backgroundColor: Colors.amber,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10)))),
                          onPressed: () {},
                          child: Container(
                              height: 60,
                              width: (width - 41) / 2,
                              child: const Center(child: Text("Cancel"))),
                        ),
                        Container(
                          width: 0.8,
                          height: 60,
                          color: Colors.black45,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              //backgroundColor: Colors.amber,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10)))),
                          onPressed: () {},
                          child: Container(
                              height: 60,
                              width: (width - 41) / 2,
                              child: const Center(child: Text("Confirm"))),
                        ),
                      ],
                    )
                  ],
                )));
      },
    );
  }
}
