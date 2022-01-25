import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vietnam_travel_app/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NhuCauPage extends StatefulWidget {
  const NhuCauPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NhuCauPageState();
  }
}

class NhuCauPageState extends State<NhuCauPage> {
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

  final List<Column> imgListNhuCauTamBien = [];
  final List<Column> imgListNhuCauCamTrai = [];

  void loadListNhuCauTamBien() {
    final Column a = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {},
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
                  "images/tambien.jpg",
                  /*a.image*/
                  width: double.maxFinite,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 165,
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
        ),
        const Expanded(
          child: SizedBox(),
        ),
      ],
    );
    imgListNhuCauTamBien.add(a);
  }

  void loadListNhuCauCamTrai() {
    final Column a = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {},
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
                  "images/camtrai.jpg",
                  /*a.image*/
                  width: double.maxFinite,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 165,
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
        ),
        const Expanded(
          child: SizedBox(),
        ),
      ],
    );
    imgListNhuCauCamTrai.add(a);
  }

  @override
  void initState() {
    super.initState();
    loadListNhuCauCamTrai();
    loadListNhuCauTamBien();
  }

  @override
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
            padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.only(left: 125),
            child: const Text(
              "Nhu Cầu",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF0869E1)),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          sliderTitle("Tắm Biển"),
          const SizedBox(
            height: 15,
          ),
          slideShow(imgListNhuCauTamBien),
          const SizedBox(
            height: 15,
          ),
          sliderTitle("Cắm Trại"),
          const SizedBox(
            height: 15,
          ),
          slideShow(imgListNhuCauCamTrai)
        ],
      ),
    );
  }
}
