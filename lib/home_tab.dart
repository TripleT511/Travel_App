import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/Models/diadanh_object.dart';
import 'package:vietnam_travel_app/Models/nhucau_object.dart';
import 'package:vietnam_travel_app/Models/tinhthanh_object.dart';
import 'package:vietnam_travel_app/Models/user_object.dart';
import 'package:vietnam_travel_app/Providers/diadanh_provider.dart';
import 'package:vietnam_travel_app/Providers/nhucau_provider.dart';
import 'package:vietnam_travel_app/Providers/tinhthanh_provider.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';
import 'package:vietnam_travel_app/baiviet_noibat.dart';
import 'package:vietnam_travel_app/chitiet_dia_danh.dart';
import 'package:vietnam_travel_app/create_post.dart';
import 'package:vietnam_travel_app/dia_danh.dart';
import 'package:vietnam_travel_app/main.dart';
import 'package:vietnam_travel_app/nhu_cau.dart';
import 'package:vietnam_travel_app/personal_page.dart';
import 'package:vietnam_travel_app/chitiet_nhu_cau.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final List<Column> imgListDiaDanh = [];
  final List<Column> imgListBaiViet = [];
  final List<Column> imgListNhuCau = [];

  List<NhuCauObject> lstNC = [];
  List<DiaDanhObject> lstDD = [];
  String urlImg = 'https://shielded-lowlands-87962.herokuapp.com/';
  @override
  void initState() {
    super.initState();

    loadListDiaDanh();
    loadListNhuCau();
    loadListBaiViet();
  }

  void loadListDiaDanh() async {
    final data = await DiaDanhProvider.getAllDiaDanh();
    setState(() {});
    lstDD = data;
    int b = lstDD.length;
    for (int i = 0; i < b; i++) {
      Column a = Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PlaceDetail()));
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Card(
                  elevation: 3.0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.all(
                      Radius.circular(16),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    urlImg + lstDD[i].hinhanh.hinhAnh,
                    /*a.image*/
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
                        child: Text(
                          lstDD[i].tenDiaDanh,
                          style: const TextStyle(
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
          ),
        ],
      );
      imgListDiaDanh.add(a);
    }
  }

  void loadListBaiViet() {
    int b = 5;
    for (int i = 0; i < b; i++) {
      Column a = Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SizedBox(
              height: 215,
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
                      "images/j.jpg",
                      width: 271,
                      height: 132,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 10, bottom: 10, right: 10),
                      alignment: Alignment.centerLeft,
                      child: const Text(
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
                    Container(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 0),
                                child: const Icon(
                                  Icons.thumb_up,
                                  color: Color(0XFF0869E1),
                                  size: 18,
                                ),
                              ),
                              const Text(
                                " 5.6k",
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
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: const FaIcon(
                                  FontAwesomeIcons.solidEye,
                                  color: Color(0XFF3EFF7F),
                                  size: 18,
                                ),
                              ),
                              const Text(
                                " 6.1k",
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: const FaIcon(
                                  FontAwesomeIcons.mapMarkerAlt,
                                  color: Color(0XFFFF3535),
                                  size: 18,
                                ),
                              ),
                              const Text(
                                " Nha Trang",
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      );
      imgListBaiViet.add(a);
    }
  }

  void loadListNhuCau() async {
    final data = await NhuCauProvider.getAllNhuCau();
    setState(() {});
    lstNC = data;
    int b = lstNC.length;
    for (int i = 0; i < b; i++) {
      Column a = Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChiTietNhuCau()));
            },
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(1.0),
                borderRadius: BorderRadius.circular(16),
              ),
              padding:
                  const EdgeInsets.only(left: 22, top: 7, right: 22, bottom: 7),
              child: Text(
                lstNC[i].tenNhuCau,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          // FutureBuilder(
          //   future: NhuCauProvider.getAllNhuCau(),
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {
          //     if (snapshot.hasError) {
          //       return Center(
          //         child: Text('Có lỗi xảy ra!!!'),
          //       );
          //     } else if (snapshot.hasData) {
          //        List<NhuCauObject> lstNhuCaus = snapshot.data!;
          //       return ListView.builder(
          //         // scrollDirection: Axis.vertical,
          //         shrinkWrap: true,
          //         itemCount: snapshot.data.length,
          //         itemBuilder: (context, index) => MaterialButton(
          //           onPressed: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => const ChiTietNhuCau()));
          //           },
          //           child: Container(
          //             decoration: BoxDecoration(
          //               color: const Color(0XFF0869E1),
          //               borderRadius: BorderRadius.circular(16),
          //             ),
          //             padding: const EdgeInsets.only(
          //                 left: 22, top: 7, right: 22, bottom: 7),
          //             child: Text(
          //               lstNhuCaus[index].tenNhuCau,
          //               style: TextStyle(
          //                 color: Colors.white,
          //                 fontFamily: 'Roboto',
          //                 fontWeight: FontWeight.w500,
          //                 fontSize: 16,
          //               ),
          //             ),
          //           ),
          //         ),
          //       );
          //     }
          //     return Center(
          //       child: CircularProgressIndicator(),
          //     );
          //   },
          // ),
        ],
      );
      imgListNhuCau.add(a);
    }
  }

  @override
  Widget build(BuildContext context) {
    CarouselSlider slideShow(List<Column> lst) {
      return CarouselSlider(
        items: lst,
        options: CarouselOptions(
            viewportFraction: 0.7,
            height: 230.0,
            autoPlay: false,
            enableInfiniteScroll: true),
      );
    }

    CarouselSlider slideShowBaiviet(List<Column> lst) {
      return CarouselSlider(
        items: lst,
        options: CarouselOptions(
            viewportFraction: 0.7,
            height: 215.0,
            autoPlay: false,
            enableInfiniteScroll: true),
      );
    }

    CarouselSlider slideShowNhuCau(List<Column> lst) {
      return CarouselSlider(
        items: lst,
        options: CarouselOptions(
            viewportFraction: 0.5,
            height: 55,
            autoPlay: false,
            enableInfiniteScroll: true),
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
                if (title == "Nhu Cầu") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NhuCauPage()));
                }
                if (title == "Địa Danh Nổi Bật") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Place()));
                }
                if (title == "Bài Viết Nổi Bật") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BaiVietNoiBatPage()));
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
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyApp()));
              },
              child: Container(
                margin: const EdgeInsets.only(left: 5),
                width: 95,
                child: Image.asset("images/logo-ver3.png"),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PersonalPage()));
              },
              child: Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.only(right: 5),
                child: FutureBuilder<UserObject>(
                  future: UserProvider.getUser(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      UserObject user = snapshot.data!;
                      return CircleAvatar(
                        backgroundColor: Color(
                                (math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0),
                        child: Text(
                          user.hoTen.substring(0, 1).toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
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
                                builder: (context) => const CreatePost(),
                              ),
                            );
                          },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Chia sẻ địa danh lên hệ thống...",
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
                  slideShowBaiviet(imgListBaiViet),
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
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Bài Viết",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0XFF050505),
                          fontWeight: FontWeight.w500),
                    ),
                  )),
              ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PersonalPage()));
                          },
                          leading: CircleAvatar(
                            backgroundColor: Color(
                                    (math.Random().nextDouble() * 0xFFFFFF)
                                        .toInt())
                                .withOpacity(1.0),
                            child: Text(
                              'Phuc Nguyen'.substring(0, 1).toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                          width: 392,
                          fit: BoxFit.cover,
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 10, bottom: 5, left: 10),
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
                                padding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 5),
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
                          padding: const EdgeInsets.only(
                              left: 10, bottom: 10, right: 10),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                        icon: const Icon(
                                            Icons.thumb_down_outlined,
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
                    );
                  }),
            ],
          )
        ],
      ),
    );
  }
}
