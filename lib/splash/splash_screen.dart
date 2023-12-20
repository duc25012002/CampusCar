import 'dart:async';

import 'package:campus_car_joco/auth/views/login_screen.dart';
import 'package:campus_car_joco/utils.dart';
import 'package:campus_car_joco/widgets/my_fadein.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashDelay = 4;

  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Get.to(LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MyFadeIn(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 40,
              ),
              Container(
                child: Text("Campus Car",
                    style: TextStyle(
                        fontFamily: 'CarterOne',
                        fontSize: 40,
                        color: ColorConst.primaryBlue)),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        child: Lottie.asset('assets/gif/fast-furious.json'),
                        // color: Colors.black,
                      ),
                      Positioned(
                        top: 20,
                        child: Lottie.asset('assets/gif/cam-cctv.json',
                            height: 80),
                      ),
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    ));
  }
}
