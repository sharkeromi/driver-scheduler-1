import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/controllers/listviewHandler.dart';
import 'package:test_assignment/utils/driverProfileCard.dart';

Widget listViewGen(height, width) {
  ListViewHandler driverListView = Get.put(ListViewHandler());
  return Obx(
    () => ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: driverListView.driverList.value.length,
      itemBuilder: (BuildContext context, i) {
        return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: driverProfileCard(
                height,
                width,
                driverListView.driverList.value[i]['driver_image'],
                driverListView.driverList.value[i]['driver_name'],
                driverListView.driverList.value[i]['car_number'],
                driverListView.driverList.value[i]['shift_start_date'],
                driverListView.driverList.value[i]['status']));
      },
    ),
  );
}
