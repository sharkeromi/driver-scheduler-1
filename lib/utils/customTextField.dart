import 'package:flutter/material.dart';
import 'package:test_assignment/globalVariables.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({Key? key}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool clearButtonVisible = false;
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
        globalvariables.addData(value);
        if (globalvariables.options.isNotEmpty) {
          globalvariables.isVisible = true;
        } else {
          globalvariables.isVisible = false;
        }
        //globalvariables.isVisible = !globalvariables.isVisible;
        search.clear();
        setState(() {
          clearButtonVisible = false;
        });
      },
      onChanged: (val) {
        if (val.toString().trim() == "") {
          setState(() {
            clearButtonVisible = false;
          });
        } else if (val.isNotEmpty) {
          setState(() {
            clearButtonVisible = true;
          });
        } else {
          setState(() {
            clearButtonVisible = false;
          });
        }
      },
      controller: search,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(12, 6, 10, 12),
        hintText: "Search",
        border: InputBorder.none,
        fillColor: Colors.black,
        prefixIcon: Icon(Icons.search),
        suffixIcon: !clearButtonVisible
            ? null
            : IconButton(
                onPressed: () {
                  setState(() {
                    search.clear();
                    clearButtonVisible = false;
                  });
                },
                icon: Icon(Icons.clear),
              ),
      ),
    );
  }
}
