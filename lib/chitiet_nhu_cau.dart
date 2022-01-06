import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vietnam_travel_app/chitiet_dia_danh.dart';
import 'package:vietnam_travel_app/main.dart';
import 'package:vietnam_travel_app/personal_page.dart';

class ChiTietNhuCau extends StatefulWidget {
  const ChiTietNhuCau({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ChiTietNhuCauState();
  }
}

class ChiTietNhuCauState extends State<ChiTietNhuCau> {
  final List<Column> imgListDiaDanh = [];
  final List<Column> imgListDiaDanhLongAn = [];
  void loadListDiaDanh() {
    int b = 5;
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
                Container(
                  padding: const EdgeInsets.only(left: 3.0),
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
                            "images/tambien.jpg",
                            width: double.infinity,
                            height: 132,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            child: const Text(
                              "Bãi Dốc Lếch",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
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
          ),
        ],
      );
      imgListDiaDanh.add(a);
    }
  }

  void loadListDiaDanhLongAn() {
    int b = 5;
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
                Container(
                  padding: const EdgeInsets.only(left: 3.0),
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
                            "images/tambien1.jpg",
                            width: double.infinity,
                            height: 132,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            child: const Text(
                              "Bãi Biển Làng Vân",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
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
          ),
        ],
      );
      imgListDiaDanhLongAn.add(a);
    }
  }

  @override
  void initState() {
    super.initState();
    loadListDiaDanh();
    loadListDiaDanhLongAn();
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

    Row sliderTitle(String title) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Color(0XFF0869E1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
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
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const PersonalPage()));
              },
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
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: const Text(
              "Nhu Cầu - Tắm Biển",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF0869E1)),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          sliderTitle("Nha Trang"),
          const SizedBox(
            height: 5,
          ),
          slideShow(imgListDiaDanh),
          const SizedBox(
            height: 15,
          ),
          sliderTitle("Đà Nẳng"),
          const SizedBox(
            height: 5,
          ),
          slideShow(imgListDiaDanhLongAn),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
