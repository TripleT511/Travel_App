import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/chitiet_luu_tru.dart';
import 'package:vietnam_travel_app/chitiet_quan_an.dart';

class PlaceDetail extends StatefulWidget {
  const PlaceDetail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PlaceDetailState();
  }
}

class PlaceDetailState extends State<PlaceDetail> {
  final List<Column> imgListQuanAn = [];
  final List<Column> imgListLuuTru = [];
  final List<SizedBox> imgDiaDanh = [];
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
        height: 230.0,
        autoPlay: true,
        enableInfiniteScroll: true,
      ),
    );
  }

  void loadImgDiaDanh() {
    int b = 5;
    for (int i = 0; i < b; i++) {
      SizedBox a = SizedBox(
        width: double.infinity,
        height: 232,
        child: Image.asset(
          "images/slide_1.jpg",
          width: double.infinity,
          height: 232,
          fit: BoxFit.cover,
        ),
      );
      imgDiaDanh.add(a);
    }
  }

  void loadListQuanAn() {
    int b = 5;
    for (int i = 0; i < b; i++) {
      Column a = Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RestaurantDetail()));
            },
            child: SizedBox(
              height: 215,
              child: Card(
                elevation: 7.0,
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
                      "images/quanan.jpg",
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
                        "Nhà hàng Baratie",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          color: Color(0XFF050505),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: const FaIcon(
                                  FontAwesomeIcons.mapMarkerAlt,
                                  color: Color(0XFFFF3535),
                                  size: 18,
                                ),
                              ),
                              const Text(
                                " Hồ Chí Minh",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: Color(0XFF050505),
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
                                  FontAwesomeIcons.clock,
                                  color: Color(0XFF0869E1),
                                  size: 18,
                                ),
                              ),
                              const Text(
                                " 12 a.m - 10 p.m",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: Color(0XFF050505),
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
        ],
      );
      imgListQuanAn.add(a);
    }
  }

  void loadListLuuTru() {
    int b = 5;
    for (int i = 0; i < b; i++) {
      Column a = Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChiTietLuuTru()));
            },
            child: SizedBox(
              height: 215,
              child: Card(
                elevation: 7.0,
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
                      "images/luutru.jpg",
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
                        "Khách sạn sunny",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          color: Color(0XFF050505),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: const FaIcon(
                                  FontAwesomeIcons.mapMarkerAlt,
                                  color: Color(0XFFFF3535),
                                  size: 18,
                                ),
                              ),
                              const Text(
                                " Hồ Chí Minh",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: Color(0XFF050505),
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
                                  FontAwesomeIcons.clock,
                                  color: Color(0XFF0869E1),
                                  size: 18,
                                ),
                              ),
                              const Text(
                                " 12 a.m - 10 p.m",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: Color(0XFF050505),
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
        ],
      );
      imgListLuuTru.add(a);
    }
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
              color: Color(0XFF050505),
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: TextButton(
            onPressed: () {
              if (title == "Lưu trú gần đây") {}
              if (title == "Quán ăn gần đây") {}
            },
            child: const Text(
              "Xem thêm",
              style: TextStyle(
                fontSize: 14,
                color: Color(0XFF0869E1),
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
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
    loadImgDiaDanh();
    loadListQuanAn();
    loadListLuuTru();
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
                onPressed: () {},
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
              child: const Text(
                "InterCointinetal Residence Saigon",
                style: TextStyle(
                    fontFamily: 'Roboto',
                    height: 1.6,
                    fontSize: 22,
                    color: Color(0XFF0869E1),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 50, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  FaIcon(
                    FontAwesomeIcons.mapMarkerAlt,
                    size: 18,
                    color: Color(0XFFFF3535),
                  ),
                  SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      "Nguyen Du St. & Hai Ba Trung Le Van Huu St, Ho Chi Minh City, Vietnam",
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: Color(0XFF050505),
                          height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: const Text(
                "Chi tiết",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  height: 1.5,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF050505),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: const Flexible(
                child: Text(
                  "Intecontinental Residences Saigon tọa lạc tại vị trí thuận tiện tại Kumho Plaza, cách Tháp Sài Gòn, Trung tâm Thương mại Sài Gòn và các văn phòng lãnh sự nước ngoài một đoạn đi bộ. Chỉ mất 10 phút đi bộ nhàn nhã là đến công viên thành phố, sở thú và dinh Thống Nhất. InterContinental Residences Saigon cung cấp các dịch vụ và tiện ích dân cư cao cấp. Ngoài việc cung cấp tầm nhìn ra toàn cảnh thành phố từ các dinh thự, nó còn có câu lạc bộ sức khỏe và spa hạng nhất. Sống cuộc sống InterContinental tại địa chỉ hàng đầu Sài Gòn, nơi những cư dân quốc tế sành điệu có thể trải nghiệm cuộc sống đương đại đặc biệt trong khu phức hợp tích hợp tốt nhất thành phố.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.normal,
                  ),
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
                  color: Color(0XFF050505),
                ),
              ),
            ),
            Image.asset("images/map-hotel.jpg"),
            const SizedBox(
              height: 15,
            ),
            sliderTitle("Quán ăn gần đây"),
            slideShow(imgListQuanAn),
            const SizedBox(
              height: 15,
            ),
            sliderTitle("Lưu trú gần đây"),
            slideShow(imgListLuuTru),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
