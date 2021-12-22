import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'chitiet_dia_danh.dart';

class map_areas extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return map_areasState();
  }
}

class map_areasState extends State<map_areas> {
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
                          builder: (context) => chitiet_diadanh()));
                },
                child: Container(
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
                          "Vịnh Hạ Long",
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
      )
    ];
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
                      Icon(Icons.ac_unit),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white),
                        margin: EdgeInsets.only(right: 15),
                        child: Text(
                          "Đề xuất lên hệ thống",
                          style: TextStyle(color: Color(0XFF0869E1)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
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
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(16))),
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Text("Địa danh abc"),
                                  Row(
                                    children: [
                                      Icon(Icons.place_outlined),
                                      Text(
                                          "65, Huỳnh Thúc Kháng, P.Bến Nghé, Q.1, Tp.HCM")
                                    ],
                                  ),
                                  Row(
                                    children: [
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
