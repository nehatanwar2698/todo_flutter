import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo/screens/homepage.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "images/splash.png",
            scale: 0.8,
          ),
          Text(
            "TODO APP",
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
    ));
  }
}
