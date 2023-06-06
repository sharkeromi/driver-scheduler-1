import 'package:flutter/material.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:test_assignment/globalVariables.dart';
import 'package:test_assignment/model/index.dart';
import 'package:test_assignment/utils/apihandler.dart';
import 'package:test_assignment/utils/customFilterChips.dart';
import 'package:test_assignment/utils/customTextField.dart';
import 'package:test_assignment/utils/driverprofilecard.dart';
import 'package:date_format/date_format.dart';

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

  void clearText() {
    _startDate.clear();
    _endDate.clear();
    _startTime.clear();
    _endTime.clear();
    _driver.clear();
    _license.clear();
  }

  int tag = 3;
  String chosenlicence = "";
  String chosenDriver = "";

  TextEditingController _startDate = TextEditingController();
  TextEditingController _endDate = TextEditingController();
  TextEditingController _startTime = TextEditingController();
  TextEditingController _endTime = TextEditingController();
  TextEditingController _license = TextEditingController();
  TextEditingController _driver = TextEditingController();
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
        body: Column(
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
                        }                         else {
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
                        showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    height: height * 0.6,
                                    width: width * 0.9,
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                  child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Text("Filter",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontFamily: 'Euclid',
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  GestureDetector(
                                                      onTap: () {
                                                        clearText();
                                                      },
                                                      child: const Text("Clear",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  'Euclid',
                                                              color: Color(
                                                                  0xffFF6368),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500))),
                                                ],
                                              )),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              SizedBox(
                                                height: height * 0.09,
                                                width: width * 0.35,
                                                child: TextField(
                                                  enableInteractiveSelection:
                                                      false,
                                                  focusNode:
                                                      AlwaysDisabledFocusNode(),
                                                  controller: _startDate,
                                                  decoration:
                                                      const InputDecoration(
                                                          suffixIcon: Icon(Icons
                                                              .date_range_rounded),
                                                          labelText:
                                                              "Start Date"),
                                                  onTap: () async {
                                                    DateTime? pickStartDate =
                                                        await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(2000),
                                                            lastDate:
                                                                DateTime(2101));
                                                    if (pickStartDate != null) {
                                                      setState(() {
                                                        _startDate.text =
                                                            formatDate(
                                                                pickStartDate, [
                                                          dd,
                                                          ".",
                                                          MM,
                                                          " ",
                                                          yyyy
                                                        ]);
                                                        globalvariables.addData(
                                                            _startDate.text);
                                                      });
                                                    }
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                height: height * 0.09,
                                                width: width * 0.35,
                                                child: TextField(
                                                  enableInteractiveSelection:
                                                      false,
                                                  focusNode:
                                                      AlwaysDisabledFocusNode(),
                                                  controller: _endDate,
                                                  decoration:
                                                      const InputDecoration(
                                                          suffixIcon: Icon(Icons
                                                              .date_range_rounded),
                                                          labelText:
                                                              "End Date"),
                                                  onTap: () async {
                                                    DateTime? pickDate =
                                                        await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(2000),
                                                            lastDate:
                                                                DateTime(2101));
                                                    if (pickDate != null) {
                                                      setState(() {
                                                        _endDate.text =
                                                            formatDate(
                                                                pickDate, [
                                                          dd,
                                                          ".",
                                                          MM,
                                                          " ",
                                                          yyyy
                                                        ]);
                                                        globalvariables.addData(
                                                            _endDate.text);
                                                      });
                                                    }
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              SizedBox(
                                                height: height * 0.09,
                                                width: width * 0.35,
                                                child: TextField(
                                                  enableInteractiveSelection:
                                                      false,
                                                  focusNode:
                                                      AlwaysDisabledFocusNode(),
                                                  controller: _startTime,
                                                  decoration: const InputDecoration(
                                                      suffixIcon: Icon(Icons
                                                          .watch_later_rounded),
                                                      labelText: "Start Time"),
                                                  onTap: () async {
                                                    TimeOfDay? pickTime =
                                                        await showTimePicker(
                                                            context: context,
                                                            initialTime:
                                                                TimeOfDay(
                                                                    hour: 12,
                                                                    minute:
                                                                        00));
                                                    if (pickTime != null) {
                                                      setState(() {
                                                        _startTime.text =
                                                            '${pickTime.hour.toString()}:${pickTime.minute.toString()}';
                                                        globalvariables.addData(
                                                            _startTime.text);
                                                      });
                                                    }
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                height: height * 0.09,
                                                width: width * 0.35,
                                                child: TextField(
                                                  enableInteractiveSelection:
                                                      false,
                                                  focusNode:
                                                      AlwaysDisabledFocusNode(),
                                                  controller: _endTime,
                                                  decoration: const InputDecoration(
                                                      suffixIcon: Icon(Icons
                                                          .watch_later_rounded),
                                                      labelText: "End Time"),
                                                  onTap: () async {
                                                    TimeOfDay? pickTime =
                                                        await showTimePicker(
                                                            context: context,
                                                            initialTime:
                                                                TimeOfDay(
                                                                    hour: 12,
                                                                    minute:
                                                                        00));
                                                    if (pickTime != null) {
                                                      setState(() {
                                                        _endTime.text =
                                                            '${pickTime.hour.toString()}:${pickTime.minute.toString()}';
                                                        globalvariables.addData(
                                                            _endTime.text);
                                                      });
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          //SizedBox(height: height*0.01,),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: SizedBox(
                                              height: height * 0.09,
                                              width: width * 0.7,
                                              child: TextField(
                                                enableInteractiveSelection:
                                                    false,
                                                focusNode:
                                                    AlwaysDisabledFocusNode(),
                                                controller: _license,
                                                decoration: const InputDecoration(
                                                    suffixIcon: Icon(Icons
                                                        .chevron_right_rounded),
                                                    labelText:
                                                        "Select Car/License Plate"),
                                                onTap: () async {
                                                  showDialog(
                                                      context: context,
                                                      builder:
                                                          (context) => Dialog(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                child:
                                                                    Container(
                                                                  height:
                                                                      height *
                                                                          0.5,
                                                                  width: width *
                                                                      0.8,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(8),
                                                                    child:
                                                                        Column(
                                                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text("Select Car",
                                                                                style: TextStyle(fontSize: 20, fontFamily: 'Euclid', fontWeight: FontWeight.bold)),
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
                                                                          height:
                                                                              height * 0.01,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Container(
                                                                              height: height * 0.05,
                                                                              width: width * 0.75,
                                                                              decoration: BoxDecoration(
                                                                                border: Border.all(color: Colors.grey, width: 1, style: BorderStyle.solid),
                                                                                borderRadius: BorderRadius.circular(5),
                                                                                color: Colors.white,
                                                                              ),
                                                                              child: TextFormField(
                                                                                decoration: const InputDecoration(hintText: "Search", border: InputBorder.none, fillColor: Colors.black, prefixIcon: Icon(Icons.search)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: height * 0.01,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              height * 0.01,
                                                                        ),
                                                                        Expanded(
                                                                          child: ListView.builder(
                                                                              itemCount: globalvariables.licenseNo.length,
                                                                              itemBuilder: (context, i) {
                                                                                return Padding(
                                                                                  padding: EdgeInsets.all(8),
                                                                                  child: Container(
                                                                                    height: height * 0.035,
                                                                                    width: width * 0.4,
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text(globalvariables.licenseNo[i], style: TextStyle(fontFamily: 'Euclid Regular', fontSize: 18)),
                                                                                        Radio(
                                                                                          value: i,
                                                                                          groupValue: chosenlicence,
                                                                                          onChanged: (value) {
                                                                                            chosenlicence = i.toString();
                                                                                            _license.text = globalvariables.licenseNo[i];
                                                                                            globalvariables.addData(_license.text);
                                                                                          },
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }),
                                                                        ),
                                                                        Center(
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                Navigator.of(context).pop();
                                                                              });
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: height * 0.05,
                                                                              width: width * 0.3,
                                                                              decoration: BoxDecoration(color: const Color(0xffF89818), borderRadius: BorderRadius.circular(5)),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  "Submit",
                                                                                  style: TextStyle(fontFamily: 'Euclid Regular', fontSize: 16, color: Colors.white),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ));
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: SizedBox(
                                                height: height * 0.09,
                                                width: width * 0.7,
                                                child: TextField(
                                                  enableInteractiveSelection:
                                                      false,
                                                  focusNode:
                                                      AlwaysDisabledFocusNode(),
                                                  controller: _driver,
                                                  decoration: const InputDecoration(
                                                      suffixIcon: Icon(Icons
                                                          .chevron_right_rounded),
                                                      labelText:
                                                          "Select Driver"),
                                                  onTap: () async {
                                                    showDialog(
                                                        context: context,
                                                        builder:
                                                            (context) => Dialog(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        height *
                                                                            0.4,
                                                                    width:
                                                                        width *
                                                                            0.8,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10)),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8),
                                                                      child:
                                                                          Column(
                                                                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text("Select Driver", style: TextStyle(fontSize: 20, fontFamily: 'Euclid', fontWeight: FontWeight.bold)),
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
                                                                            height:
                                                                                height * 0.01,
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              SizedBox(
                                                                                height: height * 0.01,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                height * 0.01,
                                                                          ),
                                                                          Expanded(
                                                                            child: ListView.builder(
                                                                                itemCount: globalvariables.driver.length,
                                                                                itemBuilder: (context, i) {
                                                                                  return Padding(
                                                                                    padding: EdgeInsets.all(8),
                                                                                    child: Container(
                                                                                      height: height * 0.035,
                                                                                      width: width * 0.4,
                                                                                      child: Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Text(globalvariables.driver[i], style: TextStyle(fontFamily: 'Euclid Regular', fontSize: 18)),
                                                                                          Radio(
                                                                                            value: i,
                                                                                            groupValue: chosenDriver,
                                                                                            onChanged: (value) {
                                                                                              chosenDriver = i.toString();
                                                                                              _driver.text = globalvariables.driver[i];
                                                                                            },
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }),
                                                                          ),
                                                                          Center(
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                setState(() {
                                                                                  globalvariables.addData(_driver.text);
                                                                                  Navigator.of(context).pop();
                                                                                });
                                                                              },
                                                                              child: Container(
                                                                                height: height * 0.05,
                                                                                width: width * 0.3,
                                                                                decoration: BoxDecoration(color: const Color(0xffF89818), borderRadius: BorderRadius.circular(5)),
                                                                                child: Center(
                                                                                  child: Text(
                                                                                    "Submit",
                                                                                    style: TextStyle(fontFamily: 'Euclid Regular', fontSize: 16, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ));
                                                  },
                                                )),
                                          ),
                                          Center(
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  //globalvariables.startDate= _startDate.text;
                                                  if (globalvariables
                                                          .isVisible ==
                                                      true) {
                                                    Navigator.of(context).pop();
                                                  } else {
                                                    globalvariables.isVisible =
                                                        !globalvariables
                                                            .isVisible;
                                                    Navigator.of(context).pop();
                                                  }
                                                });
                                              },
                                              child: Container(
                                                height: height * 0.05,
                                                width: width * 0.3,
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffF89818),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
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
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
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
                      for (int i = 0; i < globalvariables.options.length; i++)
                        CustomFilterChips(
                          index: i,
                          onTap: () {
                            globalvariables.clearSpecific(i);
                            globalvariables.resetList();
                            setState(() {});
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
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 1, 4, 1),
                              child: Text(
                                "Clear",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Euclid Regular',
                                    color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 1, 8, 1),
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
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      size: 12,
                                      color: const Color(0XFFFF6368),
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
                        itemCount: _globalVariables.filterDriverInfo.length,
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
        ),
      ),
    );
  }
}
