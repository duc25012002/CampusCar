import 'package:campus_car_joco/features/roleRepair/searchVehicle/controller/SearchVehicleRepairController.dart';
import 'package:campus_car_joco/utils/Colors.dart';
import 'package:campus_car_joco/utils/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchVehicleRepairScreen extends StatefulWidget {
  const SearchVehicleRepairScreen({super.key});

  @override
  State<SearchVehicleRepairScreen> createState() =>
      _SearchVehicleRepairScreenState();
}

class _SearchVehicleRepairScreenState extends State<SearchVehicleRepairScreen> {
  final SearchVehicleRepairController _controller =
      Get.find<SearchVehicleRepairController>();

  @override
  void initState() {
    var args = Get.arguments;
    _controller.keySearchController.text = args;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SafeArea(
              child: Column(
                children: [
                  Text(
                    "Plate no.",
                    style:
                        GoogleFonts.openSans(fontSize: Reponsive.fontSize * 6),
                  ),
                  SizedBox(
                    width: Reponsive.width * 0.9,
                    child: TextFormField(
                      controller: _controller.keySearchController,
                      onFieldSubmitted: (value) {
                        _controller
                            .checkVehicle(_controller.keySearchController.text);
                      },
                      decoration: InputDecoration(
                        hintText: "Search",
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color(0xffc0c0c0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: ColorConst.primaryColor,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 6),
                      ),
                    ),
                  ),
                  SizedBox(height: Reponsive.height * 0.05),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
