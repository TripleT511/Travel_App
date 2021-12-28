import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/home_tab.dart';
import 'package:vietnam_travel_app/map_page.dart';
import 'package:vietnam_travel_app/splash_page1.dart';
import 'package:vietnam_travel_app/search_page.dart';
import 'package:vietnam_travel_app/seemore_page.dart';

void main() {
  runApp(
    MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      //home: ChiTietQuanAn(),
      home: const SplashPage(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: const [
          HomePage(),
          SearchPage(),
          MapPage(),
          SeeMorePage(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 65,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0XFF0869E1), width: 2),
          ),
        ),
        child: TabBar(
          labelStyle: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0XFF050505),
          ),
          labelColor: const Color(0XFF0869E1),
          controller: _tabController,
          unselectedLabelColor: const Color(0XFF050505),
          tabs: const [
            Tab(
              icon: FaIcon(
                FontAwesomeIcons.home,
                color: Color(0XFF0869E1),
                size: 18,
              ),
              text: "Trang chủ",
            ),
            Tab(
              icon: FaIcon(
                FontAwesomeIcons.search,
                color: Color(0XFF0869E1),
                size: 18,
              ),
              text: "Tìm kiếm",
            ),
            Tab(
              icon: FaIcon(
                FontAwesomeIcons.mapMarkedAlt,
                color: Color(0XFF0869E1),
                size: 18,
              ),
              text: "Bản đồ",
            ),
            Tab(
              icon: FaIcon(
                FontAwesomeIcons.bars,
                color: Color(0XFF0869E1),
                size: 18,
              ),
              text: "Xem thêm",
            ),
          ],
        ),
      ),
    );
  }
}
