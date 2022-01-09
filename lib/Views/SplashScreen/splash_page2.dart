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
                margin: const EdgeInsets.only(top: 100, bottom: 5),
                child: Image.asset(
                  "images/logo.png",
                  width: 110,
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                'T2P Travel',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Color(0XE6242A37),
                    fontWeight: FontWeight.w900,
                    fontSize: 25),
              ),
              const Text(
                'Du lịch cho người Việt',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Color(0X80242A37),
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 200,
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, left: 15, right: 15),
                width: 374,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0XFF0066ff)),
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
                    color: const Color(0XFF0066ff),
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
                        color: Color(0XFF0066ff),
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
