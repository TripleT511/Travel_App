import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';
import 'package:vietnam_travel_app/Views/SplashScreen/splash_page2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SeeMorePage extends StatefulWidget {
  const SeeMorePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SeeMorePageState();
  }
}

class SeeMorePageState extends State<SeeMorePage> {
  void _logout() async {
    bool log = await UserProvider.logout();
    if (log) {
      SharedPreferences pres = await SharedPreferences.getInstance();
      pres.setString('email', '');
      pres.setString('password', '');
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const SplashPage2()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const FaIcon(
                FontAwesomeIcons.arrowLeft,
                color: Color(0XFF0869E1),
              )),
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          title: const Text(
            "Xem thêm",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
                color: Color(0XFF0869E1)),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 60,
                child: Card(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    width: 374,
                    height: 50,
                    child: TextButton(
                      onPressed: () {},
                      child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            FaIcon(
                              FontAwesomeIcons.solidPaperPlane,
                              size: 18,
                              color: Color(0XFF050505),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Đề xuất địa danh lên hệ thống",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0XFF050505),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: Card(
                  color: const Color(0XFF0869E1),
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3.0,
                  child: SizedBox(
                    width: 374,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        _logout();
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            FaIcon(
                              FontAwesomeIcons.signOutAlt,
                              size: 18,
                              color: Color(0XFFFFFFFF),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Đăng xuất",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0XFFFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
