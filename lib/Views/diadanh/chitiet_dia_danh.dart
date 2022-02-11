import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vietnam_travel_app/Global/variables.dart';
import 'package:vietnam_travel_app/Models/diadanh_object.dart';
import 'package:vietnam_travel_app/Models/hinhanh_object.dart';
import 'package:vietnam_travel_app/Models/luutru_object.dart';
import 'package:vietnam_travel_app/Models/nhucaudiadanh_object.dart';
import 'package:vietnam_travel_app/Models/user_object.dart';
import 'package:vietnam_travel_app/Providers/diadanh_provider.dart';
import 'package:vietnam_travel_app/Providers/luutru_provider.dart';
import 'package:vietnam_travel_app/Providers/quanan_provider.dart';
import 'package:vietnam_travel_app/Views/diadanh/chitiet_luu_tru.dart';
import 'package:vietnam_travel_app/danh_sach_luu_tru.dart';
import 'package:vietnam_travel_app/danh_sach_quan_an.dart';
import 'package:vietnam_travel_app/luu_tru.dart';
import 'package:vietnam_travel_app/Views/Map/map_page.dart';
import 'package:vietnam_travel_app/quan_an.dart';
import 'package:vietnam_travel_app/Views/baiviet/create_post.dart';

import '../../Models/quanan_object.dart';
import 'chitiet_quan_an.dart';

// ignore: must_be_immutable
class PlaceDetail extends StatefulWidget {
  int id;
  PlaceDetail(this.id, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return PlaceDetailState(id);
  }
}

class PlaceDetailState extends State<PlaceDetail> {
  int id;
  PlaceDetailState(this.id);
  late final UserObject user;
  List<QuanAnObject> lstQuan = [];
  List<LuuTruObject> lstLT = [];
  final List<SizedBox> imgDiaDanh = [];
  bool isLoadingQuanAn = false;
  bool isLoadingLuuTru = false;

  DiaDanhObject? diaDanh;
  _loadQuanAn() async {
    setState(() {
      isLoadingQuanAn = true;
    });
    final data = await QuanAnProvider.getAllQuanAnByDiaDanh(id);
    setState(() {
      lstQuan = data;
      isLoadingQuanAn = false;
    });
  }

  _loadLuuTru() async {
    setState(() {
      isLoadingLuuTru = true;
    });
    final data = await LuuTruProvider.getAllLuuTruByDiaDanh(id);
    setState(() {
      isLoadingLuuTru = false;
      lstLT = data;
    });
  }

  _loadUser() async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    String us = pres.getString("user") ?? '';
    user = UserObject.fromJson(jsonDecode(us));
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

  loadImgDiaDanh(List<HinhAnhObject> lstHinhAnh) {
    int len = lstHinhAnh.length;
    for (int i = 0; i < len; i++) {
      SizedBox item = SizedBox(
        width: double.infinity,
        height: 232,
        child: Image.network(
          urlImage + lstHinhAnh[i].hinhAnh,
          width: double.infinity,
          height: 232,
          fit: BoxFit.cover,
        ),
      );
      imgDiaDanh.add(item);
    }
  }

