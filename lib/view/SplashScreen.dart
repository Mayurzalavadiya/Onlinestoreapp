import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinestoreapp/utils/ColorCode.dart';
import 'package:onlinestoreapp/utils/getColor.dart';
import 'package:onlinestoreapp/utils/string.dart';
import 'package:onlinestoreapp/view/HomeScreen.dart';
import 'package:onlinestoreapp/view/SignInScreen.dart';
import 'package:onlinestoreapp/view/SignUpScreen.dart';
import 'package:onlinestoreapp/view/ViewPagerScreen.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  splashScreenState createState() => splashScreenState();
}

class splashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final image = 'assets/logo/finders.png';




  @override
  void initState() {
    super.initState();


    Timer(Duration(seconds: 3), isLogin,  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Text(string.welcome,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold))),
            const SizedBox(height: 20),
            Icon(
              Icons.person,
              color: getColorFromHex(ColorCode.Color_blue),
              size: 100,
            ),
          ],
        ),
      ),
    ));
  }

   void isLogin() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }


}
