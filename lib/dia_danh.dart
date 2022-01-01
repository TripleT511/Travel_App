import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/chitiet_dia_danh.dart';

class Place extends StatefulWidget {
  const Place({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PlaceState();
  }
}

class PlaceState extends State<Place> {
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
                Card(
                  elevation: 3.0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.all(
                      Radius.circular(16),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    "images/slide_1.jpg",
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
                        child: const Text(
                          "Vịnh Hạ Long",
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
              Navigator.pop(context);
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
                  child: Image.asset(
                    "images/slide_1.jpg",
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
                        child: const Text(
                          "Vịnh Hạ Long",
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: SizedBox(
                          width: 95,
                          child: Image.asset("images/logo-ver3.png"),
                        ))
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                      "images/a.jpg",
                                    ),
                                    fit: BoxFit.cover),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50.0)),
                                border:
                                    Border.all(width: 2, color: Colors.white))))
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
                border: Border.fromBorderSide(
                    BorderSide(width: 1, color: Colors.grey.shade300))),
          ),
          Container(
            padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.only(left: 125),
            child: const Text(
              "Địa Danh",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF0869E1)),
            ),
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 360,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Nhập địa điểm cần đến...",
                        prefixIcon: Icon(
                          Icons.place,
                          color: Color(0XFF0869E1),
                        )),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          sliderTitle("Quảng Ninh"),
          const SizedBox(
            height: 25,
          ),
          slideShow(imgListDiaDanh),
          const SizedBox(
            height: 15,
          ),
          sliderTitle("Long An"),
          const SizedBox(
            height: 25,
          ),
          slideShow(imgListDiaDanhLongAn),
          const SizedBox(
            height: 15,
          ),
          sliderTitle("Long An"),
          const SizedBox(
            height: 25,
          ),
          slideShow(imgListDiaDanhLongAn)
        ],
      ),
    );
  }
}
