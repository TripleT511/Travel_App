import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ChangePasswordPageState();
  }
}

class ChangePasswordPageState extends State<ChangePasswordPage> {
  bool checkPass = true;
  bool checkPass2 = true;
  bool checkPass3 = true;

  TextEditingController txtCurrent = TextEditingController();
  TextEditingController txtnewPass = TextEditingController();
  TextEditingController txtconfirmPass = TextEditingController();
  final formKey = GlobalKey<FormState>();
  _loadData() async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    setState(() {});
    txtCurrent.text = (pres.getString('password') ?? '');
  }

  void _changePassword() async {
    if (formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Vui lòng đợi...');
      bool isChange = await UserProvider.changePassword(
          txtCurrent.text, txtnewPass.text, txtconfirmPass.text);

      if (isChange) {
        SharedPreferences pres = await SharedPreferences.getInstance();
        pres.setString('password', txtnewPass.text);
        EasyLoading.showSuccess('Đổi mật khẩu thành công');
        EasyLoading.dismiss();
        Navigator.pop(context);
      } else {
        EasyLoading.showError('Đổi mật khẩu thất bại');
        EasyLoading.dismiss();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 1.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Color(0XFF242A37),
            size: 21,
          ),
        ),
        backgroundColor: const Color(0XFFFFFFFF),
        shadowColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Đổi mật khẩu",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: 'Roboto',
            color: Color(0XFF242A37),
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(
                  top: 20, left: 15, right: 15, bottom: 10),
              child: const Text(
                "Mật khẩu hiện tại",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
              child: TextFormField(
                readOnly: true,
                controller: txtCurrent,
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
                  hintText: "Nhập mật khẩu hiện tại",
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: const Text(
                "Mật khẩu mới",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
              child: TextFormField(
                controller: txtnewPass,
                obscureText: checkPass2 ? true : false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Mật khẩu mới không được bỏ trống";
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
                  hintText: "Nhập mật khẩu mới",
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
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextFormField(
                controller: txtconfirmPass,
                obscureText: checkPass3 ? true : false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Xác nhận mật khẩu không được bỏ trống";
                  } else if (value != txtnewPass.text) {
                    return "Mật khẩu không trùng khớp";
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
                      checkPass3 = !checkPass3;
                    },
                    icon: checkPass3
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
              margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
              width: 374,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0XFF0066FF)),
              child: TextButton(
                onPressed: () {
                  _changePassword();
                },
                child: const Text(
                  "Đổi mật khẩu",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
              width: 374,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0XFFE4E6EB)),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Huỷ",
                  style: TextStyle(
                      color: Color(0XFF242A37),
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
