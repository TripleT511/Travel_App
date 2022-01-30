import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';
import 'package:vietnam_travel_app/Views/ResetPassword/reset_password.dart';
import 'package:vietnam_travel_app/main.dart';

// ignore: must_be_immutable
class ConfirmTokenPage extends StatefulWidget {
  String email;
  ConfirmTokenPage({Key? key, required this.email}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return ConfirmTokenPageState(email);
  }
}

class ConfirmTokenPageState extends State<ConfirmTokenPage> {
  String email;
  ConfirmTokenPageState(this.email);
  TextEditingController txtCode = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void _sendEmail() async {
    if (formKey.currentState!.validate()) {
      bool isSuccess = await UserProvider.confirmToken(txtCode.text);

      if (isSuccess) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResetPasswordPage(
              token: txtCode.text,
            ),
          ),
        );
      } else {
        const snackBar = SnackBar(
            content: Text(
                'Có lỗi xảy ra, vui lòng kiểm tra lại toàn bộ thông tin.'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                  "Quên mật khẩu",
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
                  "Nhập mã xác nhận gồm 6 chữ số mà bạn vừa nhận được trong email của bạn.",
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
                  "Mã xác nhận",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0XFF242A37)),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
                child: TextFormField(
                  autofocus: true,
                  controller: txtCode,
                  decoration: InputDecoration(
                    hintText: "Nhập mã xác nhận",
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
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Mã xác nhận không được bỏ trống";
                    } else {
                      return null;
                    }
                  },
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
                    _sendEmail();
                  },
                  child: const Text(
                    "Tiếp tục",
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
