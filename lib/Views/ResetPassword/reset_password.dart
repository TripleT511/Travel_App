import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';
import 'package:vietnam_travel_app/Views/LoginRegister/login_page.dart';

// ignore: must_be_immutable
class ResetPasswordPage extends StatefulWidget {
  String token;
  ResetPasswordPage({Key? key, required this.token}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return ResetPasswordPageState(token);
  }
}

class ResetPasswordPageState extends State<ResetPasswordPage> {
  String token;
  ResetPasswordPageState(this.token);
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtPassword2 = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool checkPass = true;
  bool checkPass2 = true;

  void _resetPassword() async {
    if (formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Vui lòng đợi...');
      bool isSuccess = await UserProvider.resetPassword(
          txtPassword.text, txtPassword2.text, token);

      if (isSuccess) {
        EasyLoading.showSuccess('Đổi mật khẩu thành công\nVui lòng đăng nhập');
        EasyLoading.dismiss();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const LoginPage(),
            ),
            (route) => false);
      } else {
        EasyLoading.showError('Đổi mật khẩu thất bại');
        EasyLoading.dismiss();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 50,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Color(0XFF0066FF),
            size: 21,
          ),
        ),
        backgroundColor: const Color(0XFFFFFFFF),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15, top: 15, bottom: 10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Đặt lại mật khẩu",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                    height: 1.2,
                    color: Color(0XFF0066FF),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                    top: 20, left: 15, right: 15, bottom: 10),
                child: const Text(
                  "Đặt mật khẩu mới cho tài khoản của bạn để bạn có thể tiếp tục đăng nhập trên ứng dụng.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0XFF242A37)),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: const Text(
                  "Mật khẩu mới",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0XFF242A37)),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
                child: TextFormField(
                  controller: txtPassword,
                  obscureText: checkPass ? true : false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Mật khẩu không được bỏ trống";
                    } else if (value.length < 6) {
                      return "Mật khẩu tối thiểu 6 ký tự";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0XFFB9B9B9)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0XFF0066FF)),
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
                    hintText: "Nhập mật khẩu mới",
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: const Text(
                  "Xác nhận mật khẩu",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0XFF242A37)),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
                child: TextFormField(
                  controller: txtPassword2,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Xác nhận mật khẩu không được bỏ trống";
                    } else if (value != txtPassword.text) {
                      return "Mật khẩu không trùng khớp";
                    } else {
                      return null;
                    }
                  },
                  obscureText: checkPass ? true : false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0XFFB9B9B9)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0XFF0066FF)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {});
                        checkPass2 = !checkPass2;
                      },
                      icon: checkPass2
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
                    hintText: "Nhập lại mật khẩu mới",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
                width: 374,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0XFF0066FF)),
                child: TextButton(
                  onPressed: () {
                    _resetPassword();
                  },
                  child: const Text(
                    "Đặt lại mật khẩu",
                    style: TextStyle(
                        color: Colors.white,
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
