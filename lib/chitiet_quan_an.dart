import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RestaurantDetail extends StatefulWidget {
  const RestaurantDetail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RestaurantDetailState();
  }
}

class RestaurantDetailState extends State<RestaurantDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0X1A050505),
        elevation: 0,
        leading: null,
        leadingWidth: 0,
        titleSpacing: 0,
        title: TextButton(
          onPressed: () {},
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "images/chitietquanan.jpg",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 232,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 130, 10),
              child: const Text(
                "Nhà Hàng Cơm Niêu Thiên Lý",
                style: TextStyle(
                    fontFamily: 'Roboto',
                    height: 1.6,
                    fontSize: 22,
                    color: Color(0XFF0869E1),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 50, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 18,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 10),
                    child: const FaIcon(
                      FontAwesomeIcons.mapMarkerAlt,
                      size: 18,
                      color: Color(0XFFFF3535),
                    ),
                  ),
                  const Flexible(
                    child: Text(
                      "16 Nguyễn Đình Chiểu,  Quận 1, TP. HCM",
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: Color(0XFF050505),
                          height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 50, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 18,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 10),
                    child: const FaIcon(
                      FontAwesomeIcons.clock,
                      size: 18,
                      color: Color(0XFF3EFF7F),
                    ),
                  ),
                  const Flexible(
                    child: Text(
                      "10h00 – 21h00",
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: Color(0XFF050505),
                          height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 50, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 18,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 10),
                    child: const FaIcon(
                      FontAwesomeIcons.phoneAlt,
                      size: 18,
                      color: Color(0XFF0869E1),
                    ),
                  ),
                  const Flexible(
                    child: Text(
                      "10 a.m – 21 p.m",
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: Color(0XFF050505),
                          height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: const Text(
                "Mô tả",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  height: 1.5,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF050505),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: const Flexible(
                child: Text(
                  "Cơm Niêu Thiên Lý - 74 Nguyễn Thị Thập nằm trong chuỗi nhà hàng chuyên Cơm Niêu nổi tiếng ở Sài Gòn, là điểm đến thú vị để thực khách có những bữa ăn ngon miệng cùng giây phút ấm cúng, quây quần bên nhau. Tại Cơm Niêu Thiên Lý, có những niêu cơm nhỏ xinh, cơm cháy vàng giòn mang phong vị Singapore đặc sắc, được dùng kèm với các món mặn truyền thống Việt Nam như cá kho, thịt heo luộc, cà pháo… đã chinh phục trái tim hàng nghìn thực khách.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
                  child: SizedBox(
                    height: 195,
                    width: double.infinity,
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
                            width: double.infinity,
                            height: 132,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            child: const Text(
                              "Tôm Khỏa Thân",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                color: Color(0XFF050505),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
                  child: SizedBox(
                    height: 195,
                    width: double.infinity,
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
                            width: double.infinity,
                            height: 132,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            child: const Text(
                              "Canh chua",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                color: Color(0XFF050505),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
