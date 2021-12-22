import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class chitiet_quan_an extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return chitiet_quan_anState();
  }
}

class chitiet_quan_anState extends State<chitiet_quan_an> {
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
              "Nhà Hàng Cơm\nNiêu Thiên Lý",
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
                        child: Text("16 Nguyễn Đình Chiểu,  Quận 1, TP. HCM"),
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
              "Cơm Niêu Thiên Lý - 74 Nguyễn Thị Thập nằm trong chuỗi nhà hàng chuyên Cơm Niêu nổi tiếng ở Sài Gòn, là điểm đến thú vị để thực khách có những bữa ăn ngon miệng cùng giây phút ấm cúng, quây quần bên nhau. Tại Cơm Niêu Thiên Lý, có những niêu cơm nhỏ xinh, cơm cháy vàng giòn mang phong vị Singapore đặc sắc, được dùng kèm với các món mặn truyền thống Việt Nam như cá kho, thịt heo luộc, cà pháo… đã chinh phục trái tim hàng nghìn thực khách.",
              style: TextStyle(fontSize: 18, height: 1.2),
            ),
          ),
          Column(
            children: [
              TextButton(
                  onPressed: () {},
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(20),
                                topEnd: Radius.circular(20))),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          "images/z.jpg",
                          width: double.maxFinite,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5, bottom: 10),
                        color: Colors.white,
                        width: 359,
                        child: Row(
                          children: [
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                "Tôm khoả thân",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                            ),
                            Expanded(child: Container()),
                            Container(
                              padding: EdgeInsets.only(right: 15),
                              child: Text(
                                "500.000 đ",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(20),
                                topEnd: Radius.circular(20))),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          "images/z.jpg",
                          width: double.maxFinite,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5, bottom: 10),
                        color: Colors.white,
                        width: 359,
                        child: Row(
                          children: [
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                "Tôm khoả thân",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                            ),
                            Expanded(child: Container()),
                            Container(
                              padding: EdgeInsets.only(right: 15),
                              child: Text(
                                "500.000 đ",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}
