// ignore_for_file: file_names, unused_field

import 'package:campus_car_joco/components/MainButton.dart';
import 'package:campus_car_joco/components/NavDrawer.dart';
<<<<<<< HEAD
import 'package:campus_car_joco/features/checkVehicle/controller/ScanVehicleController.dart';
import 'package:campus_car_joco/features/roleRepair/invoice/controller/InvoiceController.dart';
=======
import 'package:campus_car_joco/features/checkVehicle/controller/UploadDataController.dart';
import 'package:campus_car_joco/features/invoice/controller/InvoiceController.dart';
import 'package:campus_car_joco/features/invoice/models/InvoiceModel.dart';
>>>>>>> e2a2b5a (CC-14|Thêm api post hoá đơn)
import 'package:campus_car_joco/utils/Colors.dart';

import 'package:campus_car_joco/utils/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UploadDataController _controller;
  final InvoiceController controller = Get.find<InvoiceController>();
  @override
  void initState() {
    _controller = Get.find<UploadDataController>();
<<<<<<< HEAD
    controller.getListAccessary();
=======
    //controller.getListAccessary();
    //controller.getListInvoice("2003");
    Invoice invoice = Invoice();
    // controller.postInvoice(invoice);
>>>>>>> e2a2b5a (CC-14|Thêm api post hoá đơn)
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Reponsive().setSize(context);
    var args = Get.arguments;
    args ??= "repair";
    return Scaffold(
      appBar: AppBar(),
      drawer: const NavDrawer(),
      body: Column(
        children: [
          args == "repair"
              ? Center(
                  child: Text(
                    "Campus Repair",
                    style: GoogleFonts.inter(
                      fontSize: Reponsive.fontSize * 10,
                      fontWeight: FontWeight.w700,
                      color: ColorConst.primaryColor,
                    ),
                  ),
                )
              : Center(
                  child: Text(
                    "Campus Garages",
                    style: GoogleFonts.inter(
                      fontSize: Reponsive.fontSize * 10,
                      fontWeight: FontWeight.w700,
                      color: ColorConst.primaryColor,
                    ),
                  ),
                ),
          SizedBox(height: Reponsive.height * 0.05),
          args == "repair"
              ? SvgPicture.asset(
                  "assets/icon/home_image.svg",
                  width: Reponsive.width,
                  height: Reponsive.height * 0.5,
                  fit: BoxFit.cover,
                )
              : SvgPicture.asset(
                  "assets/icon/car_park.svg",
                  width: Reponsive.width,
                  height: Reponsive.height * 0.3,
                  fit: BoxFit.contain,
                ),
          SizedBox(height: Reponsive.height * 0.03),
          MainButton(
            onCLick: () {
              _controller.textRecognition("gallery", args);
            },
            title: 'Gallery',
          ),
          SizedBox(height: Reponsive.height * 0.02),
          Text(
            ">---OR---<",
            style: GoogleFonts.inter(
              fontSize: Reponsive.fontSize * 5,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(height: Reponsive.height * 0.02),
          MainButton(
            onCLick: () {
              _controller.textRecognition("camera", args);
            },
            title: 'Camera',
          ),
        ],
      ),
    );
  }
}
