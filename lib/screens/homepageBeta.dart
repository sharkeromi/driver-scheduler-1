import 'package:flutter/material.dart';
import 'package:test_assignment/screens/filterPopUp.dart';
import 'package:test_assignment/utils/chipSection.dart';
import 'package:test_assignment/utils/customTextFieldBeta.dart';
import 'package:test_assignment/utils/listViewDriver.dart';

class HomePageBeta extends StatelessWidget {
  HomePageBeta({Key? key}) : super(key: key);

  FilterPopUp filterPopUp = FilterPopUp();

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
                    // SEARCH FILTER
                    child: CustomTextFieldBeta(),
                    // HERE
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  // FILTER BUTTON
                  InkWell(
                    onTap: () {
                      filterPopUp.filterPopUp1(context, height, width);
                    },
                    child: Container(
                      height: 40,
                      width: width * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF89818),
                      ),
                      child: const Icon(
                        Icons.tune,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // HERE
                ],
              ),
            ),
            // FILTERED CHIPS
            ChipSection(),
            // HERE
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
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    // LIST VIEW GENERATOR
                    child: listViewGen(height, width),
                    // HERE
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
