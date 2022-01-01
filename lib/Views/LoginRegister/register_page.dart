import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/Views/LoginRegister/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RegisterPageState();
  }
}

class RegisterPageState extends State<RegisterPage> {
  bool checkPass = true;
  bool checkPass2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          "Đăng ký",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
            color: Color(0XFF0869E1),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(
                  top: 20, left: 15, right: 15, bottom: 10),
              child: const Text(
                "Họ tên",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Nhập họ tên",
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: Color(0XFFB9B9B9)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: Color(0XFF0869E1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: const Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Nhập email",
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: Color(0XFFB9B9B9)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: Color(0XFF0869E1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: const Text(
                "Số điện thoại",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Nhập số điện thoại",
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: Color(0XFFB9B9B9)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: Color(0XFF0869E1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: const Text(
                "Mật khẩu",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
              child: TextField(
                obscureText: checkPass ? true : false,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: Color(0XFFB9B9B9)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: Color(0XFF0869E1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {});
                      checkPass = !checkPass;
                    },
                    icon: checkPass
                        ? const FaIcon(
                            FontAwesomeIcons.eyeSlash,
                            color: Color(0XFF65676B),
                            size: 20,
                          )
                        : const FaIcon(
                            FontAwesomeIcons.eye,
                            color: Color(0XFF65676B),
                            size: 20,
                          ),
                  ),
                  hintText: "Nhập mật khẩu",
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: const Text(
                "Xác nhận mật khẩu",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
              child: TextField(
                obscureText: checkPass ? true : false,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: Color(0XFFB9B9B9)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: Color(0XFF0869E1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {});
                      checkPass = !checkPass;
                    },
                    icon: checkPass
                        ? const FaIcon(
                            FontAwesomeIcons.eyeSlash,
                            color: Color(0XFF65676B),
                            size: 20,
                          )
                        : const FaIcon(
                            FontAwesomeIcons.eye,
                            color: Color(0XFF65676B),
                            size: 20,
                          ),
                  ),
                  hintText: "Nhập lại mật khẩu",
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
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
                          builder: (context) => const RegisterPage()));
                },
                child: const Text(
                  "Đăng ký",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25, bottom: 40),
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Bạn đã có tài khoản?",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: const Text(
                      "Đăng nhập ngay",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0XFF0869E1),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
