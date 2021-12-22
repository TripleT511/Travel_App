import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class form_change_pass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return form_change_passState();
  }
}

class form_change_passState extends State<form_change_pass> {
  bool check = true;
  bool checkOldPass = true;
  bool checkNewPass = true;
  bool checkReNewPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Color(0XFF0869E1),
                )),
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            title: Container(
              margin: EdgeInsets.only(left: 75),
              child: Text(
                "Đổi mật khẩu",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF0869E1)),
              ),
            )),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 10, left: 15),
                  child: Text(
                    "Mật khẩu cũ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, bottom: 15, right: 15),
                  child: TextField(
                    obscureText: checkOldPass ? true : false,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {});
                          checkOldPass = !checkOldPass;
                        },
                        icon: checkOldPass
                            ? Icon(
                                Icons.visibility_off,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.black,
                              ),
                      ),
                      hintText: "Nhập mật khẩu cũ",
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 10, left: 15),
                  child: Text(
                    "Mật khẩu mới",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, bottom: 15, right: 15),
                  child: TextField(
                    obscureText: checkNewPass ? true : false,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {});
                          checkNewPass = !checkNewPass;
                        },
                        icon: checkNewPass
                            ? Icon(
                                Icons.visibility_off,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.black,
                              ),
                      ),
                      hintText: "Nhập mật khẩu mới",
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 10, left: 15),
                  child: Text(
                    "Xác nhận mật khẩu",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, bottom: 15, right: 15),
                  child: TextField(
                    obscureText: checkReNewPass ? true : false,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {});
                          checkReNewPass = !checkReNewPass;
                        },
                        icon: checkReNewPass
                            ? Icon(
                                Icons.visibility_off,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.black,
                              ),
                      ),
                      hintText: "Nhập lại mật khẩu mới",
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Nhớ mật khẩu ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {});
                          check = !check;
                        },
                        icon: check
                            ? Icon(
                                Icons.check_box,
                                color: Color(0XFF0869E1),
                              )
                            : Icon(
                                Icons.check_box_outline_blank,
                                color: Color(0XFF0869E1),
                              )),
                    Expanded(child: Container()),
                    Container(
                      padding: EdgeInsets.only(right: 5),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Quên tài khoản ?",
                            style: TextStyle(color: Color(0XFF0869E1)),
                          )),
                    )
                  ],
                ),
                Container(
                  width: 360,
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0XFF0869E1)),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Cập nhật mật khẩu",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  width: 360,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Huỷ",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
