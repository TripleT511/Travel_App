import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vietnam_travel_app/splash_page2.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, handleTimeout);
  }

  handleTimeout() {
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => const HomePage()));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SplashPage2()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 190),
                  child: Image.asset(
                    'images/splash_logo.png',
                    width: 133,
                    fit: BoxFit.cover,
                  )),
              Container(
                margin: const EdgeInsets.only(top: 50.0),
                child: const SpinKitThreeBounce(
                  color: Color(0XFF0869E1),
                  size: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
