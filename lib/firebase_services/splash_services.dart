import 'dart:async';
import 'package:bla_bla/UI/auth/login_screen.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }
}
//Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginScreen()))