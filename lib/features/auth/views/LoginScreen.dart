import 'package:campus_car_joco/components/MainButton.dart';
import 'package:campus_car_joco/components/MainInput.dart';
import 'package:campus_car_joco/features/auth/controller/LoginController.dart';
import 'package:campus_car_joco/models/AuthLogin.dart';
import 'package:campus_car_joco/routes/Routes.dart';
import 'package:campus_car_joco/utils/Colors.dart';
import 'package:campus_car_joco/utils/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  late LoginController _controller;

  @override
  void initState() {
    _controller = Get.find<LoginController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: Reponsive.width,
            height: Reponsive.height * 0.35,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icon/header_logo_login.jpeg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: Reponsive.height * 0.05),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "campus",
                  style: GoogleFonts.josefinSans(
                      fontSize: Reponsive.fontSize * 15,
                      color: ColorConst.primaryColor,
                      fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: "Car",
                  style: GoogleFonts.josefinSans(
                      fontSize: Reponsive.fontSize * 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(height: Reponsive.height * 0.03),
          MainInput(
            controller: _controller.controllerUserName,
            icon: Icons.email,
            hint: "Email",
            obscureText: false,
            isPassword: false,
          ),
          SizedBox(height: Reponsive.height * 0.03),
          MainInput(
            controller: _controller.controllerUserPass,
            icon: Icons.key_off,
            hint: "Password",
            obscureText: true,
            isPassword: true,
          ),
          SizedBox(height: Reponsive.height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MainButton(
                onCLick: () async {
                  _controller.login(AuthLogin(
                    userName: _controller.controllerUserName.text,
                    userPass: _controller.controllerUserPass.text,
                  ));
                  debugPrint("Login");
                },
                title: "Login",
              ),
              MainButton(
                onCLick: () {
                  Get.toNamed(Routes.signUp);
                },
                title: "Sign Up",
              ),
            ],
          ),
          SizedBox(height: Reponsive.height * 0.08),
          GestureDetector(
            onTap: () {
              debugPrint("Forgot");
            },
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Forgot Password ? ",
                      style: TextStyle(
                          fontSize: Reponsive.fontSize * 5,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    TextSpan(
                      text: " Refresh Password",
                      style: TextStyle(
                          fontSize: Reponsive.fontSize * 5,
                          fontWeight: FontWeight.w700,
                          color: ColorConst.primaryColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
