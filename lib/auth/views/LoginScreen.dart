import 'package:campus_car_joco/auth/controller/LoginController.dart';
import 'package:campus_car_joco/auth/models/AuthLogin.dart';
import 'package:campus_car_joco/components/MainButton.dart';
import 'package:campus_car_joco/components/MainInput.dart';
import 'package:campus_car_joco/routes/Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            width: MediaQuery.sizeOf(context).width,
            height: 350,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icon/header_logo_login.jpeg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height / 6),
          MainInput(
            controller: _controller.controllerUserName,
            icon: Icons.email,
            hint: "Email",
          ),
          const SizedBox(height: 20),
          MainInput(
            controller: _controller.controllerUserPass,
            icon: Icons.key_off,
            hint: "Password",
          ),
          const SizedBox(height: 25),
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
          const SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              debugPrint("Forgot");
            },
            child: const Center(
              child: Text(
                "Forgot Password ? Refresh Password",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
