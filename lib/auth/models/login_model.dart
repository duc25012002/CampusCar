import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

//String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.code,
    this.message,
    this.id,
  });

  int? code;
  String? message;

  int? id;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        code: json["code"],
        message: json["message"],
        id: json["data"] != null ? json["data"]["userId"] : -1,
      );

  // Map<String, dynamic> toJson() => {
  //       "message": message,
  //       "token": token,
  //       "branch_id": branchId,
  //       "user": user!.toJson(),
  //     };
}
