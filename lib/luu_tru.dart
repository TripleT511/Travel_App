import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vietnam_travel_app/trang_ca_nhan.dart';

import 'chitiet_luu_tru.dart';

class LuuTru extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LuuTruState();
  }
}

class LuuTruState extends State<LuuTru> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Image.asset(
                        'images/logo-ver3.png',
                        width: 95,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => trang_ca_nhan()));
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          image: const DecorationImage(
                            image: AssetImage('images/a.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50.0)),
                          border: Border.all(
                            color: const Color(0XFFE40158),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                    border: Border.fromBorderSide(
                        BorderSide(width: 0.5, color: Colors.grey))),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: Text(
                  "Lưu Trú" + " - Hồ Chí Minh",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF0869E1)),
                ),
              ),
            ],
          ),

          // 1 Lưu trú
          Container(
            padding: EdgeInsets.only(left: 20, bottom: 20, top: 15, right: 20),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(20), topEnd: Radius.circular(20)),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => chitiet_luutru()));
              },
              child: Column(
                children: [
                  // Hình ảnh
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(20),
                            topEnd: Radius.circular(20))),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      "images/luutru.jpg",
                      width: double.maxFinite,
                    ),
                  ),
                  //  Tên lưu trú
                  Container(
                    padding: EdgeInsets.only(left: 15, bottom: 0, top: 0),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            "Khách Sạn Wano",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //  Địa chỉ
                  Container(
                    padding: EdgeInsets.only(left: 15, top: 0, bottom: 0),
                    child: TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.place),
                            Text(
                              "65, Huỳnh Thúc Kháng, P.Bến Nghé, Q.1, Tp.HCM",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0XFF050505),
                              ),
                            )
                          ],
                        )),
                  ),
                  // Expanded(
                  //   child: SizedBox(),
                  // ),
                  // Thời Gian hoạt động
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 0, bottom: 0),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.access_time_outlined),
                          Text(
                            "12 a.m - 10 p.m",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0XFF050505),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Line
          Container(
            margin: const EdgeInsets.only(top: 5),
            decoration: const BoxDecoration(
                border: Border.fromBorderSide(
                    BorderSide(width: 0.5, color: Color(0XFFB9B9B9)))),
          ),

          // 1 Lưu trú
          Container(
            padding: EdgeInsets.only(left: 20, bottom: 20, top: 15, right: 20),
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => chitiet_luutru()));
              },
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(20),
                            topEnd: Radius.circular(20))),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      "images/luutru.jpg",
                      width: double.maxFinite,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, bottom: 0, top: 0),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            "Khách Sạn Wano",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, top: 0, bottom: 0),
                    child: TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.place),
                            Text(
                              "65, Huỳnh Thúc Kháng, P.Bến Nghé, Q.1, Tp.HCM",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0XFF050505),
                              ),
                            )
                          ],
                        )),
                  ),
                  // Expanded(
                  //   child: SizedBox(),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 0, bottom: 0),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.access_time_outlined),
                          Text(
                            "12 a.m - 10 p.m",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0XFF050505),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
