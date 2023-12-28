// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:campus_car_joco/utils/Colors.dart';

class MainInput extends StatefulWidget {
  TextEditingController controller;
  String? hint;
  IconData? icon;
  bool obscureText;
  bool isPassword;

  MainInput({
    Key? key,
    required this.controller,
    this.hint,
    required this.icon,
    required this.obscureText,
    required this.isPassword,
  }) : super(key: key);

  @override
  State<MainInput> createState() => _MainInputState();
}

class _MainInputState extends State<MainInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Material(
        elevation: 2.0,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: TextField(
          controller: widget.controller,
          cursorColor: ColorConst.blue3,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
              hintText: widget.hint,
              prefixIcon: Material(
                elevation: 0,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: Icon(
                  widget.icon,
                  color: ColorConst.primaryColor,
                ),
              ),
              suffixIcon: widget.isPassword == true
                  ? InkWell(
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          widget.obscureText = !widget.obscureText;
                        });
                      },
                      child: Material(
                        elevation: 0,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        child: Icon(
                          widget.obscureText
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined,
                          color: ColorConst.primaryColor,
                        ),
                      ),
                    )
                  : null,
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
        ),
      ),
    );
  }
}
