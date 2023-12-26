import 'dart:convert';

AccessLogModel accessLogModelFromJson(String str) =>
    AccessLogModel.fromJson(json.decode(str));

class AccessLogModel {
  int? code;
  String? message;
  Data? data;

  AccessLogModel({this.code, this.message, this.data});

  AccessLogModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return data?.records.toString() ?? "DATA NULL";
  }
}

class Data {
  List<Records>? records;
  int? pageNumber;
  int? pageSize;
  int? totalRecords;

  Data({this.records, this.pageNumber, this.pageSize, this.totalRecords});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      records = <Records>[];
      json['records'].forEach((v) {
        records!.add(Records.fromJson(v));
      });
    }
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    totalRecords = json['totalRecords'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (records != null) {
      data['records'] = records!.map((v) => v.toJson()).toList();
    }
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    data['totalRecords'] = totalRecords;
    return data;
  }
}

class Records {
  int? logID;
  int? vehicleID;
  String? platenumber;
  String? status;
  int? gateID;
  String? image;
  String? createDate;

  Records(
      {this.logID,
      this.vehicleID,
      this.platenumber,
      this.status,
      this.gateID,
      this.image,
      this.createDate});

  Records.fromJson(Map<String, dynamic> json) {
    logID = json['LogID'];
    vehicleID = json['VehicleID'];
    platenumber = json['Platenumber'];
    status = json['Status'];
    gateID = json['GateID'];
    image = json['Image'];
    createDate = json['CreateDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['LogID'] = logID;
    data['VehicleID'] = vehicleID;
    data['Platenumber'] = platenumber;
    data['Status'] = status;
    data['GateID'] = gateID;
    data['Image'] = image;
    data['CreateDate'] = createDate;
    return data;
  }

  @override
  String toString() {
    return "logid = $logID status = $status";
  }
}
