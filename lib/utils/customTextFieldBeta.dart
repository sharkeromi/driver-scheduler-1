import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/consts/globalVariables.dart';
import 'package:test_assignment/controllers/listviewHandler.dart';

class CustomTextFieldBeta extends StatelessWidget {
  CustomTextFieldBeta({Key? key}) : super(key: key);

  GlobalVariables globalvariables = Get.put(GlobalVariables());
  ListViewHandler filterDriverList = Get.put(ListViewHandler());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        controller: filterDriverList.search,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(12, 6, 10, 12),
          hintText: "Search",
          border: InputBorder.none,
          fillColor: Colors.black,
          prefixIcon: Icon(Icons.search),
          suffixIcon: !filterDriverList.clearButtonVisible.value
              ? null
              : IconButton(
                  onPressed: () {
                    filterDriverList.search.clear();
                    filterDriverList.resetList();
                    filterDriverList.clearButtonVisible.value = false;
                  },
                  icon: Icon(Icons.clear)),
        ),
        onChanged: (val) {
          if (val.toString().trim() == "") {
            filterDriverList.clearButtonVisible.value = false;
            filterDriverList.runFilter(val);
          } else if (val.isNotEmpty) {
            filterDriverList.clearButtonVisible.value = true;
            filterDriverList.runFilter(val);
          } else {
            filterDriverList.clearButtonVisible.value = false;
            filterDriverList.runFilter(val);
          }
        },
        onSubmitted: (val) {
          if (globalvariables.options.value.isNotEmpty) {
            filterDriverList.replace(val.toString().trim());
            filterDriverList.runFilter(val);
          } else if (globalvariables.options.value.isEmpty) {
            globalvariables.addData(RxString(val.toString().trim()));
          }
          filterDriverList.search.clear();
          filterDriverList.clearButtonVisible.value = false;
        },
      ),
    );
  }
}
