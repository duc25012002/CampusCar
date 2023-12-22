// ignore_for_file: file_names

import 'package:campus_car_joco/components/MainButton.dart';
import 'package:campus_car_joco/utils/Reponsive.dart';
import 'package:campus_car_joco/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Reponsive().setSize(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Reponsive.height * 0.1),
          Center(
            child: Text(
              "Campus Car",
              style: GoogleFonts.inter(
                fontSize: Reponsive.fontSize * 15,
                fontWeight: FontWeight.w700,
                color: ColorConst.primaryColor,
              ),
            ),
          ),
          SizedBox(height: Reponsive.height * 0.05),
          SvgPicture.asset(
            "assets/icon/home_image.svg",
            width: Reponsive.width,
            height: Reponsive.height * 0.5,
            fit: BoxFit.fill,
          ),
          SizedBox(height: Reponsive.height * 0.03),
          MainButton(
            onCLick: () {},
            title: 'Upload',
          ),
          SizedBox(height: Reponsive.height * 0.02),
          Text(
            "---OR---",
            style: GoogleFonts.inter(
              fontSize: Reponsive.fontSize * 5,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(height: Reponsive.height * 0.02),
          MainButton(
            onCLick: () {},
            title: 'Camera',
          ),
        ],
      ),
    );
  }
}
