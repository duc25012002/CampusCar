import 'package:campus_car_joco/utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _controllerEmail = TextEditingController();
  final _controllerPass = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: _controllerEmail,
                cursorColor: ColorConst.blue3,
                decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.email,
                        color: ColorConst.primaryBlue,
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
                controller: _controllerPass,
                cursorColor: ColorConst.blue5,
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.lock,
                        color: ColorConst.primaryBlue,
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
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    color: ColorConst.primaryBlue),
                child: TextButton(
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    debugPrint("Aaaaaa");
                  },
                ),
              )),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Forgot Password ?",
                style: TextStyle(
                    // color: Constants.primaryBlue,
                    fontSize: 13,
                    fontWeight: FontWeight.w700),
              ),
              GestureDetector(
                onTap: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an Account ?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
