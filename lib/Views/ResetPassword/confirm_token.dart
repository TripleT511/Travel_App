import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';
import 'package:vietnam_travel_app/Views/ResetPassword/reset_password.dart';

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

  StreamController<ErrorAnimationType>? errorController;
  bool hasError = false;
  final formKey = GlobalKey<FormState>();
  bool isCompleted = false;

  void _sendEmail() async {
    EasyLoading.show(status: 'Đang kiểm tra...');
    bool isSuccess =
        await UserProvider.confirmToken(txtCode.text.toUpperCase());
    if (isSuccess) {
      EasyLoading.showSuccess('Xác nhận thành công');
      EasyLoading.dismiss();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResetPasswordPage(
            token: txtCode.text,
          ),
        ),
      );
    } else {
      EasyLoading.showError('Xác nhận thất bại');
      EasyLoading.dismiss();
    }
  }

  @override
  void initState() {
    super.initState();
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
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
            size: 20,
          ),
        ),
        backgroundColor: const Color(0XFFFFFFFF),
      ),
      body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15, top: 15, bottom: 10),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Mã xác minh",
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
                    "Nhập mã xác minh gồm 6 chữ số mà chúng tôi đã gửi cho bạn qua email.",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 1.5,
                        color: Color(0XFF242A37)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 100, left: 15, bottom: 10, right: 15),
                  child: PinCodeTextField(
                    textCapitalization: TextCapitalization.characters,
                    appContext: context,
                    pastedTextStyle: const TextStyle(
                      color: Color(0XFF242A37),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    obscureText: true,
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (v!.length < 6) {
                        return "Mã xác minh không hợp lệ";
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 60,
                      fieldWidth: 45,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      activeColor: const Color(0XFF0066FF),
                      inactiveColor: const Color(0XFFB1BCD0),
                      selectedFillColor: Colors.white,
                      selectedColor: const Color(0XFF0066FF),
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    errorAnimationController: errorController,
                    controller: txtCode,
                    keyboardType: TextInputType.text,
                    backgroundColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        if (txtCode.text.length == 6) {
                          isCompleted = true;
                        } else {
                          isCompleted = false;
                        }
                      });
                    },
                    beforeTextPaste: (text) {
                      return true;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      bottom: 20, left: 15, right: 15, top: 20),
                  width: 374,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isCompleted
                          ? const Color(0XFF0066FF)
                          : const Color(0XFFB1BCD0)),
                  child: TextButton(
                    onPressed: () {
                      isCompleted ? _sendEmail() : null;
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
          )),
    );
  }
}
