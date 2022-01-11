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
              color: Color(0XFF242A37),
              size: 21,
            ),
          ),
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Xem thêm",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'Roboto',
              color: Color(0XFF242A37),
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
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
                              color: Color(0XFF0066FF),
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
                                color: Color(0XFF242A37),
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
                  color: const Color(0XFF0066FF),
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
