import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ChiTietLuuTru extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChiTietLuuTruState();
  }
}

class ChiTietLuuTruState extends State<ChiTietLuuTru> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Image.asset(
            "images/luutru.jpg",
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 25),
            child: Expanded(
              child: Text(
                "Hotel Continental Saigon",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                  color: Color(0XFF0869E1),
                ),
                softWrap: true,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(18, 20, 0, 10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.place_outlined,
                          color: Color(0XFF0869E1),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "132 - 134 Đồng Khởi, Quận 1, Tp. Hồ Chí Minh",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0XFF000000),
                          ),
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        color: Color(0XFF0869E1),
                      ),
                      Text(
                        " " + "10 a.m - 11 p.m",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0XFF000000),
                        ),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 15, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.call_outlined,
                            color: Color(0XFF0869E1),
                          ),
                          Text(
                            " " + "0123456789",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0XFF000000),
                            ),
                            softWrap: true,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "VND ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0XFF0869E1),
                            ),
                            softWrap: true,
                          ),
                          Text(
                            "500.000",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0XFFFF4F4F),
                            ),
                            softWrap: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, bottom: 15),
            child: Text(
              "Mô tả",
              style: TextStyle(
                  height: 1.5, fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Text(
              "Hotel Continental Saigon (tên tiếng Việt là Khách sạn Hoàn Cầu) có vị trí rất thuận tiện, tọa lạc ngay giữa trung tâm thành phố Hồ Chí Minh. Từ đây, du khách có thể đi bộ đến các điểm vui chơi giải trí, các điểm tổ chức lễ hội, sự kiện và các nơi giao dịch công việc như Nhà hát Thành Phố, Dinh Độc Lập, Nhà thờ Đức Bà, Chợ Bến Thành..." +
                  "Được xây dựng từ 1878, Hotel Continental ngày nay vẫn giữ được nét cổ điển, song hành với những tòa nhà từ thời xưa ở Sài Gòn như Nhà Hát Thành Phố, Nhà Thờ Đức Bà, Ủy Ban Nhân Dân Thành Phố Hồ Chí Minh đi tới tương lai. Trên con đường Đồng Khởi luôn nhộn nhịp, Hotel Continental vẫn giữ cho mình giáng vẻ uy nghi cổ kính từ thuở ban đầu. Bên trong tòa nhà tráng lệ đó, một thế hệ mới nhân viên khách sạn ngày đêm tận tâm, đầy nhiệt huyết hết lòng phục vụ lữ khách gần xa những ngày lưu trú thư giãn tuyệt vời và những kỷ niệm đầy lưu luyến khi họ đến với thành phố Hồ Chí Minh.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 16, height: 1.2, fontWeight: FontWeight.w400),
            ),
          ),
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
