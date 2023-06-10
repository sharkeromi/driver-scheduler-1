import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:test_assignment/globalVariables.dart';
import 'package:test_assignment/screens/filterPopUp.dart';

class CustomDriverCarPicker extends StatefulWidget {
  CustomDriverCarPicker(
      {Key? key,
      required this.boxTextString,
      required this.driverorcarpicker,
      required this.onPressed})
      : super(key: key);

  var boxTextString;
  var driverorcarpicker;
  final VoidCallback onPressed;
  @override
  State<CustomDriverCarPicker> createState() => _CustomDriverCarPickerState();
}

class _CustomDriverCarPickerState extends State<CustomDriverCarPicker> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7))))),
      onPressed: widget.onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisSize: MainAxisSize.min,
        children: [
          labelText(),
          Row(
            //mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              boxText(),
              Icon(
                Icons.chevron_right_rounded,
                color: Color(0xff7488A6),
              )
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          const Divider(
            thickness: 2,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  labelText() {
    if (widget.driverorcarpicker == "") {
      return const SizedBox(height: 14);
    } else {
      return SizedBox(
        height: 14,
        child: Text(widget.boxTextString,
            style: TextStyle(
                fontSize: 10,
                fontFamily: 'Euclid',
                color: Colors.grey,
                fontWeight: FontWeight.w500)),
      );
    }
  }

  boxText() {
    if (widget.driverorcarpicker == "") {
      return Text(widget.boxTextString,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Euclid Regular',
            color: Colors.black,
            //fontWeight: FontWeight.w500
          ));
    } else {
      return Text(widget.driverorcarpicker.toString(),
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Euclid Regular',
            color: Colors.black,
            //fontWeight: FontWeight.w500
          ));
    }
  }
}
