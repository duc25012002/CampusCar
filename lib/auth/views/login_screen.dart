import 'package:campus_car_joco/auth/controller/Login_Controller.dart';
import 'package:campus_car_joco/routes/routes.dart';
import 'package:campus_car_joco/utils/utils.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
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
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        debugPrint("register");
                        Get.toNamed(Routes.signUp);
                      },
                    ),
                  )),
              Padding(
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
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        debugPrint("login");
                      },
                    ),
                  )),
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
