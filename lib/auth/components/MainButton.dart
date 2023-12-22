// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:campus_car_joco/utils/Utils.dart';
import 'package:google_fonts/google_fonts.dart';

class MainButton extends StatelessWidget {
  Function() onCLick;
  String title;
  MainButton({
    Key? key,
    required this.onCLick,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Container(
          width: 140,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConst.primaryColor,
            ),
            onPressed: onCLick,
            child: Text(title,
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                )),
          ),
        ));
  }
}
