import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel {
  int? code;
  String? message;
  Data? data;

  UserModel({this.code, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
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
  int? userId;
  String? userEmail;
  String? userPhone;
  String? joinDate;
  int? roleID;
  bool? isManager;
  String? createdDate;
  int? merchantId;
  String? userName;
  int? gender;
  bool? status;
  String? birthDate;
  int? serviceType;

  Data(
      {this.userId,
      this.userEmail,
      this.userPhone,
      this.joinDate,
      this.roleID,
      this.isManager,
      this.createdDate,
      this.merchantId,
      this.userName,
      this.gender,
      this.status,
      this.birthDate,
      this.serviceType});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userEmail = json['userEmail'];
    userPhone = json['userPhone'];
    joinDate = json['joinDate'];
    roleID = json['roleID'];
    isManager = json['isManager'];
    createdDate = json['createdDate'];
    merchantId = json['merchantId'];
    userName = json['userName'];
    gender = json['gender'];
    status = json['status'];
    birthDate = json['birthDate'];

    serviceType = json['serviceType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['userEmail'] = userEmail;
    data['userPhone'] = userPhone;

    data['joinDate'] = joinDate;

    data['roleID'] = roleID;
    data['isManager'] = isManager;
    data['createdDate'] = createdDate;
    data['merchantId'] = merchantId;
    data['userName'] = userName;
    data['gender'] = gender;
    data['status'] = status;
    data['birthDate'] = birthDate;

    data['serviceType'] = serviceType;
    return data;
  }
}
