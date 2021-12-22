import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class chitiet_luutru extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return chitiet_luutruState();
  }
}

class chitiet_luutruState extends State<chitiet_luutru> {
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
          children: [],
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
              child: Text("Nhà Hàng ABC", style: TextStyle(fontSize: 18)),
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
  final List<Column> imgListLuuTru = [
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
              child: Text("Khách Sạn Wano"),
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
              "Khách Sạn Wano",
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
              TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.access_time_outlined),
                      Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Text("10 a.m - 11 p.m"))
                    ],
                  )),
              TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.call_outlined),
                      Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Text("0123456789"))
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
            child: Text(
              "Hotel Continental Saigon (tên tiếng Việt là Khách sạn Hoàn Cầu) có vị trí rất thuận tiện, tọa lạc ngay giữa trung tâm thành phố Hồ Chí Minh. Từ đây, du khách có thể đi bộ đến các điểm vui chơi giải trí, các điểm tổ chức lễ hội, sự kiện và các nơi giao dịch công việc như Nhà hát Thành Phố, Dinh Độc Lập, Nhà thờ Đức Bà, Chợ Bến Thành..." +
                  "Được xây dựng từ 1878, Hotel Continental ngày nay vẫn giữ được nét cổ điển, song hành với những tòa nhà từ thời xưa ở Sài Gòn như Nhà Hát Thành Phố, Nhà Thờ Đức Bà, Ủy Ban Nhân Dân Thành Phố Hồ Chí Minh đi tới tương lai. Trên con đường Đồng Khởi luôn nhộn nhịp, Hotel Continental vẫn giữ cho mình giáng vẻ uy nghi cổ kính từ thuở ban đầu. Bên trong tòa nhà tráng lệ đó, một thế hệ mới nhân viên khách sạn ngày đêm tận tâm, đầy nhiệt huyết hết lòng phục vụ lữ khách gần xa những ngày lưu trú thư giãn tuyệt vời và những kỷ niệm đầy lưu luyến khi họ đến với thành phố Hồ Chí Minh.",
              style: TextStyle(fontSize: 18, height: 1.2),
            ),
          ),
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
          slideShow(imgListLuuTru),
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
