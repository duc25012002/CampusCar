import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

//String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.code,
    this.message,
    this.token,
    this.success,
  });

  int? code;
  String? message;
  String? token;
  bool? success;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        code: json["code"],
        message: json["message"],
        token: json["data"] != null ? json["data"]["accessToken"] : '',
        success: json["success"],
      );

  // Map<String, dynamic> toJson() => {
  //       "message": message,
  //       "token": token,
  //       "branch_id": branchId,
  //       "user": user!.toJson(),
  //     };
}
