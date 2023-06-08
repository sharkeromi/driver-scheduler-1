import 'dart:async';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:test_assignment/globalVariables.dart';

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
  var dateortimepicker;
  var dateortime;
  bool isInitialDateTime;
  var iconData;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
          // padding:
          //     MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7))))),
      onPressed: () async {
        if (widget.dateortime == "date") {
          //pickStartDate =initalDateChecker(pickStartDate);

          DateTime? pickStartDate = await showDatePicker(
              context: context,
              initialDate: globalvariables.selectedStartDate ??
                  selectedDate ??
                  DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101));
          if (pickStartDate != null) {
            setState(() {
              selectedDate = pickStartDate;
              if (widget.isInitialDateTime) {
                globalvariables.selectedStartDate = selectedDate;
              } else {}
              widget.dateortimepicker =
                  formatDate(pickStartDate, [dd, ".", " ", MM, " ", yyyy]);
              globalvariables.addData(widget.dateortimepicker);
            });
          }
        } else if (widget.dateortime == "time") {
          TimeOfDay? pickTime = await showTimePicker(
              context: context,
              initialTime: globalvariables.selectedStartTime ??
                  selectedTime ??
                  TimeOfDay(hour: 12, minute: 00));
          if (pickTime != null) {
            setState(() {
              selectedTime = pickTime;
              if (widget.isInitialDateTime) {
                globalvariables.selectedStartTime = selectedTime;
              }
              widget.dateortimepicker =
                  '${pickTime.hour.toString()}:${pickTime.minute.toString()}';
              globalvariables.addData(widget.dateortimepicker);
            });
          }
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelText(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              boxText(),
              widget.iconData
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          const Divider(
            thickness: 2,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  labelText() {
    if (widget.dateortimepicker == "") {
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
    if (widget.dateortimepicker == "") {
      return Text(widget.boxTextString,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Euclid Regular',
            color: Colors.black,
            //fontWeight: FontWeight.w500
          ));
    } else {
      return Text(widget.dateortimepicker,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Euclid Regular',
            color: Colors.black,
            //fontWeight: FontWeight.w500
          ));
    }
  }
}
