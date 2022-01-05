import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'chitiet_dia_danh.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MapPageState();
  }
}

class MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    final List<Column> imgListDiaDanhQuangNinh = [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PlaceDetail()));
                },
                child: Card(
                  shape: const RoundedRectangleBorder(
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
                      const Icon(
                        Icons.place,
                        color: Colors.red,
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: const Text(
                          "Vịnh Hạ Long",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ))
            ],
          ),
          const Expanded(
            child: SizedBox(),
          ),
        ],
      )
    ];
    // ignore: unused_element
    CarouselSlider slideShow(List<Column> lst) {
      return CarouselSlider(
        items: lst,
        options: CarouselOptions(
            height: 220.0, autoPlay: false, enableInfiniteScroll: true),
      );
    }

    // ignore: unused_element
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
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("images/map-hcm.jpg"),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.ac_unit),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white),
                        margin: const EdgeInsets.only(right: 15),
                        child: const Text(
                          "Đề xuất lên hệ thống",
                          style: TextStyle(color: Color(0XFF0869E1)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadiusDirectional.all(Radius.circular(16))),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        "images/z.jpg",
                        width: 360,
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        child: Container(
                            width: 360,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 2, color: Colors.grey.shade300),
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(16))),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  const Text("Địa danh abc"),
                                  Row(
                                    children: const [
                                      Icon(Icons.place_outlined),
                                      Text(
                                          "65, Huỳnh Thúc Kháng, P.Bến Nghé, Q.1, Tp.HCM")
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Icon(Icons.place_outlined),
                                      Text(
                                          "65, Huỳnh Thúc Kháng, P.Bến Nghé, Q.1, Tp.HCM")
                                    ],
                                  ),
                                ],
                              ),
                            )))
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
