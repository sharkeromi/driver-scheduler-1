class Filter {
  List<Data>? data;
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
      'id': 1,
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
    }
  ];

  Filter({this.data});

  Filter.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      // json['data'].forEach((v) {
      //   data!.add(new Data.fromJson(v));
      // });
      datalist.forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? status;
  // String? statusShow;
  String? driverName;
  String? driverImage;
  String? carName;
  // int? carId;
  String? carNumber;
  String? shiftStartDate;
  String? shiftEndDate;
  String? shiftStartTime;
  String? shiftEndTime;
  // String? shiftDateTimeRaw;
  String? shiftDateTime;
  // Null? location;
  // int? isMaintenance;

  Data({
    this.id,
    this.status,
    // this.statusShow,
    this.driverName,
    this.driverImage,
    this.carName,
    // this.carId,
    this.carNumber,
    this.shiftStartDate,
    this.shiftEndDate,
    this.shiftStartTime,
    this.shiftEndTime,
    // this.shiftDateTimeRaw,
    this.shiftDateTime,
    // this.location,
    // this.isMaintenance,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    // statusShow = json['status_show'];
    driverName = json['driver_name'];
    driverImage = json['driver_image'];
    carName = json['car_name'];
    // carId = json['car_id'];
    carNumber = json['car_number'];
    shiftStartDate = json['shift_start_date'];
    shiftEndDate = json['shift_end_date'];
    shiftStartTime = json['shift_start_time'];
    shiftEndTime = json['shift_end_time'];
    // shiftDateTimeRaw = json['shift_date_time_raw'];
    shiftDateTime = json['shift_date_time'];
    // location = json['location'];
    // isMaintenance = json['is_maintenance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['status'] = status;
    // data['status_show'] = statusShow;
    data['driver_name'] = driverName;
    data['driver_image'] = driverImage;
    data['car_name'] = carName;
    // data['car_id'] = carId;
    data['car_number'] = carNumber;
    data['shift_start_date'] = shiftStartDate;
    data['shift_end_date'] = shiftEndDate;
    data['shift_start_time'] = shiftStartTime;
    data['shift_end_time'] = shiftEndTime;
    // data['shift_date_time_raw'] = shiftDateTimeRaw;
    data['shift_date_time'] = shiftDateTime;
    // data['location'] = location;
    // data['is_maintenance'] = isMaintenance;
    return data;
  }
}
