import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';
import 'package:vietnam_travel_app/Views/SplashScreen/splash_page2.dart';
import 'package:vietnam_travel_app/main.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  bool isLogged = false;

  _checkLoggin() async {
    bool login = await UserProvider.isLogged();
    if (login) {
      setState(() {
        isLogged = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _checkLoggin();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(milliseconds: 4500);
    return Timer(duration, handleTimeout);
  }

  handleTimeout() {
    if (isLogged) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyApp(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SplashPage2(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0XFF0066FF),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 190),
                  child: Image.asset(
                    'images/logo-light.png',
                    width: 110,
                    fit: BoxFit.cover,
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 100.0),
                  child: const SpinKitFadingCircle(
                    color: Colors.white,
                    size: 50.0,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
