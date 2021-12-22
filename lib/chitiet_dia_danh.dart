import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travel_p/quan_an.dart';

import 'dia_danh.dart';
import 'luu_tru.dart';
import 'nhu_cau.dart';

class chitiet_diadanh extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return chitiet_diadanhState();
  }
}

class chitiet_diadanhState extends State<chitiet_diadanh> {
  CarouselSlider slideShow(List<Column> lst) {
    return CarouselSlider(
      items: lst,
      options: CarouselOptions(
          height: 220.0, autoPlay: false, enableInfiniteScroll: true),
    );
  }

  Row sliderTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                title,
                style: TextStyle(
                    color: Color(0XFF0869E1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {
                if (title == "Quán ăn gần đây") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => quan_an()));
                }
                if (title == "Lưu trú gần đây") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => luu_tru()));
                }
                if (title == "Nhu Cầu") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => nhu_cau()));
                }
                if (title == "Địa Danh Nổi Bật") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => dia_danh()));
                }
              },
              child: Text(
                "Xem thêm",
                style: TextStyle(fontSize: 15, color: Color(0XFF0869E1)),
              ),
            )
          ],
        )
      ],
    );
  }

  final List<Column> imgListQuanAn = [
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Image.asset(
            "images/z.jpg",
            height: 150,
            width: 250,
            fit: BoxFit.cover,
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Text("Khách Sạn Wano", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [Icon(Icons.place), Text("Ho Chi Minh")],
                  )),
            ),
          ],
        )
      ],
    )
  ];
  final List<Column> imgListdiadanh = [
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Image.asset(
            "images/z.jpg",
            height: 150,
            width: 250,
            fit: BoxFit.cover,
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Text("Nhà hàng"),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [Icon(Icons.place), Text("Ho Chi Minh")],
                  )),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.access_time_outlined),
                      Text("12 a.m - 10 p.m")
                    ],
                  )),
            ),
          ],
        )
      ],
    )
  ];

  final scroll = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            child: Image.asset("images/z.jpg"),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              "InterCointinetal\nResidence Saigon",
              style: TextStyle(
                  height: 1.5,
                  fontSize: 20,
                  color: Color(0XFF0869E1),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: [
              TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.place_outlined),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                            "132 - 134 Đồng Khởi, Quận 1, Tp. Hồ Chí Minh"),
                      )
                    ],
                  )),
            ],
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              "Mô tả",
              style: TextStyle(
                  height: 1.5, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              padding: EdgeInsets.all(15),
              child: Flexible(
                child: Text(
                  "Intecontinental Residences Saigon tọa lạc tại vị trí thuận tiện tại Kumho Plaza, cách Tháp Sài Gòn, Trung tâm Thương mại Sài Gòn và các văn phòng lãnh sự nước ngoài một đoạn đi bộ. Chỉ mất 10 phút đi bộ nhàn nhã là đến công viên thành phố, sở thú và dinh Thống Nhất. InterContinental Residences Saigon cung cấp các dịch vụ và tiện ích dân cư cao cấp. Ngoài việc cung cấp tầm nhìn ra toàn cảnh thành phố từ các dinh thự, nó còn có câu lạc bộ sức khỏe và spa hạng nhất. Sống cuộc sống InterContinental tại địa chỉ hàng đầu Sài Gòn, nơi những cư dân quốc tế sành điệu có thể trải nghiệm cuộc sống đương đại đặc biệt trong khu phức hợp tích hợp tốt nhất thành phố.",
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.2,
                  ),
                ),
              )),
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              "Vị trí",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Image.asset("images/map-hotel.jpg"),
          ),
          SizedBox(
            height: 25,
          ),
          sliderTitle("Lưu trú gần đây"),
          SizedBox(
            height: 15,
          ),
          slideShow(imgListdiadanh),
          SizedBox(
            height: 25,
          ),
          sliderTitle("Quán ăn gần đây"),
          SizedBox(
            height: 15,
          ),
          slideShow(imgListQuanAn)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
