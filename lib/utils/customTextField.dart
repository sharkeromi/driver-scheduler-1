import 'package:flutter/material.dart';
import 'package:test_assignment/globalVariables.dart';
import 'package:test_assignment/model/index.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {Key? key,
      required this.onChanged,
      required this.onPressed,
      required this.searchEditor})
      : super(key: key);
  final onChanged;
  final searchEditor;
  final onPressed;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  IconData? suffixIcon;
  TextEditingController search = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) {
        if (globalvariables.options.isNotEmpty) {
          globalvariables.replace(value.toString().trim());
          globalvariables.runFilter(value);
          globalvariables.isVisible = true;
        } else if (globalvariables.options.isEmpty) {
          globalvariables.addData(value.toString().trim());
          globalvariables.isVisible = true;
        } else {
          globalvariables.isVisible = false;
        }
        widget.searchEditor.clear();
        setState(() {
          globalvariables.clearButtonVisible = false;
        });
      },
      onChanged: widget.onChanged,
      controller: widget.searchEditor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(12, 6, 10, 12),
        hintText: "Search",
        border: InputBorder.none,
        fillColor: Colors.black,
        prefixIcon: Icon(Icons.search),
        suffixIcon: !globalvariables.clearButtonVisible
            ? null
            : IconButton(
                onPressed: widget.onPressed,
                icon: Icon(Icons.clear),
              ),
      ),
    );
  }
}
