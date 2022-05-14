import 'package:bmi/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void navigationToNextPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  Future startSplashScreenTimer() async {
    var duration = Duration(seconds: 2);
    return  Timer(duration, navigationToNextPage);
  }

  @override
  void initState() {
    super.initState();
    //start timer
    startSplashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // splashscreen image
        child: new Image.asset('assets/images/splash.png', fit: BoxFit.fill)
    );
  }
}

