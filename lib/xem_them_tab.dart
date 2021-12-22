import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_p/create_post.dart';
import 'package:travel_p/de_xuat_dia_danh.dart';
import 'package:travel_p/form_app.dart';

class xem_them extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return xem_themState();
  }
}

class xem_themState extends State<xem_them> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          title: Container(
            margin: EdgeInsets.only(left: (65)),
            child: Text(
              "Xem thêm",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF0869E1)),
            ),
          )),
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => de_xuat_dia_danh()));
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: 350,
                    height: 50,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.grey.shade300)),
                    child: Text("Đề xuất địa danh lên hệ thống"),
                  )),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 360,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0XFF0869E1)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => form_app()));
                  },
                  child: Text(
                    "Đăng Xuất",
                    style: TextStyle(color: Color(0XFF0869E1), fontSize: 20),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
