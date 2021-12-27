import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vietnam_travel_app/main.dart';
import 'package:vietnam_travel_app/personal_page.dart';

class nhu_cau extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return nhu_cauState();
  }
}

class nhu_cauState extends State<nhu_cau> {
  CarouselSlider slideShow(List<Column> lst) {
    return CarouselSlider(
      items: lst,
      options: CarouselOptions(
          height: 220.0, autoPlay: false, enableInfiniteScroll: true),
    );
  }

  Row sliderTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                title,
                style: TextStyle(
                    color: Color(0XFF0869E1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Row(
          children: [],
        )
      ],
    );
  }

  final List<Column> imgListNhuCauTamBien = [];
  final List<Column> imgListNhuCauPhuot = [];

  void loadListNhuCauTamBien() {
    final Column a = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          alignment: Alignment.center,
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
            Positioned(
                top: 145,
                left: 25,
                child: Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: Colors.red,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Nha Trang",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ))
          ],
        ),
        Expanded(
          child: SizedBox(),
        ),
      ],
    );
    imgListNhuCauTamBien.add(a);
  }

  void loadListNhuCauPhuot() {
    final Column a = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          alignment: Alignment.center,
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
            Positioned(
                top: 145,
                left: 25,
                child: Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: Colors.red,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Nha Trang",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ))
          ],
        ),
        Expanded(
          child: SizedBox(),
        ),
      ],
    );
    imgListNhuCauPhuot.add(a);
  }

  @override
  void initState() {
    super.initState();
    loadListNhuCauPhuot();
    loadListNhuCauTamBien();
  }

  Widget build(BuildContext context) {
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
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.only(left: 125),
            child: Text(
              "Nhu Cầu",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF0869E1)),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 360,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Nhu cầu của bạn là gì ?",
                        prefixIcon: Icon(
                          Icons.place,
                          color: Color(0XFF0869E1),
                        )),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          sliderTitle("Tắm Biển"),
          SizedBox(
            height: 25,
          ),
          slideShow(imgListNhuCauTamBien),
          SizedBox(
            height: 15,
          ),
          sliderTitle("Phượt"),
          SizedBox(
            height: 25,
          ),
          slideShow(imgListNhuCauPhuot)
        ],
      ),
    );
  }
}
