import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ChangePasswordPageState();
  }
}

class ChangePasswordPageState extends State<ChangePasswordPage> {
  bool checkPass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          title: Container(
            margin: const EdgeInsets.only(left: 66),
            child: const Text(
              "Đổi mật khẩu",
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Roboto',
                  color: Color(0XFF0869E1)),
            ),
          )),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: const Text(
              "Mật khẩu cũ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
            child: TextField(
              obscureText: checkPass ? true : false,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {});
                    checkPass = !checkPass;
                  },
                  icon: checkPass
                      ? const FaIcon(
                          FontAwesomeIcons.eyeSlash,
                          color: Color(0XFF050505),
                          size: 20,
                        )
                      : const FaIcon(
                          FontAwesomeIcons.eye,
                          color: Color(0XFF050505),
                          size: 20,
                        ),
                ),
                hintText: "Nhập mật khẩu cũ",
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: const Text(
              "Mật khẩu mới",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
            child: TextField(
              obscureText: checkPass ? true : false,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {});
                    checkPass = !checkPass;
                  },
                  icon: checkPass
                      ? const FaIcon(
                          FontAwesomeIcons.eyeSlash,
                          color: Color(0XFF050505),
                          size: 20,
                        )
                      : const FaIcon(
                          FontAwesomeIcons.eye,
                          color: Color(0XFF050505),
                          size: 20,
                        ),
                ),
                hintText: "Nhập mật khẩu mới",
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: const Text(
              "Mật khẩu mới",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
            child: TextField(
              obscureText: checkPass ? true : false,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {});
                    checkPass = !checkPass;
                  },
                  icon: checkPass
                      ? const FaIcon(
                          FontAwesomeIcons.eyeSlash,
                          color: Color(0XFF050505),
                          size: 20,
                        )
                      : const FaIcon(
                          FontAwesomeIcons.eye,
                          color: Color(0XFF050505),
                          size: 20,
                        ),
                ),
                hintText: "Nhập lại mật khẩu mới",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
            width: 374,
            height: 64,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0XFF0869E1)),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Đổi mật khẩu",
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
                borderRadius: BorderRadius.circular(15),
                color: const Color(0XFFE4E6EB)),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Huỷ",
                style: TextStyle(
                    color: Color(0XFF050505),
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
