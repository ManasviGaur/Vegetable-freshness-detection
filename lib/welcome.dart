// First Welcome Screen

import 'dart:async';
import 'package:flutter/material.dart';

class Welcomescreen extends StatefulWidget {
  const Welcomescreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<Welcomescreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacementNamed(context, '/screen2');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: Text(
                'Vegetable Freshness Detector',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Image.asset('assets/front.jpg'),
            const SizedBox(
              height: 40.0,
            ),
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
