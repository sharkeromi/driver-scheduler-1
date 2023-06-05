class GlobalVariables {
  static final _globalvariables = GlobalVariables._internal();

  List<String> options = [];

  bool isVisible = false;

  List<String> licenseNo = [
    "Toyota/97-666",
    "Toyota/122476",
    "Toyota/552738",
    "Toyota/ABC827838"
  ];

  List<String> driver = [
    "Peter Griffin",
    "Stewie Griffin",
    "Glen Quagmire",
    "Ananta Jalil"
  ];

  void addData(String newData) {
    if (newData.toString().trim() == "") {
    } else {
      options.add(newData);
    }
  }

  void replace(String newData) {
    if (newData.toString().trim() == "") {
    } else {
      options.clear();
      options.add(newData);
    }
  }

  void clearData() {
    options.clear();
    //isVisible = false;
  }

  void clearSpecific(specificDataIndex) {
    options.removeAt(specificDataIndex);
    print(options);
  }

  factory GlobalVariables() {
    return _globalvariables;
  }
  GlobalVariables._internal();
}

final globalvariables = GlobalVariables();
