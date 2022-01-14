import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/Models/quanan2_object.dart';
import 'package:vietnam_travel_app/Models/quanan_object.dart';
import 'package:vietnam_travel_app/Providers/quanan_provider.dart';

class RestaurantDetail extends StatefulWidget {
  QuanAn2Object qa;
  RestaurantDetail(this.qa, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RestaurantDetailState(qa);
  }
}

class RestaurantDetailState extends State<RestaurantDetail> {
  QuanAn2Object qa;
  RestaurantDetailState(this.qa);
  List<QuanAnObject> lstQuan = [];
  String urlImg = 'https://shielded-lowlands-87962.herokuapp.com/';

  _loadQA() async {
    final data = await QuanAnProvider.getQuanAnByID(1.toString());
    setState(() {});
    lstQuan = data;
  }

  @override
  void initState() {
    super.initState();
    _loadQA();
  }

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
        title: TextButton(
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              urlImg + qa.hinhAnh,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 232,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.fromLTRB(10, 10, 130, 10),
              child: Text(
                qa.tenQuan,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    height: 1.6,
                    fontSize: 22,
                    color: Color(0XFF0066FF),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 50, bottom: 10),
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
                      color: Color(0XFFFF3535),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      qa.diaChi,
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: Color(0XFF242A37),
                          height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 50, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 18,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 10),
                    child: const FaIcon(
                      FontAwesomeIcons.clock,
                      size: 18,
                      color: Color(0XFF3EFF7F),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      qa.thoiGianHoatDong,
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: Color(0XFF242A37),
                          height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 50, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 18,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 10),
                    child: const FaIcon(
                      FontAwesomeIcons.phoneAlt,
                      size: 18,
                      color: Color(0XFF0066FF),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      qa.sdt,
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: Color(0XFF242A37),
                          height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: const Text(
                "Mô tả",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  height: 1.5,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF242A37),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Flexible(
                child: Text(
                  qa.moTa,
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
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
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
                          lstQuan.isEmpty
                              ? Image.asset("images/a.jpg")
                              : Image.network(
                                  urlImg + lstQuan[0].monan.hinhAnh,
                                  width: double.infinity,
                                  height: 132,
                                  fit: BoxFit.cover,
                                ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              lstQuan.isEmpty ? "a" : lstQuan[0].monan.tenMon,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                color: Color(0XFF242A37),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
