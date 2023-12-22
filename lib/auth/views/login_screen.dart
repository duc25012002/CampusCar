import 'package:campus_car_joco/auth/controller/Login_Controller.dart';
import 'package:campus_car_joco/auth/models/Auth_Login.dart';
import 'package:campus_car_joco/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  late LoginController _controller;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _controller = Get.find<LoginController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 300,
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
                child: TextFormField(
                  controller: _controller.controllerUserName,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return "Enter valid email";
                    } else {
                      return null;
                    }
                  },
                  cursorColor: ColorConst.blue3,
                  decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(
                        Icons.email,
                        color: ColorConst.primaryColor,
                      ),
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 13)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextFormField(
                controller: _controller.controllerUserPass,
                cursorColor: ColorConst.blue5,
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(
                      Icons.lock,
                      color: ColorConst.primaryColor,
                    ),
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 13)),
                obscureText: true,
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
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                          color: ColorConst.primaryColor),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: ColorConst.primaryColor,
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
                        },
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Container(
                    width: 140,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                        color: ColorConst.primaryColor),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorConst.primaryColor,
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
                        if (formKey.currentState!.validate()) {}
                        _controller.login(AuthLogin(
                          userName: _controller.controllerUserName.text,
                          userPass: _controller.controllerUserPass.text,
                        ));
                        debugPrint("Login");
                      },
                    ),
                  ),
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
                  "Forgot Password ?",
                  style: TextStyle(
                      // color: Constants.primaryColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
