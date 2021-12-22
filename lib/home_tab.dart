import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travel_p/create_post.dart';
import 'package:travel_p/dia_danh.dart';
import 'package:travel_p/luu_tru.dart';
import 'package:travel_p/nhu_cau.dart';
import 'package:travel_p/quan_an.dart';
import 'package:travel_p/trang_ca_nhan.dart';

class home_tab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return home_tabState();
  }
}

class home_tabState extends State<home_tab> {
  final scroll = ScrollController();
  final List<Column> imgListDiaDanh = [
    Column(
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
                top: 140,
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
    )
  ];
  final List<Column> imgListNhuCau = [
    Column(
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
                left: 130,
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        "Tắm Biển",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
  final List<Expanded> imgListQuanAn = [
    Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Image.asset(
            "images/z.jpg",
            height: 150,
            width: 250,
            fit: BoxFit.cover,
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Text("Nhà Hàng ABC", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [Icon(Icons.place), Text("Ho Chi Minh")],
                  )),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.access_time_outlined),
                      Text("12 a.m - 10 p.m")
                    ],
                  )),
            ),
          ],
        )
      ],
    ))
  ];
  final List<Expanded> imgListBaiViet = [
    Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Image.asset(
            "images/z.jpg",
            height: 150,
            width: 250,
            fit: BoxFit.cover,
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                "Check-in điểm du lịch",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.thumb_up, color: Color(0XFF0869E1)),
                  ),
                  Text("5.6k")
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.remove_red_eye, color: Colors.greenAccent),
                  ),
                  Text("6.1k")
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.place, color: Colors.redAccent),
                  ),
                  Text("Nha Trang")
                ],
              )
            ],
          ),
        ))
      ],
    ))
  ];
  final List<Expanded> imgListLuuTru = [
    Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Image.asset(
            "images/z.jpg",
            height: 150,
            width: 250,
            fit: BoxFit.cover,
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Text("Khách Sạn Wano"),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [Icon(Icons.place), Text("Ho Chi Minh")],
                  )),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.access_time_outlined),
                      Text("12 a.m - 10 p.m")
                    ],
                  )),
            ),
          ],
        )
      ],
    ))
  ];
  CarouselSlider slideShow(List<Column> lst) {
    return CarouselSlider(
      items: lst,
      options: CarouselOptions(
          height: 220.0, autoPlay: false, enableInfiniteScroll: true),
    );
  }

  CarouselSlider slideShowQuan(List<Expanded> lst) {
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
            Text(
              title,
              style: TextStyle(color: Color(0XFF0869E1), fontSize: 20),
            )
          ],
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {
                if (title == "Quán Ăn") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => quan_an()));
                }
                if (title == "Lưu Trú") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => luu_tru()));
                }
                if (title == "Nhu Cầu") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => nhu_cau()));
                }
                if (title == "Địa Danh Nổi Bật") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => dia_danh()));
                }
              },
              child: Text(
                "Xem thêm",
                style: TextStyle(fontSize: 15, color: Color(0XFF0869E1)),
              ),
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        controller: scroll,
        children: [
          Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Container(
                                width: 95,
                                child: Image.asset("images/logo-ver3.png"),
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => trang_ca_nhan()));
                              },
                              child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            "images/a.jpg",
                                          ),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50.0)),
                                      border: Border.all(
                                          width: 2, color: Colors.white))))
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                        border: Border.fromBorderSide(
                            BorderSide(width: 1, color: Colors.grey.shade300))),
                  ),
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.all(15),
                          child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "images/a.jpg",
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.0)),
                                  border: Border.all(
                                      width: 2, color: Colors.white)))),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        width: 280,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => create_post()));
                            },
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Chia sẻ địa danh..."),
                            )),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                        border: Border.fromBorderSide(
                            BorderSide(width: 1, color: Colors.grey.shade300))),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  sliderTitle("Địa Danh Nổi Bật"),
                  SizedBox(
                    height: 15,
                  ),
                  slideShow(imgListDiaDanh),
                  SizedBox(
                    height: 25,
                  ),
                  sliderTitle("Bài Viết Nổi Bật"),
                  SizedBox(
                    height: 15,
                  ),
                  slideShowQuan(imgListBaiViet),
                  SizedBox(
                    height: 25,
                  ),
                  sliderTitle("Nhu Cầu"),
                  SizedBox(
                    height: 15,
                  ),
                  slideShow(imgListNhuCau),
                  SizedBox(
                    height: 25,
                  ),
                  sliderTitle("Quán Ăn"),
                  SizedBox(
                    height: 15,
                  ),
                  slideShowQuan(imgListQuanAn),
                  SizedBox(
                    height: 25,
                  ),
                  sliderTitle("Lưu Trú"),
                  SizedBox(
                    height: 15,
                  ),
                  slideShowQuan(imgListLuuTru),
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: 1, color: Colors.grey.shade300),
                    bottom: BorderSide(width: 1, color: Colors.grey.shade300))),
            child: Text(
              "Bài Viết",
              style: TextStyle(fontSize: 20, color: Color(0XFF0869E1)),
            ),
          ),
          Container(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("images/a.jpg"),
              ),
              title: Text(
                "Phuc Nguyen",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Align(
                alignment: Alignment.centerLeft,
                child: Text("13 giờ"),
              ),
              trailing:
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
            ),
          ),
          Container(
            child: Image.asset("images/i.jpg"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 25, right: 25, left: 25),
            child: Text("Đẹp vl !"),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextButton(
                onPressed: () {},
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0XFF0869E1)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text("Ho Chi Minh City,Viet Nam"),
                  ),
                )),
          ),
          Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.remove_red_eye, color: Colors.grey),
                      Text("10k lượt xem")
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [Text("1.2k lượt thích")],
                      ),
                      Row(
                        children: [Text("56 lượt không thích")],
                      ),
                      Row(
                        children: [Text("5.6k lượt chia sẻ")],
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        border: Border.fromBorderSide(
                            BorderSide(width: 1, color: Colors.grey.shade300))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon:
                                Icon(Icons.thumb_up, color: Color(0XFF0869E1)),
                          ),
                          Text("Thích")
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.thumb_down_outlined,
                                color: Colors.grey),
                          ),
                          Text("Không thích")
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon:
                                Icon(Icons.share_outlined, color: Colors.grey),
                          ),
                          Text("Chia sẻ")
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                        border: Border.fromBorderSide(
                            BorderSide(width: 1, color: Colors.grey.shade300))),
                  )
                ],
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final double start = 0;
          scroll.animateTo(start,
              duration: Duration(seconds: 1), curve: Curves.easeIn);
        },
        child: Icon(Icons.arrow_upward),
      ),
    );
  }
}
