import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/Models/luutru_object.dart';

class ChiTietLuuTru extends StatefulWidget {
  LuuTruObject lt;
  ChiTietLuuTru(this.lt);

  @override
  State<StatefulWidget> createState() {
    return ChiTietLuuTruState(lt);
  }
}

class ChiTietLuuTruState extends State<ChiTietLuuTru> {
  LuuTruObject lt;
  ChiTietLuuTruState(this.lt);
  String urlImg = 'https://shielded-lowlands-87962.herokuapp.com/';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              urlImg + lt.hinhAnh,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 232,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 130, 10),
              child: Text(
                lt.tenLuuTru,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    height: 1.6,
                    fontSize: 22,
                    color: Color(0XFF0066FF),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 50),
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
                      lt.diaChi,
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: Color(0XFF242a37),
                          height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
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
                      lt.thoiGianHoatDong,
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: Color(0XFF242a37),
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
                      lt.sdt,
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: Color(0XFF242a37),
                          height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: const Text(
                "Mô tả",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  height: 1.5,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF242a37),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: Flexible(
                child: Text(
                  lt.moTa,
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
          ],
        ),
      ),
    );
  }
}
