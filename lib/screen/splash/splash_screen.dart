import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacementNamed(context, 'home');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff5050af),
                Color(0xff303085),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "https://cdn-icons-png.freepik.com/512/1779/1779940.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "Weather",
                  style: TextStyle(fontSize: 30, color: Colors.yellow.shade700,fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  "Forecast App.",
                  style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 16.0,right: 16.0),
                child: Text(
                  "Mostly cloudy with scattered showers on Sunday. Highs in the low 70s. Another chance of scattered showers on Monday, then a dry stretch may take ...",
                  style: TextStyle(fontSize: 16,color: Colors.white),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
