import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/Models/user_object.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';
import 'package:vietnam_travel_app/Views/SplashScreen/splash_page1.dart';
import 'package:vietnam_travel_app/Views/baiviet/create_post.dart';
import 'package:vietnam_travel_app/home_tab.dart';
import 'package:vietnam_travel_app/Views/Map/map_page.dart';
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
      builder: EasyLoading.init(),
    ),
  );
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = const Color(0XFF0066FF)
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..textStyle = const TextStyle(
      color: Color(0XFF242A37),
      fontSize: 14.0,
    )
    ..successWidget = const FaIcon(
      FontAwesomeIcons.solidCheckCircle,
      color: Color(0XFF0066FF),
      size: 22,
    )
    ..errorWidget = const FaIcon(
      FontAwesomeIcons.solidTimesCircle,
      color: Color(0XFFFF2D55),
      size: 22,
    )
    ..infoWidget = const FaIcon(
      FontAwesomeIcons.infoCircle,
      color: Color(0XFF0066FF),
      size: 22,
    )
    ..userInteractions = true
    ..dismissOnTap = false;
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
  late UserObject user;
  final List<Widget> screens = [
    const HomePage(),
    const SearchPage(),
    MapPage(),
    const SeeMorePage(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentSreen = const HomePage();
  _loadUser() async {
    final data = await UserProvider.getUser();
    if (mounted) {
      setState(() {
        user = data;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageStorage(
        child: currentSreen,
        bucket: bucket,
      ),
      floatingActionButton: SizedBox(
        width: 50,
        height: 50,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreatePost(user: user),
                ),
              );
            },
            child: const FaIcon(
              FontAwesomeIcons.plus,
              color: Colors.white,
              size: 20,
            ),
            elevation: 3.0,
            tooltip: "Tạo bài viết",
            backgroundColor: const Color(0XFF0066FF),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          color: Colors.white,
          child: SizedBox(
            height: 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.home,
                            color: currentTab == 0
                                ? const Color(0XFF0066FF)
                                : const Color(0XFFB1BCD0),
                            size: 16,
                          ),
                          Text(
                            "Trang chủ",
                            style: TextStyle(
                              fontSize: 12,
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              color: currentTab == 0
                                  ? const Color(0XFF0066FF)
                                  : const Color(0XFFB1BCD0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.search,
                            color: currentTab == 1
                                ? const Color(0XFF0066FF)
                                : const Color(0XFFB1BCD0),
                            size: 16,
                          ),
                          Text(
                            "Tìm kiếm",
                            style: TextStyle(
                              fontSize: 12,
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              color: currentTab == 1
                                  ? const Color(0XFF0066FF)
                                  : const Color(0XFFB1BCD0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentSreen = MapPage();
                          currentTab = 2;
                        });
                      },
                      minWidth: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.solidMap,
                            color: currentTab == 2
                                ? const Color(0XFF0066FF)
                                : const Color(0XFFB1BCD0),
                            size: 16,
                          ),
                          Text(
                            "Bản đồ",
                            style: TextStyle(
                              fontSize: 12,
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              color: currentTab == 2
                                  ? const Color(0XFF0066FF)
                                  : const Color(0XFFB1BCD0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.userAlt,
                            color: currentTab == 3
                                ? const Color(0XFF0066FF)
                                : const Color(0XFFB1BCD0),
                            size: 16,
                          ),
                          Text(
                            "Xem thêm",
                            style: TextStyle(
                              fontSize: 12,
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              color: currentTab == 3
                                  ? const Color(0XFF0066FF)
                                  : const Color(0XFFB1BCD0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
