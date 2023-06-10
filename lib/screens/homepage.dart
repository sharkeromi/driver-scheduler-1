import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/globalVariables.dart';
import 'package:test_assignment/model/index.dart';
import 'package:test_assignment/screens/filterPopUp.dart';
import 'package:test_assignment/utils/apiHandler.dart';
import 'package:test_assignment/utils/customFilterChips.dart';
import 'package:test_assignment/utils/customTextField.dart';
import 'package:test_assignment/utils/driverProfileCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class _HomePageState extends State<HomePage> {
  GlobalVariables _globalVariables = new GlobalVariables();
  FilterPopUp filterPopUp = new FilterPopUp();
  @override
  void initState() {
    super.initState();
    globalvariables.filterDriverInfo = globalvariables.datalist;
  }

  getData() async {
    globalvariables.driverInfo =
        (await api().fetchDriverInfo()) as Future<Filter>?;
    // globalvariables.foundDrivers = driverInfo;
  }

  int tag = 3;

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text("Shift Planner",
              style: TextStyle(
                  fontSize: 28.8,
                  fontFamily: 'Euclid Regular',
                  fontWeight: FontWeight.bold)),
        ),
        body: GetBuilder<GlobalVariables>(
            init: GlobalVariables(),
            builder: (globalvariables) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 40,
                          width: width * 0.75,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: CustomTextField(
                            onChanged: (val) {
                              if (val.toString().trim() == "") {
                                globalvariables.clearButtonVisible = false;
                                globalvariables.runFilter(val);
                              } else if (val.isNotEmpty) {
                                globalvariables.runFilter(val);
                                globalvariables.clearButtonVisible = true;
                              } else {
                                globalvariables.clearButtonVisible = false;
                                globalvariables.runFilter(val);
                              }
                              setState(() {});
                            },
                            onPressed: () {
                              globalvariables.resetList();
                              search.clear();
                              globalvariables.clearButtonVisible = false;
                              setState(() {});
                            },
                            searchEditor: search,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                          height: 40,
                          width: width * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xffF89818),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.tune,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              filterPopUp.filterPopUp1(context, height, width,
                                  () {
                                setState(() {
                                  if (globalvariables.isVisible == true) {
                                    Navigator.of(context).pop();
                                  } else {
                                    globalvariables.isVisible =
                                        !globalvariables.isVisible;
                                    Navigator.of(context).pop();
                                  }
                                });
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  if (globalvariables.options.isNotEmpty)
                    Visibility(
                      visible: globalvariables.isVisible,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(18, 17, 17, 0),
                        child: Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.start,
                          children: [
                            for (int i = 0;
                                i < globalvariables.options.length;
                                i++)
                              CustomFilterChips(
                                index: i,
                                onTap: () {
                                  globalvariables.clearSpecific(i);
                                  globalvariables.resetList();
                                //  setState(() {});
                                },
                              ),
                            Container(
                              height: 32,
                              decoration: BoxDecoration(
                                color: const Color(0XFFFF6368),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black45,
                                    blurRadius: 1,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(8, 1, 4, 1),
                                    child: Text(
                                      "Clear",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Euclid Regular',
                                          color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 1, 8, 1),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          globalvariables.resetList();
                                          globalvariables.clearData();
                                        });
                                      },
                                      child: Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: const Icon(
                                            Icons.close,
                                            size: 12,
                                            color: Color(0XFFFF6368),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            )
                            // Chip(
                            //   backgroundColor: const Color(0XFFFF6368),
                            //   shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(25),
                            //   ),
                            //   side: BorderSide(color: const Color(0XFFFF6368)),
                            //   label: const Text(
                            //     "Clear",
                            //     style: TextStyle(
                            //         fontSize: 16.8,
                            //         fontFamily: 'Euclid Regular',
                            //         fontWeight: FontWeight.w700,
                            //         color: Colors.white),
                            //   ),
                            //   onDeleted: () {
                            //     setState(() {
                            //       globalvariables.clearData();
                            //     });
                            //   },
                            //   //globalvariables.isVisible = false

                            //   deleteIcon: Container(
                            //       width: 25,
                            //       height: 25,
                            //       decoration: BoxDecoration(
                            //         color: Colors.white,
                            //         borderRadius: BorderRadius.circular(20),
                            //       ),
                            //       child: const Icon(
                            //         Icons.close,
                            //         size: 15,
                            //         color: const Color(0XFFFF6368),
                            //       )),
                            // )
                          ],
                        ),
                      ),
                    ),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 22.0, top: 16),
                        child: Text(
                          "Available Shift",
                          style: TextStyle(
                              fontSize: 21,
                              fontFamily: 'Euclid',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      )),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Container(
                          //color: Colors.amber,
                          //width: width,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  _globalVariables.filterDriverInfo.length,
                              itemBuilder: (BuildContext context, i) {
                                return Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: DriverProfileCard(
                                        height,
                                        width,
                                        // snapshot.data!.data![i].driverImage,
                                        _globalVariables.filterDriverInfo[i]
                                            ['driver_image'],
                                        _globalVariables.filterDriverInfo[i]
                                            ['driver_name'],
                                        _globalVariables.filterDriverInfo[i]
                                            ['car_number'],
                                        _globalVariables.filterDriverInfo[i]
                                            ['shift_start_date'],
                                        _globalVariables.filterDriverInfo[i]
                                            ['status']));
                              }),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
