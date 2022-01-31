import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/Views/SplashScreen/splash_page1.dart';
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
      builder: EasyLoading.init(),
    ),
  );
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
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
  final List<Widget> screens = [
    const HomePage(),
    const SearchPage(),
    MapPage(),
    const SeeMorePage(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentSreen = const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageStorage(
        child: currentSreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        color: Colors.white,
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MaterialButton(
                onPressed: () {
                  setState(() {
                    currentSreen = const HomePage();
                    currentTab = 0;
                  });
                },
                minWidth: 40,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 22,
                  height: 22,
                  child: FaIcon(
                    FontAwesomeIcons.home,
                    color: currentTab == 0
                        ? const Color(0XFF0066FF)
                        : const Color(0XFFB1BCD0),
                    size: 22,
                  ),
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
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 22,
                  height: 22,
                  child: FaIcon(
                    FontAwesomeIcons.search,
                    color: currentTab == 1
                        ? const Color(0XFF0066FF)
                        : const Color(0XFFB1BCD0),
                    size: 22,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    currentSreen = MapPage();
                    currentTab = 2;
                  });
                },
                minWidth: 40,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 22,
                  height: 22,
                  child: FaIcon(
                    FontAwesomeIcons.mapMarkedAlt,
                    color: currentTab == 2
                        ? const Color(0XFF0066FF)
                        : const Color(0XFFB1BCD0),
                    size: 22,
                  ),
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
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 22,
                  height: 22,
                  child: FaIcon(
                    FontAwesomeIcons.userAlt,
                    color: currentTab == 3
                        ? const Color(0XFF0066FF)
                        : const Color(0XFFB1BCD0),
                    size: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
