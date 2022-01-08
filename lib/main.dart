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
          width: 50,
          height: 50,
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
            color: Color(0XFF0869E1),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        color: Colors.white,
        child: SizedBox(
          height: 50,
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
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: FaIcon(
                        FontAwesomeIcons.home,
                        color: currentTab == 0
                            ? const Color(0XFF0869E1)
                            : const Color(0X73050505),
                        size: 20,
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
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: FaIcon(
                        FontAwesomeIcons.search,
                        color: currentTab == 1
                            ? const Color(0XFF0869E1)
                            : const Color(0X73050505),
                        size: 20,
                      ),
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
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: FaIcon(
                        FontAwesomeIcons.mapMarkedAlt,
                        color: currentTab == 2
                            ? const Color(0XFF0869E1)
                            : const Color(0X73050505),
                        size: 20,
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
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: FaIcon(
                        FontAwesomeIcons.bars,
                        color: currentTab == 3
                            ? const Color(0XFF0869E1)
                            : const Color(0X73050505),
                        size: 20,
                      ),
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
