import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_p/main.dart';

class form_login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return form_loginState();
  }
}

class form_loginState extends State<form_login> {
  bool check = true;
  bool checkPass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: Color(0XFF0869E1),
              )),
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          title: Container(
            margin: EdgeInsets.only(left: 75),
            child: Text(
              "Đăng nhập",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF0869E1)),
            ),
          )),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 50, left: 15),
            child: Text(
              "Email",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, bottom: 15, right: 15),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Nhập email",
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 10, left: 15),
            child: Text(
              "Mật khẩu",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, bottom: 15, right: 15),
            child: TextField(
              obscureText: checkPass ? true : false,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {});
                    checkPass = !checkPass;
                  },
                  icon: checkPass
                      ? Icon(
                          Icons.visibility_off,
                          color: Colors.black,
                        )
                      : Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.black,
                        ),
                ),
                hintText: "Nhập mật khẩu",
              ),
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Nhớ mật khẩu ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0XFF0869E1)),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
              child: Text(
                "Đăng Nhập",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
