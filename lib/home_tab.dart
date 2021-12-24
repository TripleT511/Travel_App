import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/chitiet_luu_tru.dart';
import 'package:vietnam_travel_app/create_post.dart';
import 'package:vietnam_travel_app/dia_danh.dart';
import 'package:vietnam_travel_app/luu_tru.dart';
import 'package:vietnam_travel_app/nhu_cau.dart';
import 'package:vietnam_travel_app/quan_an.dart';
import 'package:vietnam_travel_app/trang_ca_nhan.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final scroll = ScrollController();
    final List<Column> imgListDiaDanh = [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.all(
                    Radius.circular(16),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  "images/slide_1.jpg",
                  width: double.maxFinite,
                  height: 210,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 185,
                left: 20,
                child: Row(
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.mapMarkerAlt,
                      color: Color(0XFFFF3535),
                      size: 18,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 5),
                      child: const Text(
                        "Nha Trang",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ];
    final List<Column> imgListNhuCau = [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: const Color(0XFF0869E1),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              "Tắm biển",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: Color(0XFF0869E1),
              ),
            ),
          ),
        ],
      ),
    ];
    final List<Expanded> imgListQuanAn = [
      Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(16))),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                "images/z.jpg",
                width: double.maxFinite,
              ),
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
      ))
    ];
    final List<Expanded> imgListBaiViet = [
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(16.0),
                  topEnd: Radius.circular(16.0),
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                "images/z.jpg",
                width: double.maxFinite,
                height: 132,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: const Expanded(
                child: Text(
                  "Check-in điểm du lịch ",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF050505),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.thumb_up,
                        color: Color(0XFF0869E1),
                      ),
                    ),
                    const Text(
                      "5.6k",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        color: Color(0XFF050505),
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.solidEye,
                        color: Color(0XFF3EFF7F),
                        size: 18,
                      ),
                    ),
                    const Text(
                      "6.1k",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        color: Color(0XFF050505),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.mapMarkerAlt,
                        color: Color(0XFFFF3535),
                        size: 18,
                      ),
                    ),
                    const Text(
                      "Nha Trang",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        color: Color(0XFF050505),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ];
    final List<Expanded> imgListLuuTru = [
      Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              child: TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => chitiet_luutru()));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(16))),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                "images/z.jpg",
                width: double.maxFinite,
              ),
            ),
          )),
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
      ))
    ];
    CarouselSlider slideShow(List<Column> lst) {
      return CarouselSlider(
        items: lst,
        options: CarouselOptions(
            height: 220.0, autoPlay: false, enableInfiniteScroll: true),
      );
    }

    CarouselSlider slideShowNhuCau(List<Column> lst) {
      return CarouselSlider(
        items: lst,
        options: CarouselOptions(
            height: 260.0, autoPlay: false, enableInfiniteScroll: true),
      );
    }

    CarouselSlider slideShowQuan(List<Expanded> lst) {
      return CarouselSlider(
        items: lst,
        options: CarouselOptions(
            height: 260.0, autoPlay: false, enableInfiniteScroll: true),
      );
    }

    Row sliderTitle(String title) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0XFF050505),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: TextButton(
              onPressed: () {
                if (title == "Quán Ăn") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => quan_an()));
                }
                if (title == "Lưu Trú") {
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
              child: const Text(
                "Xem thêm",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0XFF0869E1),
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: null,
        leadingWidth: 0,
        titleSpacing: 0,
        elevation: 1.5,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Container(
                margin: const EdgeInsets.only(left: 5),
                width: 95,
                child: Image.asset("images/logo-ver3.png"),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                margin: const EdgeInsets.only(right: 5),
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xff7c94b6),
                  image: DecorationImage(
                    image: AssetImage('images/avatar.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        controller: scroll,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xff7c94b6),
                      image: DecorationImage(
                        image: AssetImage('images/avatar.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    width: 280,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color(0XFFB9B9B9),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => create_post(),
                          ),
                        );
                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Chia sẻ địa danh...",
                          style: TextStyle(
                            color: Color(0XFF050505),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                decoration: const BoxDecoration(
                  border: Border.fromBorderSide(
                    BorderSide(
                      width: 0.5,
                      color: Color(0XFFD2D4D8),
                    ),
                  ),
                ),
              ),
              sliderTitle("Địa Danh Nổi Bật"),
              slideShow(imgListDiaDanh),
              sliderTitle("Bài Viết Nổi Bật"),
              // slideShowQuan(imgListBaiViet),
              sliderTitle("Nhu Cầu"),
              slideShowNhuCau(imgListNhuCau),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 0.5, color: Color(0XFFB9B9B9)),
                bottom: BorderSide(width: 0.5, color: Color(0XFFB9B9B9)),
              ),
            ),
            child: const Text(
              "Bài Viết",
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0XFF050505),
                  fontWeight: FontWeight.w500),
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage("images/avatar.jpg"),
            ),
            title: const Text(
              "Phuc Nguyen",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
                fontSize: 16,
              ),
            ),
            subtitle: const Align(
              alignment: Alignment.centerLeft,
              child: Text("23-12-2021"),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.ellipsisH,
                size: 18,
              ),
            ),
          ),
          Image.asset(
            "images/slide_1.jpg",
            height: 240,
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 5, left: 10),
            child: Text(
              "Hạ Long Bay is a UNESCO World Heritage Site and popular travel destination in Quảng Ninh Province, Vietnam",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                color: Color(0XFF050505),
                height: 1.4,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: TextButton(
              onPressed: () {},
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color(0XFF0869E1),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    "Ho Chi Minh City, Viet Nam",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0XFF0869E1),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.solidEye,
                      color: Color(0XFF65676B),
                      size: 18,
                    ),
                    Text(
                      " 10k lượt xem",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0XFF65676B),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        "1.2k lượt thích",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0XFF65676B),
                        ),
                      ),
                      Text(
                        "56 lượt không thích",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0XFF65676B),
                        ),
                      ),
                    ]),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: const BoxDecoration(
                    border: Border.fromBorderSide(
                      BorderSide(
                        width: 0.5,
                        color: Color(0XFFD2D4D8),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.thumb_up,
                            color: Color(0XFF0869E1),
                          ),
                        ),
                        const Text(
                          "Thích",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0XFF65676B),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.thumb_down_outlined,
                              color: Colors.grey),
                        ),
                        const Text(
                          "Không thích",
                          style: TextStyle(
                            color: Color(0XFF65676B),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border.fromBorderSide(
                      BorderSide(
                        width: 0.5,
                        color: Color(0XFFD2D4D8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          const double start = 0;
          scroll.animateTo(start,
              duration: const Duration(seconds: 1), curve: Curves.easeIn);
        },
        backgroundColor: const Color(0XFF0869E1),
        child: const FaIcon(
          FontAwesomeIcons.arrowUp,
          color: Colors.white,
        ),
      ),
    );
  }
}
