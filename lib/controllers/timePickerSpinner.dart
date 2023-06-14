import 'package:get/get.dart';
import 'package:test_assignment/controllers/dateTimeHandler.dart';

class TimePickerSpinnerController extends GetxController {
  DateTimeHandler dateTimeHandler = Get.find();
  var hour = 0.obs;
  var min = 0.obs;

  void setStartHourMin() {
    dateTimeHandler.startTime.value =
        "${hour.value.toString().padLeft(2, '0')}:${min.value.toString().padLeft(2, '0')}";
    dateTimeHandler.addDateTime(dateTimeHandler.startTime);
    Get.back();
  }

  void setEndHourMin() {
    dateTimeHandler.endTime.value =
        "${hour.value.toString().padLeft(2, '0')}:${min.value.toString().padLeft(2, '0')}";
         dateTimeHandler.addDateTime(dateTimeHandler.endTime);
    Get.back();
  }
}
