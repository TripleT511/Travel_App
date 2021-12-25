import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChiTietQuanAn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChiTietQuanAnState();
  }
}

class ChiTietQuanAnState extends State<ChiTietQuanAn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Image.asset(
            "images/chitietquanan.jpg",
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 25),
            child: Expanded(
              child: Text(
                "Nhà Hàng Cơm Niêu Thiên Lý",
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
                          "16 Nguyễn Đình Chiểu,  Quận 1, TP. HCM",
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
                        " " + "10h00 – 21h00",
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
                  padding: EdgeInsets.only(bottom: 15),
                  child: Row(
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
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Cơm Niêu Thiên Lý - 74 Nguyễn Thị Thập nằm trong chuỗi nhà hàng chuyên Cơm Niêu nổi tiếng ở Sài Gòn, là điểm đến thú vị để thực khách có những bữa ăn ngon miệng cùng giây phút ấm cúng, quây quần bên nhau. Tại Cơm Niêu Thiên Lý, có những niêu cơm nhỏ xinh, cơm cháy vàng giòn mang phong vị Singapore đặc sắc, được dùng kèm với các món mặn truyền thống Việt Nam như cá kho, thịt heo luộc, cà pháo… đã chinh phục trái tim hàng nghìn thực khách.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 16, height: 1.2, fontWeight: FontWeight.w400),
            ),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 195,
                  width: 374,
                  child: Card(
                    elevation: 3.0,
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(16.0),
                        topEnd: Radius.circular(16.0),
                        bottomStart: Radius.circular(16.0),
                        bottomEnd: Radius.circular(16.0),
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "images/monan.jpg",
                          width: 374,
                          height: 132,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Tôm Khỏa Thân",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0XFF000000),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "500.000",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0XFFFF4F4F),
                                    ),
                                    softWrap: true,
                                  ),
                                  Text(
                                    " đ",
                                    style: TextStyle(
                                      fontSize: 12,
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
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 195,
                  width: 374,
                  child: Card(
                    elevation: 3.0,
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(16.0),
                        topEnd: Radius.circular(16.0),
                        bottomStart: Radius.circular(16.0),
                        bottomEnd: Radius.circular(16.0),
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "images/monan2.jpg",
                          width: 374,
                          height: 132,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Canh Chua Cá",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0XFF000000),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "120.000",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0XFFFF4F4F),
                                    ),
                                    softWrap: true,
                                  ),
                                  Text(
                                    " đ",
                                    style: TextStyle(
                                      fontSize: 12,
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
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
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
