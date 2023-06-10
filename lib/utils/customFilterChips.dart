import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:test_assignment/globalVariables.dart';

class CustomFilterChips extends StatefulWidget {
  const CustomFilterChips({Key? key, required this.index, required this.onTap})
      : super(key: key);
  final index;
  final onTap;

  @override
  State<CustomFilterChips> createState() => _CustomFilterChipsState();
}

class _CustomFilterChipsState extends State<CustomFilterChips> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalVariables>(
        init: GlobalVariables(),
        builder: (globalvariables) {
          return Padding(
              padding: const EdgeInsets.only(right: 8, bottom: 8),
              child: Container(
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white,
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
                        globalvariables.options[widget.index].toString(),
                        style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Euclid Regular',
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 1, 8, 1),
                      child: GestureDetector(
                        onTap: widget.onTap,
                        child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: const Color(0XFFFF6368),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.close,
                              size: 12,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
              )
              // Chip(
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(25),
              //       side: BorderSide(color: Colors.grey.shade400)),
              //   label: Text(
              //     globalvariables.options[widget.index],
              //     style: const TextStyle(
              //         fontSize: 16.8,
              //         fontFamily: 'Euclid Regular',
              //         fontWeight: FontWeight.w700,
              //         color: Colors.black),
              //   ),
              //   onDeleted: widget.onTap,
              //   deleteIcon: Container(
              //       width: 25,
              //       height: 25,
              //       decoration: BoxDecoration(
              //         color: const Color(0XFFFF6368),
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //       child: const Icon(
              //         Icons.close,
              //         size: 15,
              //         color: Colors.white,
              //       )),
              // ),
              );
        });
  }
}
