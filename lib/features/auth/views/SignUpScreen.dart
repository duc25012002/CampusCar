import 'package:campus_car_joco/features/auth/controller/SignUpController.dart';
import 'package:campus_car_joco/routes/Routes.dart';
import 'package:campus_car_joco/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late SignUpController _controller;

  @override
  void initState() {
    _controller = Get.find<SignUpController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 350,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icon/header_logo_login.jpeg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: _controller.controllerUserName,
                cursorColor: ColorConst.blue3,
                decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.email,
                        color: ColorConst.primaryColor,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: _controller.controllerUserPass,
                cursorColor: ColorConst.blue5,
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.lock,
                        color: ColorConst.primaryColor,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 13)),
                obscureText: true,
              ),
            ),
          ),
          const SizedBox(height: 25),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100))),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConst.primaryColor),
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                debugPrint("Aaaaaa");
                Get.toNamed(Routes.signUp);
              },
            ),
          ),
          const Text("---OR---"),
        ],
      ),
    );
  }
}
