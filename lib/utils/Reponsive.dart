// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class Reponsive {
  static MediaQueryData mediaQueryData = const MediaQueryData();
  static double width = 0;
  static double height = 0;
  static double fontSize = 0;

  void setSize(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    width = mediaQueryData.size.width;
    height = mediaQueryData.size.height;
    fontSize = mediaQueryData.devicePixelRatio; //3px - 1 điểm ảnh
  }
}
