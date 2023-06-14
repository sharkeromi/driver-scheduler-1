import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/consts/globalVariables.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';


class DateTimeHandler extends GetxController {
  RxList listofDateTime = [].obs;

  Rx<DateTime> selectedStartDate = Rx<DateTime>(DateTime.now());
  Rx<DateTime> selectedEndDate = Rx<DateTime>(DateTime.now());
  Rx<DateTime?> firstDateforEndDate = Rx<DateTime?>(null);
  Rx<TimeOfDay?> selectedEndTime = Rx<TimeOfDay?>(null);
  Rx<TimeOfDay?> selectedStartTime = Rx<TimeOfDay?>(null);

  RxString startDate = "".obs;
  RxString endDate = "".obs;
  RxString startTime = "".obs;
  RxString endTime = "".obs;

  void starDateChecker(context) async {
    DateTime? pickStartDate = await showDatePicker(
        context: context,
        initialDate: selectedStartDate.value,
        firstDate: firstDateforEndDate.value ?? DateTime(2000),
        lastDate: DateTime(2101));
    if (pickStartDate != null) {
      selectedStartDate.value = pickStartDate;
      startDate.value =
          formatDate(pickStartDate, [dd, ".", " ", MM, " ", yyyy]);
      addDateTime(startDate);
      if (pickStartDate.isAfter(selectedEndDate.value)) {
        endDate.value = '';
      }
    }
    update();
  }

  void endDateChecker(context) async {
    DateTime? pickStartDate = await showDatePicker(
        context: context,
        initialDate: selectedEndDate.value.isAfter(selectedStartDate.value)
            ? selectedEndDate.value
            : selectedStartDate.value,
        firstDate: selectedStartDate.value,
        lastDate: DateTime(2101));
    if (pickStartDate != null) {
      if (pickStartDate.isAfter(selectedStartDate.value)) {
        selectedEndDate.value = pickStartDate;
        endDate.value =
            formatDate(pickStartDate, [dd, ".", " ", MM, " ", yyyy]);
        // globalvariables.endDate.value = endDate.value;
        addDateTime(endDate);
      }
    }
    update();
  }

  void startTimeChecker(context) async {
    TimeOfDay? pickTime = await showTimePicker(
        context: context,
        initialTime: selectedStartDate.value.isBefore(DateTime.now())
            ? TimeOfDay.now()
            : selectedStartTime.value ?? const TimeOfDay(hour: 12, minute: 00));
    if (pickTime != null) {
      selectedStartTime.value = pickTime;
      startTime.value =
          '${pickTime.hour.toString()}:${pickTime.minute.toString()}';
      addDateTime(startTime);
    }
    update();
  }

  void endTimeChecker(context) async {
    TimeOfDay? pickTime = await showTimePicker(
        context: context,
        initialTime: selectedStartDate.value.isBefore(DateTime.now())
            ? selectedStartTime.value ?? TimeOfDay.now()
            : selectedEndTime.value ?? const TimeOfDay(hour: 12, minute: 00));
    if (pickTime != null) {
      selectedEndTime.value = pickTime;
      endTime.value =
          '${pickTime.hour.toString()}:${pickTime.minute.toString()}';
      addDateTime(endTime);
    }
    update();
  }

  void addDateTime(RxString newData) {
    if (newData.toString().trim() == "") {
    } else {
      listofDateTime.add(newData);
    }
    update();
  }

  void clearData() {
    globalvariables.options.clear();
    listofDateTime.clear();
    startDate.value = '';
    endDate.value = '';
    startTime.value = '';
    endTime.value = '';
    update();
  }

  void testTimeChecker(context) async {
    TimeOfDay? pickTime = await showTimePicker(
        context: context,
        initialTime: selectedStartDate.value.isBefore(DateTime.now())
            ? TimeOfDay.now()
            : selectedStartTime.value ?? const TimeOfDay(hour: 12, minute: 00));
    if (pickTime != null) {
      selectedStartTime.value = pickTime;
      startTime.value =
          '${pickTime.hour.toString()}:${pickTime.minute.toString()}';
      addDateTime(startTime);
    }
    update();
  }
}
