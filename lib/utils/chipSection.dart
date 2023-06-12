import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/consts/globalVariables.dart';
import 'package:test_assignment/controllers/listviewHandler.dart';
import 'package:test_assignment/utils/customFilterChips.dart';

class ChipSection extends StatelessWidget {
  ChipSection({Key? key}) : super(key: key);

  ListViewHandler chipData = Get.put(ListViewHandler());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => globalvariables.options.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.fromLTRB(18, 17, 17, 0),
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                children: [
                  for (int i = 0; i < globalvariables.options.length; i++)
                    CustomFilterChips(
                      index: i,
                      onTap: () {
                        chipData.clearSpecific(i);
                        chipData.resetList();
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
                          padding: const EdgeInsets.fromLTRB(0, 1, 8, 1),
                          child: GestureDetector(
                            onTap: () {
                              chipData.resetList();
                              chipData.clearData();
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
                                  color: Color(0XFFFF6368),
                                )),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          : const SizedBox(),
    );
  }
}
