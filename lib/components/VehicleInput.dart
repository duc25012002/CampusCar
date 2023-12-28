// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:campus_car_joco/utils/Reponsive.dart';
import 'package:flutter/material.dart';

class VehicleInput extends StatelessWidget {
  TextEditingController controller;
  String? label;
  String? text;
  bool? isReadOnly;
  VehicleInput({
    Key? key,
    required this.controller,
    this.label,
    this.text,
    this.isReadOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: TextFormField(
        readOnly: isReadOnly == null ? false : true,
        style: TextStyle(
          color: Colors.black,
          fontSize: Reponsive.fontSize * 7,
        ),
        controller: controller,
        decoration: InputDecoration(
          label: Text(
            label ?? "",
            style: TextStyle(
              fontSize: Reponsive.fontSize * 7,
              color: const Color.fromARGB(255, 97, 97, 97),
            ),
          ),
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              width: 2,
              color: Color(0xffc0c0c0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              width: 2,
              color: Color(0xffc0c0c0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Color(0xffc0c0c0),
              width: 2,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        ),
      ),
    );
  }
}
