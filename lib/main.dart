import 'package:flutter/material.dart';
import 'package:vietnam_travel_app/home_tab.dart';
import 'package:vietnam_travel_app/map_areas.dart';
import 'package:vietnam_travel_app/splash_page1.dart';
import 'package:vietnam_travel_app/tim_kiem.dart';
import 'package:vietnam_travel_app/xem_them_tab.dart';

void main() {
  runApp(MaterialApp(
    title: "Travel",
    debugShowCheckedModeBanner: false,
    home: SplashPage(),
  ));
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
        body: TabBarView(controller: _tabController, children: [
          home_tab(),
          search_tab(),
          map_areas(),
          xem_them(),
        ]),
        bottomNavigationBar: TabBar(
            labelColor: Color(0XFF0869E1),
            controller: _tabController,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.house_outlined,
                  color: Color(0XFF0869E1),
                ),
                text: "Trang chủ",
              ),
              Tab(
                icon: Icon(
                  Icons.search_outlined,
                  color: Color(0XFF0869E1),
                ),
                text: "Tìm kiếm",
              ),
              Tab(
                icon: Icon(
                  Icons.map,
                  color: Color(0XFF0869E1),
                ),
                text: "Bản đồ",
              ),
              Tab(
                icon: Icon(
                  Icons.dehaze,
                  color: Color(0XFF0869E1),
                ),
                text: "Xem thêm",
              ),
            ]));
  }
}
