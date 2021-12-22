import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_p/main.dart';

class form_change_info extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return form_change_infoState();
  }
}

class form_change_infoState extends State<form_change_info> {
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
                    child: Row(
                      children: [
                        Text(
                          "Họ tên",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Expanded(child: Container()),
                        Container(
                            alignment: Alignment.center,
                            height: 35,
                            margin: EdgeInsets.only(right: 15),
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(7)),
                            child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Text(
                                      "Công khai",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                    Icon(Icons.keyboard_arrow_down)
                                  ],
                                ))),
                      ],
                    )),
                Container(
                  padding: EdgeInsets.only(left: 15, bottom: 15, right: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Nguyen Hoang Bao Phuc",
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 10, left: 15),
                    child: Row(
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Expanded(child: Container()),
                        Container(
                            alignment: Alignment.center,
                            height: 35,
                            margin: EdgeInsets.only(right: 15),
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(7)),
                            child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Text(
                                      "Chỉ mình tôi",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                    Icon(Icons.keyboard_arrow_down)
                                  ],
                                ))),
                      ],
                    )),
                Container(
                  padding: EdgeInsets.only(left: 15, bottom: 15, right: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "0306191060@caothang.edu.vn",
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 10, left: 15),
                    child: Row(
                      children: [
                        Text(
                          "Số điện thoại",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Expanded(child: Container()),
                        Container(
                            alignment: Alignment.center,
                            height: 35,
                            margin: EdgeInsets.only(right: 15),
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(7)),
                            child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Text(
                                      "Công khai",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                    Icon(Icons.keyboard_arrow_down)
                                  ],
                                ))),
                      ],
                    )),
                Container(
                  padding: EdgeInsets.only(left: 15, bottom: 15, right: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "0123456789",
                    ),
                  ),
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
                      "Cập nhật thông tin cá nhân",
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
