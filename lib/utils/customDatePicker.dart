import 'dart:async';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/consts/globalVariables.dart';

class CustomDatePicker extends StatefulWidget {
  CustomDatePicker(
      {Key? key,
      required this.boxTextString,
      required this.dateortimepicker,
      required this.dateortime,
      required this.isInitialDateTime,
      required this.iconData})
      : super(key: key);

  var boxTextString;
  RxString dateortimepicker;
  var dateortime;
  bool isInitialDateTime;
  var iconData;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime selectedDate = DateTime.now();

  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7))))),
      onPressed: () async {
        if (widget.dateortime == "date" && widget.isInitialDateTime) {
          DateTime? pickStartDate = await showDatePicker(
              context: context,
              initialDate: globalvariables.selectedStartDate.value,
              firstDate:
                  globalvariables.firstDateforEndDate.value ?? DateTime(2000),
              lastDate: DateTime(2101));
          if (pickStartDate != null) {
            globalvariables.selectedStartDate.value = pickStartDate;
            widget.dateortimepicker = RxString(
                formatDate(pickStartDate, [dd, ".", " ", MM, " ", yyyy]));
            globalvariables.addData(widget.dateortimepicker);
            if (pickStartDate.isAfter(globalvariables.selectedEndDate.value)) {
              globalvariables.endDate.value = '';
            }
          }
        } else if (widget.dateortime == "date" && !widget.isInitialDateTime) {
          print('here');
          DateTime? pickStartDate = await showDatePicker(
              context: context,
              initialDate: globalvariables.selectedEndDate.value
                      .isAfter(globalvariables.selectedStartDate.value)
                  ? globalvariables.selectedEndDate.value
                  : globalvariables.selectedStartDate.value,
              firstDate: globalvariables.selectedStartDate.value,
              lastDate: DateTime(2101));
          if (pickStartDate != null) {
            if (pickStartDate
                .isAfter(globalvariables.selectedStartDate.value)) {
              globalvariables.selectedEndDate.value = pickStartDate;
              widget.dateortimepicker = RxString(
                  formatDate(pickStartDate, [dd, ".", " ", MM, " ", yyyy]));
              globalvariables.endDate.value = widget.dateortimepicker.value;
              globalvariables.addData(widget.dateortimepicker);
            }
          }
        } else if (widget.dateortime == "time") {
          TimeOfDay? pickTime = await showTimePicker(
              context: context,
              initialTime: globalvariables.selectedStartDate.value
                      .isAtSameMomentAs(DateTime.now())
                  ? TimeOfDay.now()
                  : globalvariables.selectedStartTime.value ??
                      selectedTime ??
                      TimeOfDay(hour: 12, minute: 00));
          if (pickTime != null) {
            setState(() {
              selectedTime = pickTime;
              if (widget.isInitialDateTime) {
                globalvariables.selectedStartTime.value = selectedTime;
              }
              widget.dateortimepicker.value =
                  '${pickTime.hour.toString()}:${pickTime.minute.toString()}';
              globalvariables.addData(widget.dateortimepicker);
            });
          }
        }
      },
      child: GetBuilder<GlobalVariables>(
          init: GlobalVariables(),
          builder: (globalvariables) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                labelText(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [boxText(), widget.iconData],
                ),
                const SizedBox(
                  height: 2,
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.grey,
                )
              ],
            );
          }),
    );
  }

  labelText() {
    if (widget.dateortimepicker.toString() == "") {
      return const SizedBox(height: 14);
    } else {
      return SizedBox(
        height: 14,
        child: Text(widget.boxTextString,
            style: TextStyle(
                fontSize: 10,
                fontFamily: 'Euclid',
                color: Colors.grey,
                fontWeight: FontWeight.w500)),
      );
    }
  }

  boxText() {
    if (widget.dateortimepicker.toString() == "") {
      // print('empty');
      return Text(widget.boxTextString,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Euclid Regular',
            color: Colors.black,
            //fontWeight: FontWeight.w500
          ));
    } else {
      // print(widget.dateortimepicker);
      return Text(widget.dateortimepicker.toString(),
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Euclid Regular',
            color: Colors.black,
            //fontWeight: FontWeight.w500
          ));
    }
  }
}
