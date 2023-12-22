import 'dart:convert';

TokenModel tokenModelFromJson(String str) =>
    TokenModel.fromJson(json.decode(str));

//String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class TokenModel {
  TokenModel({
    this.code,
    this.message,
    this.token,
  });

  int? code;
  String? message;
  String? token;

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        code: json["code"],
        message: json["message"],
        token: json["data"] != null ? json["data"]["AccessToken"] : '',
      );

  // Map<String, dynamic> toJson() => {
  //       "message": message,
  //       "token": token,
  //       "branch_id": branchId,
  //       "user": user!.toJson(),
  //     };
}
