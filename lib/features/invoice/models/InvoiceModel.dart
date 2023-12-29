import 'dart:convert';

InvoiceModel invoiceModelFromJson(String str) =>
    InvoiceModel.fromJson(json.decode(str));

class InvoiceModel {
  int? code;
  String? message;
  Data? data;

  InvoiceModel({this.code, this.message, this.data});

  InvoiceModel.fromJson(Map<String, dynamic> json) {
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
}

class Data {
  List<Invoice>? records;
  int? pageNumber;
  int? pageSize;
  int? totalRecords;

  Data({this.records, this.pageNumber, this.pageSize, this.totalRecords});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      records = <Invoice>[];
      json['records'].forEach((v) {
        records!.add(Invoice.fromJson(v));
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

class Invoice {
  int? billId;
  int? userId;
  int? categoryVehicleID;
  String? kilometer;
  String? createDate;
  int? typeRepaidId;
  String? descriptions;
  double? accessoriesCost;
  double? repairCost;
  double? totalAmount;
  int? employeeId;
  int? billStatus;
  String? notes;

  Invoice(
      {this.billId,
      this.userId,
      this.categoryVehicleID,
      this.kilometer,
      this.createDate,
      this.typeRepaidId,
      this.descriptions,
      this.accessoriesCost,
      this.repairCost,
      this.totalAmount,
      this.employeeId,
      this.billStatus,
      this.notes});

  Invoice.fromJson(Map<String, dynamic> json) {
    billId = json['billId'];
    userId = json['userId'];
    categoryVehicleID = json['categoryVehicleID'];
    kilometer = json['kilometer'];
    createDate = json['createDate'];
    typeRepaidId = json['typeRepaidId'];
    descriptions = json['descriptions'];
    accessoriesCost = json['accessoriesCost'];
    repairCost = json['repairCost'];
    totalAmount = json['totalAmount'];
    employeeId = json['employeeId'];
    billStatus = json['billStatus'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['billId'] = billId;
    data['userId'] = userId;
    data['categoryVehicleID'] = categoryVehicleID;
    data['kilometer'] = kilometer;
    data['createDate'] = createDate;
    data['typeRepaidId'] = typeRepaidId;
    data['descriptions'] = descriptions;
    data['accessoriesCost'] = accessoriesCost;
    data['repairCost'] = repairCost;
    data['totalAmount'] = totalAmount;
    data['employeeId'] = employeeId;
    data['billStatus'] = billStatus;
    data['notes'] = notes;
    return data;
  }

  @override
  String toString() {
    return 'BillData {\n'
        '  billId: $billId,\n'
        '  userId: $userId,\n'
        '  categoryVehicleID: $categoryVehicleID,\n'
        '  kilometer: $kilometer,\n'
        '  createDate: $createDate,\n'
        '  typeRepaidId: $typeRepaidId,\n'
        '  descriptions: $descriptions,\n'
        '  accessoriesCost: $accessoriesCost,\n'
        '  repairCost: $repairCost,\n'
        '  totalAmount: $totalAmount,\n'
        '  employeeId: $employeeId,\n'
        '  billStatus: $billStatus,\n'
        '  notes: $notes\n'
        '}';
  }
}
