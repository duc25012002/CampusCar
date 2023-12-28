import 'dart:convert';

String vehicleRequestToJson(VehicleRequest data) => json.encode(data.toJson());

class VehicleRequest {
  VehicleRequest({
    this.vehicleID,
    this.vehicleHoldName,
    this.categoryVehicleID,
    this.platenumber,
    this.model,
    this.phone,
    this.color,
  });

  int? vehicleID;
  String? vehicleHoldName;
  int? categoryVehicleID;
  String? platenumber;
  String? model;
  String? phone;
  String? color;

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "platenumber": platenumber,
        "model": model,
        "color": color,
        "vehicleHoldName": vehicleHoldName,
        "categoryVehicleId": categoryVehicleID,
      };
}
