import 'dart:convert';

import 'package:campus_car_joco/api/ApiDefine.dart';
import 'package:campus_car_joco/models/TokenModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Server {
  static String? loginToken;

  static Future<String?> getTokenApi() async {
    Map body = {'username': "admin", 'password': "admin123"};
    String jsonBody = json.encode(body);
    var response = await http.post(
      Uri.parse(Api.urlToken),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      TokenModel tokenModel = tokenModelFromJson(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("tokenApi", tokenModel.token ?? "");
      debugPrint(tokenModel.token);
      return tokenModel.token;
    } else {
      return null;
    }
  }

  postRequest({String? endPoint, String? body, String? token}) async {
    try {
      return await http.post(
        Uri.parse(endPoint!),
        headers: {
          'Accept': 'application/json',
          'Authorization': "Bearer ${token!}",
          "content-type": "application/json ; charset=utf-8"
        },
        body: body,
      );
    } catch (e) {
      return null;
    }
  }
}
