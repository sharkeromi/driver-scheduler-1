import 'package:test_assignment/model/index.dart';

class GlobalVariables {
  static final _globalvariables = GlobalVariables._internal();

  List<String> options = [];

  Future<Filter>? driverInfo;

  bool isVisible = false;
  bool clearButtonVisible = false;

  List<Map<String, dynamic>> filterDriverInfo = [];
  List<Map<String, dynamic>> temp = [];
  List<Map<String, dynamic>> datalist = [
    {
      'id': 1,
      'status': "init",
      'driver_name': "Khalek",
      'car_name': "Toyota",
      'car_number': "AA 99 999",
      'shift_start_date': "28. April 2023",
      'shift_start_time': "08:30",
      'driver_image': "assets/khalek.jpeg",
      'shift_end_date': "30. April 2023",
      'shift_end_time': "05:30",
      'shift_date_time': "08:30, 28, April 2023"
    },
    {
      'id': 2,
      'status': "ongoing",
      'driver_name': "Malek",
      'car_name': "Toyota",
      'car_number': "AA 99 999",
      'shift_start_date': "29. March 2023",
      'shift_end_date': "30. April 2023",
      'shift_start_time': "08:30",
      'driver_image': "assets/malek.jpeg",
      'shift_end_time': "05:30",
      'shift_date_time': "08:30, 28, April 2023"
    },
    {
      'id': 3,
      'status': "Borolok",
      'driver_name': "Ananta Jalil",
      'car_name': "Mercedes",
      'car_number': "AA 99 999",
      'shift_start_date': "28. April 2023",
      'shift_start_time': "08:30",
      'driver_image': "assets/ananta.jpeg",
      'shift_end_date': "30. April 2023",
      'shift_end_time': "05:30",
      'shift_date_time': "08:30, 28, April 2023"
    },
    {
      'id': 4,
      'status': "Ded",
      'driver_name': "Joe Biden",
      'car_name': "BMW",
      'car_number': "AA 99 999",
      'shift_start_date': "28. April 2023",
      'shift_start_time': "08:30",
      'driver_image': "assets/joebiden.jpeg",
      'shift_end_date': "30. April 2023",
      'shift_end_time': "05:30",
      'shift_date_time': "08:30, 28, April 2023"
    },
    {
      'id': 5,
      'status': "Awake",
      'driver_name': "Vladmir Putin",
      'car_name': "Volvo",
      'car_number': "AA 99 999",
      'shift_start_date': "28. April 2023",
      'shift_start_time': "08:30",
      'driver_image': "assets/putin.jpeg",
      'shift_end_date': "30. April 2023",
      'shift_end_time': "05:30",
      'shift_date_time': "08:30, 28, April 2023"
    },
    {
      'id': 6,
      'status': "Unnoyon",
      'driver_name': "Sheikh Hasina",
      'car_name': "Nouka",
      'car_number': "AA 99 999",
      'shift_start_date': "28. April 2023",
      'shift_start_time': "08:30",
      'driver_image': "assets/sheikhhasina.jpeg",
      'shift_end_date': "30. April 2023",
      'shift_end_time': "05:30",
      'shift_date_time': "08:30, 28, April 2023"
    },
    {
      'id': 7,
      'status': "Deuce",
      'driver_name': "Stewie Griffin",
      'car_name': "Tri Cycle",
      'car_number': "AA 99 999",
      'shift_start_date': "28. April 2023",
      'shift_start_time': "08:30",
      'driver_image': "assets/stewie.jpeg",
      'shift_end_date': "30. April 2023",
      'shift_end_time': "05:30",
      'shift_date_time': "08:30, 28, April 2023"
    },
    {
      'id': 8,
      'status': "DubDub",
      'driver_name': "Rick Sanchez",
      'car_name': "Portal",
      'car_number': "AA 99 999",
      'shift_start_date': "28. April 2023",
      'shift_start_time': "08:30",
      'driver_image': "assets/rick.jpeg",
      'shift_end_date': "30. April 2023",
      'shift_end_time': "05:30",
      'shift_date_time': "08:30, 28, April 2023"
    },
  ];

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

  //iterable search mechanism
  void runFilter(String searchInput) {
    if (options.isEmpty) {
      if (searchInput.trim() == "") {
        filterDriverInfo = datalist;
        temp = filterDriverInfo;
      } else {
        filterDriverInfo = datalist
            .where((element) => element["driver_name"]
                .toLowerCase()
                .contains(searchInput.toLowerCase().trim()))
            .toList();
        temp = filterDriverInfo;
      }
    } else {
      if (searchInput.trim() == "") {
        filterDriverInfo = temp;
      } else {
        filterDriverInfo = filterDriverInfo
            .where((element) => element["driver_name"]
                .toLowerCase()
                .contains(searchInput.toLowerCase().trim()))
            .toList();
      }
    }
  }

  //Reset list view onPressed chip cancel button
  void resetList() {
    filterDriverInfo = datalist;
  }

  //add data to chip
  void addData(String newData) {
    if (newData.toString().trim() == "") {
    } else {
      options.add(newData);
    }
  }

  //replace chip
  void replace(String newData) {
    if (newData.toString().trim() == "") {
    } else {
      options.clear();
      options.add(newData);
    }
  }

  //clear chip
  void clearData() {
    options.clear();
  }

  //clear specific chip
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
