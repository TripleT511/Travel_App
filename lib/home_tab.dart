import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/Models/baiviet_object.dart';
import 'package:vietnam_travel_app/Models/diadanh_object.dart';
import 'package:vietnam_travel_app/Models/nhucau_object.dart';
import 'package:vietnam_travel_app/Models/user_object.dart';
import 'package:vietnam_travel_app/Providers/baiviet_provider.dart';
import 'package:vietnam_travel_app/Providers/diadanh_provider.dart';
import 'package:vietnam_travel_app/Providers/nhucau_provider.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';
import 'package:vietnam_travel_app/baiviet_noibat.dart';
import 'package:vietnam_travel_app/chitiet_dia_danh.dart';
import 'package:vietnam_travel_app/dia_danh.dart';
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
  final List<Column> imgListBaiViet = [];

  List<NhuCauObject> lstNC = [];
  List<DiaDanhObject> lstDD = [];
  List<BaiVietChiaSeObject> lstBaiViet = [];
  List<BaiVietChiaSeObject> lstBaiVietNoiBat = [];

  String urlImg = 'https://shielded-lowlands-87962.herokuapp.com/';
  final Color _userColor =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  bool like = false;
  bool dislike = false;
  _like() {
    setState(() {});
    like = !like;
    dislike = false;
  }

  _dislike() {
    setState(() {});
    dislike = !dislike;
    like = false;
  }

  String nameUser = '';
  int idUser = 0;
  _loadUser() async {
    UserObject user = await UserProvider.getUser();
    SharedPreferences pres = await SharedPreferences.getInstance();
    pres.setString('hoTen', user.hoTen);
    pres.setString('soDienThoai', user.soDienThoai);
    pres.setInt('id', user.id);

    setState(() {});
    nameUser = 'Chào, ' + user.hoTen + '! 👋';
  }

  @override
  void initState() {
    super.initState();
    loadListDiaDanh();
    loadListNhuCau();
    loadListBaiViet();
    _loadUser();
  }

  void loadListDiaDanh() async {
    final data = await DiaDanhProvider.getAllDiaDanh();
    setState(() {});
    lstDD = data;
  }

  void loadListBaiViet() async {
    final data = await BaiVietProvider.getAllBaiViet();
    final data2 = await BaiVietProvider.getAllBaiVietNoiBat();
    setState(() {});
    lstBaiViet = data;
    lstBaiVietNoiBat = data2;
  }

  void loadListNhuCau() async {
    final data = await NhuCauProvider.getAllNhuCau();
    setState(() {});
    lstNC = data;
  }

  @override
  Widget build(BuildContext context) {
    SizedBox slideNhuCau() {
      return SizedBox(
        height: 40,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: lstNC.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => SizedBox(
            width: 160,
            height: 40,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChiTietNhuCau(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: Card(
                  elevation: 3.0,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                              .withOpacity(1.0),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    padding: const EdgeInsets.only(
                        left: 22, top: 7, right: 22, bottom: 7),
                    child: Text(
                      lstNC[index].tenNhuCau,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    SizedBox slideBaiViet() {
      return SizedBox(
        height: 215,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: lstBaiVietNoiBat.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.only(left: 10),
            width: 271,
            height: 210,
            child: GestureDetector(
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
                      Image.network(
                        urlImg + lstBaiVietNoiBat[index].hinhanh.hinhAnh,
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
                          lstBaiVietNoiBat[index].noiDung,
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
                            left: 10, right: 10, bottom: 10),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 0),
                                  child: const Icon(
                                    Icons.thumb_up,
                                    color: Color(0XFF0066FF),
                                    size: 18,
                                  ),
                                ),
                                const Text(
                                  " 5.6k",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                    color: Color(0XFF242A37),
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
                                    color: Color(0XFF242A37),
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
                                    color: Color(0XFFFF2D55),
                                    size: 18,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    lstBaiViet[index].diadanh.tenDiaDanh,
                                    style: const TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 14,
                                      color: Color(0XFF242A37),
                                      fontWeight: FontWeight.normal,
                                    ),
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
          ),
        ),
      );
    }

    SizedBox slideShimmer() {
      return SizedBox(
        height: 215,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 2,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.only(left: 10),
            width: 271,
            height: 210,
            child: GestureDetector(
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
                            color: Color(0XFF242A37),
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
                                    color: Color(0XFF0066FF),
                                    size: 18,
                                  ),
                                ),
                                const Text(
                                  " 5.6k",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                    color: Color(0XFF242A37),
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
                                    color: Color(0XFF242A37),
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
                                    color: Color(0XFFFF2D55),
                                    size: 18,
                                  ),
                                ),
                                const Text(
                                  " Nha Trang",
                                  style: TextStyle(
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    SizedBox slideDiaDanh() {
      return SizedBox(
        height: 210,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: lstDD.length,
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
                    builder: (context) => PlaceDetail(lstDD[index]),
                  ),
                );
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
                      urlImg + lstDD[index].hinhanh!.hinhAnh,
                      /*a.image*/
                      width: double.maxFinite,
                      height: 210,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      decoration: const BoxDecoration(
                        color: Color(0XFFFF2D55),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: const Text(
                        'Hot',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 170,
                    left: 20,
                    child: Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.mapMarkerAlt,
                          color: Color(0XFFFF2D55),
                          size: 18,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            lstDD[index].tenDiaDanh,
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

    ListView _loadPost() {
      return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: lstBaiViet.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  height: 10,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Color(0XFFF0F2F5)),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PersonalPage(user: lstBaiViet[index].user)));
                  },
                  leading: Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: NetworkImage(
                            urlImg + lstBaiViet[index].user.hinhAnh),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    lstBaiViet[index].user.hoTen,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: Color(0XFF242A37)),
                  ),
                  subtitle: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      lstBaiViet[index].thoiGian,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        color: Color(0XFFB1BCD0),
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.ellipsisV,
                      size: 16,
                      color: Color(0XFFB1BCD0),
                    ),
                  ),
                ),
                Image.network(
                  urlImg + lstBaiViet[index].hinhanh.hinhAnh,
                  height: 240,
                  width: 392,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    lstBaiViet[index].noiDung,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: Color(0XFF242A37),
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
                            color: const Color(0XFF0066FF),
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          lstBaiViet[index].diadanh.tenDiaDanh,
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0XFF0066FF),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      decoration: const BoxDecoration(
                        border: Border.fromBorderSide(
                          BorderSide(
                            width: 0.5,
                            color: Color(0XFFe4e6eb),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _like();
                                    },
                                    icon: Icon(
                                      like
                                          ? Icons.thumb_up_alt
                                          : Icons.thumb_up_alt_outlined,
                                      color: like
                                          ? const Color(0XFF0066FF)
                                          : const Color(0XFFB1BCD0),
                                    ),
                                  ),
                                  Text(
                                    math.Random().nextInt(1000).toString(),
                                    style: const TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0XFFB1BCD0),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _dislike();
                                    },
                                    icon: Icon(
                                      dislike
                                          ? Icons.thumb_down_alt
                                          : Icons.thumb_down_alt_outlined,
                                      color: dislike == true
                                          ? const Color(0XFF0066FF)
                                          : const Color(0XFFB1BCD0),
                                    ),
                                  ),
                                  Text(
                                    math.Random().nextInt(1000).toString(),
                                    style: const TextStyle(
                                      color: Color(0XFFB1BCD0),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.solidEye,
                                color: Color(0XFFB1BCD0),
                                size: 18,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 5, right: 10),
                                child: Text(
                                  math.Random().nextInt(1000).toString(),
                                  style: const TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0XFFB1BCD0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

    return FutureBuilder<UserObject>(
      future: UserProvider.getUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserObject user = snapshot.data!;
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
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    width: 270,
                    child: Text(
                      nameUser,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0XE6242A37),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PersonalPage(user: user)));
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: NetworkImage(urlImg + user.hinhAnh),
                          fit: BoxFit.cover,
                        ),
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
                        sliderTitle("Địa Danh Nổi Bật"),
                        slideDiaDanh(),
                        sliderTitle("Bài Viết Nổi Bật"),
                        slideBaiViet(),
                        sliderTitle("Nhu Cầu"),
                        slideNhuCau(),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _loadPost(),
                  ],
                )
              ],
            ),
          );
        }
        return Shimmer.fromColors(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  sliderTitle("Địa Danh Nổi Bật"),
                  slideShimmer(),
                  sliderTitle("Bài Viết Nổi Bật"),
                  slideShimmer(),
                ],
              ),
            ),
            baseColor: const Color(0X1A050505),
            highlightColor: Colors.white);
      },
    );
  }
}
