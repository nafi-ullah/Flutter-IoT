import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pera_on/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen())
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/sback.jpg"),
                fit: BoxFit.cover),
          ),
          child: Image.asset("assets/images/simage.png")// Foreground widget here
      )
    );
  }
}
