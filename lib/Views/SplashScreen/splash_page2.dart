import 'package:flutter/material.dart';
import 'package:vietnam_travel_app/Views/LoginRegister/login_page.dart';
import 'package:vietnam_travel_app/Views/LoginRegister/register_page.dart';

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
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 65, bottom: 25),
                child: Image.asset(
                  "images/logo-ver3.png",
                  width: 183,
                  fit: BoxFit.cover,
                ),
              ),
              Image.asset("images/banner_main.png",
                  width: 366, fit: BoxFit.cover),
              Container(
                margin: const EdgeInsets.only(top: 30, left: 15, right: 15),
                width: 374,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0XFF0869E1)),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Đăng nhập",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 15, left: 15, right: 15, bottom: 40),
                width: 374,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0XFF0869E1),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
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
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
