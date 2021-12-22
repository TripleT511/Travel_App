import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vietnam_travel_app/login_page.dart';
import 'package:vietnam_travel_app/register_page.dart';

class SplashPage2 extends StatefulWidget {
  const SplashPage2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashPage2State();
  }
}

class SplashPage2State extends State<SplashPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 75, bottom: 25),
                child: Image.asset(
                  "images/logo-ver3.png",
                  width: 183,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 55),
                child: Image.asset("images/banner_main.png",
                    width: 366, fit: BoxFit.cover),
              ),
              Container(
                margin: const EdgeInsets.only(top: 55, left: 20, right: 20),
                width: 374,
                height: 64,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0XFF0869E1)),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: const Text(
                    "Đăng Nhập",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
                width: 374,
                height: 64,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0XFF0869E1),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                  },
                  child: const Text(
                    "Đăng ký",
                    style: TextStyle(
                        color: Color(0XFF0869E1),
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
