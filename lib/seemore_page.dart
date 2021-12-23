import 'package:flutter/material.dart';
import 'package:vietnam_travel_app/de_xuat_dia_danh.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/splash_page2.dart';

class SeeMorePage extends StatefulWidget {
  const SeeMorePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SeeMorePageState();
  }
}

class SeeMorePageState extends State<SeeMorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const FaIcon(
                FontAwesomeIcons.arrowLeft,
                color: Color(0XFF0869E1),
              )),
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          title: const Text(
            "Xem thêm",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
                color: Color(0XFF0869E1)),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => de_xuat_dia_danh()));
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                    left: 25,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.grey.shade300)),
                  child: const Text(
                    "Đề xuất địa danh lên hệ thống",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0XFF050505),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, bottom: 40),
                width: 374,
                height: 64,
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
                            builder: (context) => const SplashPage2()));
                  },
                  child: const Text(
                    "Đăng xuất",
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
