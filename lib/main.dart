import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/Views/SplashScreen/splash_page1.dart';
import 'package:vietnam_travel_app/create_post.dart';
import 'package:vietnam_travel_app/home_tab.dart';
import 'package:vietnam_travel_app/map_page.dart';
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
  int currentTab = 0;
  final List<Widget> screens = const [
    HomePage(),
    SearchPage(),
    MapPage(),
    SeeMorePage(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentSreen = const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentSreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 3.0,
        onPressed: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const CreatePost()));
        },
        backgroundColor: const Color(0XFF0869E1),
        child: Container(
          width: 56,
          height: 56,
          child: const Align(
            alignment: Alignment.center,
            child: FaIcon(
              FontAwesomeIcons.plus,
              size: 20,
              color: Colors.white,
            ),
          ),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xff00D1FF),
                Color(0XFF0869E1),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        color: Colors.white,
        child: SizedBox(
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentSreen = const HomePage();
                        currentTab = 0;
                      });
                    },
                    minWidth: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.home,
                          color: currentTab == 0
                              ? const Color(0XFF0869E1)
                              : const Color(0X99050505),
                          size: 20,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Trang chủ',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: currentTab == 0
                                ? const Color(0XFF0869E1)
                                : const Color(0X99050505),
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentSreen = const SearchPage();
                        currentTab = 1;
                      });
                    },
                    minWidth: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.search,
                          color: currentTab == 1
                              ? const Color(0XFF0869E1)
                              : const Color(0X99050505),
                          size: 20,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Tìm kiếm',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: currentTab == 1
                                ? const Color(0XFF0869E1)
                                : const Color(0X99050505),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentSreen = const MapPage();
                        currentTab = 2;
                      });
                    },
                    minWidth: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.mapMarkedAlt,
                          color: currentTab == 2
                              ? const Color(0XFF0869E1)
                              : const Color(0X99050505),
                          size: 20,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Bản đồ',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: currentTab == 2
                                ? const Color(0XFF0869E1)
                                : const Color(0X99050505),
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentSreen = const SeeMorePage();
                        currentTab = 3;
                      });
                    },
                    minWidth: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.bars,
                          color: currentTab == 3
                              ? const Color(0XFF0869E1)
                              : const Color(0X99050505),
                          size: 20,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Xem thêm',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: currentTab == 3
                                ? const Color(0XFF0869E1)
                                : const Color(0X99050505),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
