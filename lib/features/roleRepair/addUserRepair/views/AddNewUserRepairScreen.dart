import 'package:campus_car_joco/components/VehicleInput.dart';
import 'package:campus_car_joco/features/roleRepair/addUserRepair/controller/addUserRepairController.dart';
import 'package:campus_car_joco/utils/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/Colors.dart';

class AddNewUserRepairScreen extends StatefulWidget {
  const AddNewUserRepairScreen({super.key});

  @override
  State<AddNewUserRepairScreen> createState() => _AddNewUserRepairScreenState();
}

class _AddNewUserRepairScreenState extends State<AddNewUserRepairScreen> {
  final AddUserRepairController _controller =
      Get.find<AddUserRepairController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: Reponsive.width / 2,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorConst.primaryColor,
          ),
          onPressed: () {
            _controller.postUser();
          },
          child: Text("Add",
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: Reponsive.fontSize * 7,
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                "Add New User",
                style: GoogleFonts.inter(
                  fontSize: Reponsive.fontSize * 10,
                  fontWeight: FontWeight.w700,
                  color: ColorConst.primaryColor,
                ),
              ),
            ),
            SizedBox(height: Reponsive.height * 0.03),
            VehicleInput(
              controller: _controller.emailController,
              label: "Email",
            ),
            SizedBox(height: Reponsive.height * 0.02),
            VehicleInput(
              controller: _controller.phoneController,
              label: "Phone Number",
            ),
            SizedBox(height: Reponsive.height * 0.02),
            VehicleInput(
              controller: _controller.userName,
              label: "User Name",
            ),
            SizedBox(height: Reponsive.height * 0.02),
            VehicleInput(
              controller: _controller.address,
              label: "Address",
            ),
          ],
        ),
      ),
    );
  }
}
