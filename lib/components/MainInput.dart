// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:campus_car_joco/utils/Utils.dart';

class MainInput extends StatelessWidget {
  TextEditingController controller;
  String? hint;
  IconData icon;

  MainInput({
    Key? key,
    required this.controller,
    required this.icon,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Material(
        elevation: 2.0,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: TextField(
          controller: controller,
          cursorColor: ColorConst.blue3,
          decoration: InputDecoration(
              hintText: hint,
              prefixIcon: Material(
                elevation: 0,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: Icon(
                  icon,
                  color: ColorConst.primaryColor,
                ),
              ),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
        ),
      ),
    );
  }
}
