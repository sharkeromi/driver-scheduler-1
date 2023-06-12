import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/consts/globalVariables.dart';

class ListViewHandler extends GetxController {
  GlobalVariables globalvariables = Get.put(GlobalVariables());
  RxList driverList = RxList([]);
  TextEditingController search = TextEditingController();
  RxBool clearButtonVisible = false.obs;

  @override
  void onInit() {
    driverList.value = globalvariables.datalist;
    super.onInit();
  }

  void runFilter(String searchInput) {
    if (globalvariables.options.isEmpty) {
      if (searchInput.trim() == "") {
        driverList.value = globalvariables.datalist;
        globalvariables.temp.value = driverList.value;
      } else {
        driverList.value = globalvariables.datalist
            .where((element) => element["driver_name"]
                .toLowerCase()
                .contains(searchInput.toLowerCase().trim()))
            .toList();
        globalvariables.temp.value = driverList.value;
      }
    } else {
      if (searchInput.trim() == "") {
        driverList.value = globalvariables.temp.value;
      } else {
        driverList.value = driverList
            .where((element) => element["driver_name"]
                .toLowerCase()
                .contains(searchInput.toLowerCase().trim()))
            .toList();
      }
    }
  }

  void resetList() {
    driverList.value = globalvariables.datalist;
    update();
  }

  void replace(String newData) {
    if (newData.toString().trim() == "") {
    } else {
      globalvariables.options.clear();
      globalvariables.options.add(newData);
    }
  }

  void clearSpecific(specificDataIndex) {
    globalvariables.options.removeAt(specificDataIndex);
    update();
  }

    void clearData() {
    globalvariables.options.clear();
    update();
  }
}
