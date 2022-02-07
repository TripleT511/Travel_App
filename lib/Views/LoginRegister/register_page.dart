import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';
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

  TextEditingController txtHoTen = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtPassword2 = TextEditingController();
  TextEditingController txtSoDienThoai = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void _register() async {
    if (formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Vui lòng đợi...');
      bool isRegister = await UserProvider.register(
          txtHoTen.text, txtEmail.text, txtPassword.text, txtSoDienThoai.text);

      if (isRegister) {
        EasyLoading.showSuccess('Đăng ký thành công!\nVui lòng đăng nhập');
        EasyLoading.dismiss();
        Navigator.pop(context);
      } else {
        EasyLoading.showError(
            'Đăng ký thất bại!\nVui lòng kiểm tra lại thông tin');
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
            size: 20,
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
                  "Đăng ký",
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
                  "Họ tên",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0XFF242A37)),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
                child: TextFormField(
                  controller: txtHoTen,
                  decoration: InputDecoration(
                    hintText: "Nhập họ tên",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0XFFB1BCD0)),
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
                      return "Họ tên không được bỏ trống";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: const Text(
                  "Email",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0XFF242A37)),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
                child: TextFormField(
                  controller: txtEmail,
                  decoration: InputDecoration(
                    hintText: "Nhập email",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0XFFB1BCD0)),
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
                      return "Email không được bỏ trống";
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return "Email không hợp lệ";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: const Text(
                  "Số điện thoại",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0XFF242A37)),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
                child: TextFormField(
                  controller: txtSoDienThoai,
                  decoration: InputDecoration(
                    hintText: "Nhập số điện thoại",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0XFFB1BCD0)),
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
                      return "Số điện thoại không được bỏ trống";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: const Text(
                  "Mật khẩu",
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
                          const BorderSide(width: 1, color: Color(0XFFB1BCD0)),
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
                    hintText: "Nhập mật khẩu",
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
                  obscureText: checkPass2 ? true : false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Xác nhận mật khẩu không được bỏ trống";
                    } else if (value.length < 6) {
                      return "Mật khẩu tối thiểu 6 ký tự";
                    } else if (value != txtPassword.text) {
                      return "Mật khẩu không trùng khớp";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0XFFB1BCD0)),
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
                    hintText: "Nhập lại mật khẩu",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
                width: 374,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0XFF0066FF)),
                child: TextButton(
                  onPressed: () {
                    _register();
                  },
                  child: const Text(
                    "Tạo tài khoản",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 40),
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
                          color: Color(0XFF0066FF),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
