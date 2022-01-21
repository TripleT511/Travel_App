import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/Models/diadanh_object.dart';
import 'package:vietnam_travel_app/Models/nhucau_object.dart';
import 'package:vietnam_travel_app/Providers/diadanh_provider.dart';
import 'package:vietnam_travel_app/Providers/nhucau_provider.dart';
import 'package:vietnam_travel_app/chitiet_dia_danh.dart';
import 'package:vietnam_travel_app/home_tab.dart';
import 'package:vietnam_travel_app/main.dart';
import 'package:vietnam_travel_app/personal_page.dart';

import 'package:flutter/material.dart';
import 'package:vietnam_travel_app/Models/diadanh_object.dart';
import 'package:vietnam_travel_app/Models/tinhthanh_object.dart';
import 'package:vietnam_travel_app/Providers/diadanh_provider.dart';
import 'package:vietnam_travel_app/chitiet_quan_an.dart';

class ChiTietNhuCau extends StatefulWidget {
  final NhuCauObject nhucau;
  ChiTietNhuCau({Key? key, required this.nhucau}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ChiTietNhuCauState(nhucau: nhucau);
  }
}

class ChiTietNhuCauState extends State<ChiTietNhuCau> {
  final NhuCauObject nhucau;

  Future<List<DiaDanhObject>> lst = DiaDanhProvider.getAllDiaDanh();
  List<DiaDanhObject> lstDiaDanhs = [];
  String urlImg = 'https://shielded-lowlands-87962.herokuapp.com/';

  ChiTietNhuCauState({required this.nhucau});

  void _LoadDiaDanh() async {
    final data = await NhuCauProvider.getDiaDanhByIdNhuCau(nhucau.id);
    setState(() {});
    for (var i = 0; i < data.nhucaudiadanh!.length; i++) {
      lstDiaDanhs.add(data.nhucaudiadanh![i].diadanh!);
    }
    var a = lstDiaDanhs;
  }

  @override
  void initState() {
    super.initState();
    _LoadDiaDanh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF0F2F5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Color(0XFF242A37),
            size: 20,
          ),
        ),
        title: Text(
          "Nhu cầu - ${nhucau.tenNhuCau}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
            color: Color(0XFF242A37),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0XFFFFFFFF),
      ),
      body: FutureBuilder(
        future: DiaDanhProvider.getAllDiaDanh(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // if (lstDiaDanhs.length == 0) {
          //   return Center(
          //     child: Text(
          //       'Hiên Tại Chưa Có Địa Danh Tại Tỉnh Thành Này',
          //       style: TextStyle(
          //         color: Colors.red,
          //         fontSize: 20,
          //       ),
          //       textAlign: TextAlign.center,
          //     ),
          //   );
          // }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Có lỗi xảy ra!!!'),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: lstDiaDanhs.length,
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                width: MediaQuery.of(context).size.width,
                height: 210,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PlaceDetail(lstDiaDanhs[index].id),
                      ),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Card(
                        elevation: 1.0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.all(
                            Radius.circular(16),
                          ),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          urlImg + lstDiaDanhs[index].hinhanh!.hinhAnh,
                          /*a.image*/
                          width: double.maxFinite,
                          height: 210,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 106,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 27,
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          height: 90,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadiusDirectional.only(
                                  bottomEnd: Radius.circular(16),
                                  bottomStart: Radius.circular(16)),
                              color: Color(0XFFFFFFFF),
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0X0D5E9EFF),
                                    Color(0XB30066FF)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  tileMode: TileMode.clamp)),
                        ),
                      ),
                      Positioned(
                        top: 140,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                lstDiaDanhs[index].tenDiaDanh,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 5.0,
                                      color: Color(0XFF0066FF),
                                      offset: Offset(1.5, 0.5),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0XFF0066FF),
                                          offset: Offset(1.5, 0.5),
                                          blurRadius: 5.0,
                                        ),
                                      ]),
                                  child: const FaIcon(
                                    FontAwesomeIcons.mapMarkerAlt,
                                    color: Color(0XFFFFFFFF),
                                    size: 15,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    lstDiaDanhs[index].tinhthanh!.tenTinhThanh,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 5.0,
                                          color: Color(0XFF0066FF),
                                          offset: Offset(1.5, 0.5),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const Center(
            child: SpinKitFadingCircle(
              color: Color(0XFF0066FF),
              size: 50.0,
            ),
          );
        },
      ),
    );
  }
}