  SizedBox lstQuanAn(String tenTinhThanh) {
    return SizedBox(
      height: (lstQuan.length > 0) ? 212 : 20,
      child: lstQuan.length > 0
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: isLoadingQuanAn ? 2 : lstQuan.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => isLoadingQuanAn
                  ? Shimmer.fromColors(
                      child: slideNhuCauShimmer(),
                      baseColor: const Color(0X1A242A37),
                      highlightColor: const Color(0X33050505))
                  : Container(
                      padding: const EdgeInsets.only(left: 10),
                      width: 271,
                      height: 210,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RestaurantDetail(lstQuan[index].id),
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
                                  urlImage + lstQuan[index].hinhAnh,
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
                                      fontWeight: FontWeight.w400,
                                      color: Color(0XFF242A37),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      right: 10, bottom: 10, left: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                            tenTinhThanh,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Color(0XFF242A37),
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                            lstQuan[index].thoiGianHoatDong ??
                                                "",
                                            style: const TextStyle(
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
            )
          : Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                "Không có dữ liệu",
                style: TextStyle(
                  color: Color(0XFFB1BCD0),
                ),
              ),
            ),
    );
  }

  SizedBox lstLuuTru(String tenTinhThanh) {
    return SizedBox(
      height: (lstLT.length > 0) ? 212 : 20,
      child: lstLT.length > 0
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: isLoadingLuuTru ? 2 : lstLT.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => isLoadingLuuTru
                  ? Shimmer.fromColors(
                      child: slideNhuCauShimmer(),
                      baseColor: const Color(0X1A242A37),
                      highlightColor: const Color(0X33050505))
                  : Container(
                      padding: const EdgeInsets.only(left: 10),
                      width: 271,
                      height: 215,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ChiTietLuuTru(lstLT[0])));
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
                                  urlImage + lstLT[index].hinhAnh,
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
                                      fontWeight: FontWeight.w500,
                                      color: Color(0XFF242A37),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      right: 10, bottom: 10, left: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                            tenTinhThanh,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Color(0XFF242A37),
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
            )
          : Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                "Không có dữ liệu",
                style: TextStyle(
                  color: Color(0XFFB1BCD0),
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
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: TextButton(
            onPressed: () {
              if (title == "Quán ăn gần đây" && lstQuan.length > 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DanhSachQuanAn(diadanh: diaDanh),
                  ),
                );
              }
              if (title == "Lưu trú gần đây" && lstLT.length > 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DanhSachLuuTru(diadanh: diaDanh),
                  ),
                );
              }
            },
            child: (lstQuan.length < 1 && title == "Quán ăn gần đây")
                ? Text("")
                : (lstLT.length < 1 && title == "Lưu trú gần đây")
                    ? Text("")
                    : Text(
                        "Xem thêm",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0XFF0066FF),
                          fontWeight: FontWeight.w500,
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
        backgroundColor: Colors.transparent,
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
                  size: 20,
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
                        diadanh: diaDanh,
                        user: user,
                      ),
                    ),
                  );
                },
                icon: const FaIcon(
                  FontAwesomeIcons.share,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<DiaDanhObject>(
        future: DiaDanhProvider.getDiaDanhById(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            DiaDanhObject diadanh = snapshot.data!;
            diaDanh = diadanh;
            List<HinhAnhObject> lstHinhAnh = diadanh.hinhanhs!;
            List<NhuCauDiaDanhObject> lstNhuCau = diadanh.nhucaudiadanhs!;
            loadImgDiaDanh(lstHinhAnh);
            return SingleChildScrollView(
                child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(children: [
                      slideImg(imgDiaDanh),
                    ]),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 130, 5),
                      child: Text(
                        diadanh.tenDiaDanh,
                        style: const TextStyle(
                            height: 1.5,
                            fontSize: 24,
                            color: Color(0XFF242A37),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 0, left: 10, right: 50),
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
                              diadanh.tinhthanh!.tenTinhThanh,
                              softWrap: true,
                              overflow: TextOverflow.clip,
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Color(0XFF242A37),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 10, right: 50, top: 10),
                      child: Text(
                        diadanh.shares_count.toString() + " lượt đánh giá",
                        softWrap: true,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Color(0XFFB1BCD0),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 10, left: 10, right: 50, bottom: 10),
                      child: const Text(
                        "Nhu Cầu",
                        softWrap: true,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0XFF242A37),
                            fontSize: 18),
                      ),
                    ),
                    Container(
                      height: 35,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: lstNhuCau.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          margin: const EdgeInsets.only(right: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0X33B1BCD0),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            lstNhuCau[index].nhucau!.tenNhuCau!,
                            style: const TextStyle(
                              color: Color(0XFF0066FF),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 50),
                      child: const Text(
                        "Mô tả",
                        softWrap: true,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0XFF242A37),
                            fontSize: 18),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                      child: Text(
                        diadanh.moTa,
                        textAlign: TextAlign.start,
                        softWrap: true,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: Color(0XFF242A37),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    sliderTitle("Quán ăn gần đây"),
                    lstQuanAn(diadanh.tinhthanh!.tenTinhThanh),
                    sliderTitle("Lưu trú gần đây"),
                    lstLuuTru(diadanh.tinhthanh!.tenTinhThanh),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Positioned(
                  top: 248,
                  right: 5,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapPage(
                            diadanh: diadanh,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 7),
                      decoration: BoxDecoration(
                        color: const Color(0XFFFFFFFF),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: const Color(0XFFB1BCD0),
                          width: 0.5,
                        ),
                      ),
                      child: Row(
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.locationArrow,
                            color: Color(0XFF0066FF),
                            size: 14,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Xem bản đồ",
                            style: TextStyle(
                              color: Color(0XFF0066FF),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ));
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/plane.png",
                  width: 300,
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 30, bottom: 20, left: 15, right: 15),
                  child: const Text(
                    "Đang lấy dữ liệu địa danh...",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0XFF242A37),
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(bottom: 50, left: 50, right: 50),
                  alignment: Alignment.center,
                  child: const Text(
                    "Những địa điểm du lịch hấp dẫn đang chờ bạn khám phá.",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                      color: Color(0XFFB1BCD0),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 7,
                  child: const LinearProgressIndicator(
                    color: Color(0XFF0066FF),
                    backgroundColor: Color(0XFFB1BCD0),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
