import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/globalVariables.dart';
import 'package:test_assignment/screens/homepage.dart';
import 'package:test_assignment/utils/customDatePicker.dart';
import 'package:test_assignment/utils/customDriverCarPicker.dart';

class FilterPopUp {
  filterPopUp1(context, height, width, onTap) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              height: height - 360,
              width: width - 32,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // const SizedBox(
                            //   width: 10,
                            // ),
                            const Text("Filter",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Euclid',
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                                onTap: () {
                                  // globalvariables.clearText();
                                },
                                child: const Text("Clear",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Euclid',
                                        color: Color(0xffFF6368),
                                        fontWeight: FontWeight.w500))),
                          ],
                        )),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<GlobalVariables>(
                            init: GlobalVariables(),
                            builder: (globalvariables) {
                              return SizedBox(
                                  height: height * 0.1,
                                  width: (width - 48) / 2,
                                  child: CustomDatePicker(
                                    boxTextString: "Start Date",
                                    dateortimepicker: globalvariables.startDate,
                                    dateortime: "date",
                                    isInitialDateTime: true,
                                    iconData: const Icon(
                                      Icons.date_range_rounded,
                                      color: Color(0xff7488A6),
                                    ),
                                  ));
                            }),
                        SizedBox(
                            height: height * 0.1,
                            width: (width - 48) / 2,
                            child: CustomDatePicker(
                              iconData: const Icon(
                                Icons.date_range_rounded,
                                color: Color(0xff7488A6),
                              ),
                              boxTextString: "End Date",
                              dateortimepicker: globalvariables.endDate,
                              dateortime: "date",
                              isInitialDateTime: false,
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: height * 0.1,
                          width: (width - 48) / 2,
                          child: CustomDatePicker(
                            dateortime: "time",
                            dateortimepicker: globalvariables.startTime,
                            boxTextString: "Start Time",
                            isInitialDateTime: true,
                            iconData: const Icon(
                              Icons.watch_later_rounded,
                              color: Color(0xff7488A6),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: height * 0.1,
                            width: (width - 48) / 2,
                            child: CustomDatePicker(
                              iconData: const Icon(
                                Icons.watch_later_rounded,
                                color: Color(0xff7488A6),
                              ),
                              dateortime: "time",
                              dateortimepicker: globalvariables.endTime,
                              boxTextString: "End Time",
                              isInitialDateTime: false,
                            )),
                      ],
                    ),
                    GetBuilder<GlobalVariables>(
                        init: GlobalVariables(),
                        builder: (test1GV) {
                          return SizedBox(
                              height: height * 0.1,
                              //width: width - 60,
                              child: CustomDriverCarPicker(
                                boxTextString: "Select Car/License Plate",
                                driverorcarpicker: test1GV.license,
                                onPressed: () {
                                  filterPopUp2(context, height, width);
                                },
                              ));
                        }),
                    GetBuilder<GlobalVariables>(
                        init: GlobalVariables(),
                        builder: (globalvariables) {
                          return SizedBox(
                              height: height * 0.1,
                              //width: width - 60,
                              child: CustomDriverCarPicker(
                                boxTextString: "Select Driver",
                                driverorcarpicker: globalvariables.driverEditor,
                                onPressed: () {
                                  filterPopUp3(context, height, width);
                                },
                              ));
                        }),
                    // Padding(
                    //   padding: const EdgeInsets.all(10.0),
                    //   child: SizedBox(
                    //       height: height * 0.09,
                    //       width: width * 0.7,
                    //       child: TextField(
                    //         enableInteractiveSelection: false,
                    //         focusNode: AlwaysDisabledFocusNode(),
                    //         controller: globalvariables.drivereditor,
                    //         decoration: const InputDecoration(
                    //             suffixIcon:
                    //                 Icon(Icons.chevron_right_rounded),
                    //             labelText: "Select Driver"),
                    //         onTap: () {
                    //           filterPopUp3(context, height, width);
                    //         },
                    //       )),
                    // ),

                    Center(
                      child: GestureDetector(
                        onTap: onTap,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0, bottom: 8),
                          child: Container(
                            height: height * 0.05,
                            width: width * 0.3,
                            decoration: BoxDecoration(
                                color: const Color(0xffF89818),
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Text(
                                "Apply",
                                style: TextStyle(
                                    fontFamily: 'Euclid',
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  filterPopUp2(context, height, width) {
    showDialog(
        context: context,
        builder: (context) {
          return GetBuilder<GlobalVariables>(
              init: GlobalVariables(),
              builder: (testGlobalariables) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    height: height * 0.5,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Select Car",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Euclid',
                                      fontWeight: FontWeight.bold)),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Row(
                            children: [
                              Container(
                                height: height * 0.05,
                                width: width * 0.75,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      hintText: "Search",
                                      border: InputBorder.none,
                                      fillColor: Colors.black,
                                      prefixIcon: Icon(Icons.search)),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: testGlobalariables.licenseNo.length,
                                itemBuilder: (context, i) {
                                  return Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Container(
                                      height: height * 0.035,
                                      width: width * 0.4,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(testGlobalariables.licenseNo[i],
                                              style: TextStyle(
                                                  fontFamily: 'Euclid Regular',
                                                  fontSize: 18)),
                                          Radio(
                                            value: i,
                                            groupValue: testGlobalariables
                                                .chosenlicence,
                                            onChanged: (value) {
                                              testGlobalariables.chosenlicence =
                                                  RxString(i.toString());
                                              testGlobalariables.license =
                                                  RxString(testGlobalariables
                                                      .licenseNo[i]);
                                              testGlobalariables.addData(
                                                  testGlobalariables.license);
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                height: height * 0.05,
                                width: width * 0.3,
                                decoration: BoxDecoration(
                                    color: const Color(0xffF89818),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        fontFamily: 'Euclid Regular',
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }

  filterPopUp3(context, height, width) {
    showDialog(
        context: context,
        builder: (context) {
          return GetBuilder<GlobalVariables>(
              init: GlobalVariables(),
              builder: (globalvariables) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    height: height * 0.4,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Select Driver",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Euclid',
                                      fontWeight: FontWeight.bold)),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: height * 0.01,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: globalvariables.driver.length,
                                itemBuilder: (context, i) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: SizedBox(
                                      height: height * 0.035,
                                      width: width * 0.4,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(globalvariables.driver[i],
                                              style: const TextStyle(
                                                  fontFamily: 'Euclid Regular',
                                                  fontSize: 18)),
                                          Radio(
                                            value: i,
                                            groupValue:
                                                globalvariables.chosenDriver,
                                            onChanged: (value) {
                                              globalvariables.chosenDriver =
                                                  RxString(i.toString());
                                              globalvariables.driverEditor =
                                                  RxString(globalvariables
                                                      .driver[i]);
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                globalvariables
                                    .addData(globalvariables.driverEditor);
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                height: height * 0.05,
                                width: width * 0.3,
                                decoration: BoxDecoration(
                                    color: const Color(0xffF89818),
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        fontFamily: 'Euclid Regular',
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
