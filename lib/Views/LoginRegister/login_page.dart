import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';
import 'package:vietnam_travel_app/Views/LoginRegister/register_page.dart';
import 'package:vietnam_travel_app/main.dart';
import 'package:vietnam_travel_app/test.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  bool check = true;
  bool checkPass = true;
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  _bindingUser() async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    setState(() {});

    txtEmail.text = (pres.getString('email') ?? '');
    txtPassword.text = (pres.getString('password') ?? '');
  }

  @override
  void initState() {
    super.initState();
    _bindingUser();
  }

  void _login() async {
    if (txtEmail.text.isNotEmpty && txtPassword.text.isNotEmpty) {
      bool isSuccess =
          await UserProvider.login(txtEmail.text, txtPassword.text);

      if (isSuccess) {
        if (check) {
          SharedPreferences pres = await SharedPreferences.getInstance();
          pres.setString('email', txtEmail.text);
          pres.setString('password', txtPassword.text);
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyApp(),
          ),
        );
      } else {
        const snackBar = SnackBar(content: Text('Đăng nhập thất bại'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      const snackBar = SnackBar(content: Text('Đăng nhập thất bại'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

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
          "Đăng nhập",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
              color: Color(0XFF0869E1)),
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
                "Email",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
              child: TextField(
                controller: txtEmail,
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
                "Mật khẩu",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
              child: TextField(
                controller: txtPassword,
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
                            size: 18,
                          )
                        : const FaIcon(
                            FontAwesomeIcons.eye,
                            color: Color(0XFF65676B),
                            size: 18,
                          ),
                  ),
                  hintText: "Nhập mật khẩu",
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: const Text(
                    "Nhớ mật khẩu",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {});
                      check = !check;
                    },
                    icon: check
                        ? const FaIcon(
                            FontAwesomeIcons.solidCheckSquare,
                            color: Color(0XFF0869E1),
                            size: 20,
                          )
                        : const FaIcon(
                            FontAwesomeIcons.square,
                            color: Color(0XFF0869E1),
                            size: 20,
                          )),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Quên tài khoản ?",
                        style: TextStyle(
                            color: Color(0XFF0869E1),
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      )),
                )
              ],
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
                  _login();
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
              margin: const EdgeInsets.only(top: 15),
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Bạn chưa có tài khoản?",
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
                              builder: (context) => const RegisterPage()));
                    },
                    child: const Text(
                      "Đăng ký ngay",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0XFF0869E1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
