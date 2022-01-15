import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vietnam_travel_app/Models/diadanh_object.dart';
import 'package:vietnam_travel_app/Models/luutru_object.dart';
import 'package:vietnam_travel_app/Models/user_object.dart';
import 'package:vietnam_travel_app/Providers/luutru_provider.dart';
import 'package:vietnam_travel_app/Providers/quanan_provider.dart';
import 'package:vietnam_travel_app/chitiet_luu_tru.dart';
import 'package:vietnam_travel_app/luu_tru.dart';
import 'package:vietnam_travel_app/quan_an.dart';
import 'package:vietnam_travel_app/create_post.dart';

import 'Models/quanan_object.dart';
import 'chitiet_quan_an.dart';

// ignore: must_be_immutable
class PlaceDetail extends StatefulWidget {
  DiaDanhObject dd;
  PlaceDetail(this.dd, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return PlaceDetailState(dd);
  }
}

class PlaceDetailState extends State<PlaceDetail> {
  DiaDanhObject dd;
  PlaceDetailState(this.dd);
  late final UserObject user;
  List<QuanAnObject> lstQuan = [];
  List<LuuTruObject> lstLT = [];
  final List<SizedBox> imgDiaDanh = [];
  String urlImg = 'https://shielded-lowlands-87962.herokuapp.com/';
  _loadDiaDanh() async {
    // print(DiaDanhProvider.getDiaDanhById(1));
  }

  _loadQuanAn() async {
    final data = await QuanAnProvider.getAllQuanAnByDiaDanh(dd.id.toString());
    setState(() {});
    lstQuan = data;
  }

  _loadLuuTru() async {
    final data = await LuuTruProvider.getAllLuuTruByDiaDanh(dd.id.toString());
    setState(() {});
    lstLT = data;
  }

  _loadUser() async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    String us = pres.getString("user") ?? '';
    user = UserObject.fromJson(jsonDecode(us));
  }

  CarouselSlider slideShow(List<Column> lst) {
    return CarouselSlider(
      items: lst,
      options: CarouselOptions(
          viewportFraction: 0.7,
          height: 217.0,
          autoPlay: false,
          enableInfiniteScroll: true),
    );
  }

  CarouselSlider slideImg(List<SizedBox> lst) {
    return CarouselSlider(
      items: lst,
      options: CarouselOptions(
        viewportFraction: 1,
        height: 240.0,
        autoPlay: true,
        enableInfiniteScroll: true,
      ),
    );
  }

  loadImgDiaDanh() {
    int b = dd.hinhanh!.hinhAnh.length;
    for (int i = 0; i < b; i++) {
      SizedBox a = SizedBox(
        width: double.infinity,
        height: 232,
        child: Image.network(
          urlImg + dd.hinhanh!.hinhAnh,
          width: double.infinity,
          height: 232,
          fit: BoxFit.cover,
        ),
      );
      imgDiaDanh.add(a);
    }
  }

  SizedBox lstQuanAn() {
    return SizedBox(
      height: 212,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: lstQuan.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.only(left: 10),
          width: 271,
          height: 210,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RestaurantDetail(lstQuan[index].id),
                ),
              );
            },
            child: SizedBox(
              height: 215,
              child: Card(
                elevation: 1.0,
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
                    Image.network(
                      urlImg + lstQuan[index].hinhAnh,
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
                      child: Text(
                        lstQuan[index].tenQuan,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          color: Color(0XFF242A37),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          right: 10, bottom: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.mapMarkerAlt,
                                color: Color(0XFFFF2D55),
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                dd.tinhthanh!.tenTinhThanh,
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: Color(0XFF242A37),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.clock,
                                color: Color(0XFF0869E1),
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                lstQuan[index].thoiGianHoatDong,
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: Color(0XFF242A37),
                                  fontWeight: FontWeight.normal,
                                ),
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
        ),
      ),
    );
  }

  SizedBox lstLuuTru() {
    return SizedBox(
      height: 212,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: lstLT.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.only(left: 10),
          width: 271,
          height: 215,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChiTietLuuTru(lstLT[0])));
            },
            child: SizedBox(
              height: 215,
              child: Card(
                elevation: 1.0,
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
                    Image.network(
                      urlImg + lstLT[index].hinhAnh,
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
                      child: Text(
                        lstLT[index].tenLuuTru,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: Color(0XFF242A37),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          right: 10, bottom: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.mapMarkerAlt,
                                color: Color(0XFFFF2D55),
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                dd.tinhthanh!.tenTinhThanh,
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: Color(0XFF242A37),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.clock,
                                color: Color(0XFF0869E1),
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                lstLT[index].thoiGianHoatDong,
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: Color(0XFF242A37),
                                  fontWeight: FontWeight.normal,
                                ),
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
        ),
      ),
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
              color: Color(0XFF242A37),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: TextButton(
            onPressed: () {
              if (title == "Quán ăn gần đây") {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => QuanAn()));
              }
              if (title == "Lưu trú gần đây") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LuuTru()));
              }
            },
            child: const Text(
              "Xem thêm",
              style: TextStyle(
                fontSize: 12,
                color: Color(0XFF0066FF),
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _loadUser();
    loadImgDiaDanh();
    _loadDiaDanh();
    _loadQuanAn();
    _loadLuuTru();
  }

  final scroll = ScrollController();
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
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
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreatePost(
                        diadanh: dd,
                        user: user,
                      ),
                    ),
                  );
                },
                icon: const FaIcon(
                  FontAwesomeIcons.shareAlt,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(children: [
              slideImg(imgDiaDanh),
            ]),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 130, 10),
              child: Text(
                dd.tenDiaDanh,
                style: const TextStyle(
                    fontFamily: 'Roboto',
                    height: 1.6,
                    fontSize: 22,
                    color: Color(0XFF0066FF),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 50),
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
                      color: Color(0XFFFF2D55),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      dd.tinhthanh!.tenTinhThanh,
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: Color(0XFF242A37),
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
                  color: Color(0XFF242A37),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Text(
                dd.moTa,
                textAlign: TextAlign.justify,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: const Text(
                "Vị trí",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  height: 1.5,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF242A37),
                ),
              ),
            ),
            Image.asset("images/map-hotel.jpg"),
            const SizedBox(
              height: 15,
            ),
            sliderTitle("Quán ăn gần đây"),
            lstQuanAn(),
            sliderTitle("Lưu trú gần đây"),
            lstLuuTru(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
