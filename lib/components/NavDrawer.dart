// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names, unrelated_type_equality_checks, sort_child_properties_last

import 'package:campus_car_joco/routes/routes.dart';
import 'package:campus_car_joco/utils/Colors.dart';
import 'package:campus_car_joco/utils/Reponsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      clipBehavior: Clip.antiAlias,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: <Widget>[
          Header(),
          ListTile(
            selectedColor: ColorConst.primaryColor,
            leading: const Icon(CupertinoIcons.cube_box),
            tileColor: Colors.transparent,
            title: Text(
              'Parking',
              style: GoogleFonts.inter(fontSize: Reponsive.fontSize * 7),
            ),
            onTap: () {
              Get.offAndToNamed(Routes.home, arguments: "garage");
            },
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.settings),
            title: Text(
              'Car Repair',
              style: GoogleFonts.inter(fontSize: Reponsive.fontSize * 7),
            ),
            tileColor: Colors.transparent,
            onTap: () {
              Get.offAndToNamed(Routes.home, arguments: "repair");
            },
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.arrow_3_trianglepath),
            title: Text(
              'In-Out',
              style: GoogleFonts.inter(fontSize: Reponsive.fontSize * 7),
            ),
            tileColor: Colors.transparent,
            onTap: () {
              Get.offAllNamed(Routes.searchAccessLog);
            },
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.lock),
            title: Text(
              'Logout',
              style: GoogleFonts.inter(fontSize: Reponsive.fontSize * 7),
            ),
            tileColor: Colors.transparent,
            onTap: () {
              Get.offAllNamed(Routes.login);
            },
          ),
          const Divider(),
          AboutListTile(
            // <-- SEE HERE
            icon: const Icon(
              Icons.info,
            ),
            child: Text(
              'About',
              style: GoogleFonts.inter(fontSize: Reponsive.fontSize * 7),
            ),
            applicationIcon: const Icon(
              Icons.local_play,
            ),
            applicationName: 'My Cool App',
            applicationVersion: '1.0.25',
            applicationLegalese: '© 2019 Company',
            aboutBoxChildren: [],
          ),
          const Divider(),
        ],
      ),
    );
  }

  DrawerHeader Header() {
    return DrawerHeader(
        decoration: BoxDecoration(
          color: ColorConst.primaryColor.withOpacity(0.8),
        ),
        child: const Text(""));
  }
}
