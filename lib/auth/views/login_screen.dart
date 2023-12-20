import 'package:campus_car_joco/utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  State createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  //final auth = FirebaseAuth.instance;

  var _controllerEmail = TextEditingController();
  var _controllerPass = TextEditingController();
  bool isLoading = false;

  // bool validate() {
  //   var emailRegex = RegExp(
  //       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  //   if (_controllerEmail.text == "" ||
  //       !emailRegex.hasMatch(_controllerEmail.text)) {
  //     Utils.showFlashMsg(
  //         color: Colors.redAccent,
  //         context: context,
  //         message: 'Please enter valid email.');
  //     return false;
  //   } else if (_controllerPass.text == "") {
  //     Utils.showFlashMsg(
  //         color: Colors.redAccent,
  //         context: context,
  //         message: 'Please enter a password.');
  //     return false;
  //   }
  //   return true;
  // }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: WaveClipper2(),
                  child: Container(
                    child: Column(),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xffC8DFF1), Color(0xffAAC4E9)])),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper3(),
                  child: Container(
                    child: Column(),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xffAAC4E9), ColorConst.blue5])),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper1(),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Campus Car",
                          style: TextStyle(
                              fontFamily: 'CarterOne',
                              fontSize: 40,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      ColorConst.primaryBlue,
                      ColorConst.secondaryBlue,
                    ])),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextField(
                  controller: _controllerEmail,
                  cursorColor: ColorConst.blue3,
                  decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Icon(
                          Icons.email,
                          color: ColorConst.primaryBlue,
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextField(
                  controller: _controllerPass,
                  cursorColor: ColorConst.blue5,
                  decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Icon(
                          Icons.lock,
                          color: ColorConst.primaryBlue,
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                  obscureText: true,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: ColorConst.primaryBlue),
                  child: TextButton(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {},
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Text(
            //       "Forgot Password ?",
            //       style: TextStyle(
            //           color: Constants.primaryBlue,
            //           fontSize: 13,
            //           fontWeight: FontWeight.w700),
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         // Navigator.of(context).push(
            //         //     MaterialPageRoute(builder: (context) => AdminSignup()));
            //       },
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: <Widget>[
            //           Text(
            //             "Don't have an Account ?",
            //             style: TextStyle(
            //                 color: Colors.black,
            //                 fontSize: 13,
            //                 fontWeight: FontWeight.normal),
            //           ),
            //         ],
            //       ),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
