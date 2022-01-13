import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vietnam_travel_app/Models/user_object.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';
import 'package:vietnam_travel_app/Views/SplashScreen/splash_page2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/personal_page.dart';
import 'package:vietnam_travel_app/settings_page.dart';

class SeeMorePage extends StatefulWidget {
  const SeeMorePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SeeMorePageState();
  }
}

class SeeMorePageState extends State<SeeMorePage> {
  late final UserObject user;
  String hinhAnh =
      'https://shielded-lowlands-87962.herokuapp.com/images/user-default.jpg';
  String hoTen = '';
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

  _loadUser() async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    setState(() {});
    String us = pres.getString("user") ?? '';
    String img = pres.getString("hinhAnh") ?? '';
    user = UserObject.fromJson(jsonDecode(us));
    setState(() {
      hoTen = user.hoTen;
      hinhAnh = 'https://shielded-lowlands-87962.herokuapp.com/' + img;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leadingWidth: 0,
        title: const Text(
          "Tài khoản",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
            color: Color(0XFFFFFFFF),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0XFF0066FF),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              },
              icon: const FaIcon(
                FontAwesomeIcons.cog,
                color: Color(0XFFFFFFFF),
                size: 21,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0XFF0066FF),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 65,
                  child: Card(
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      width: 374,
                      height: 60,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PersonalPage(user: user),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(hinhAnh),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    hoTen,
                                    style: const TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0XFF0066FF),
                                    ),
                                  ),
                                  const Text(
                                    "Trang cá nhân",
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0XE6242A37),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Card(
                  elevation: 1.0,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    onTap: () {},
                    minLeadingWidth: 10,
                    leading: const FaIcon(
                      FontAwesomeIcons.solidPaperPlane,
                      size: 18,
                      color: Color(0XFF0066FF),
                    ),
                    title: const Text(
                      "Đề xuất địa danh",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0XFF242A37),
                      ),
                    ),
                    trailing: const FaIcon(
                      FontAwesomeIcons.chevronRight,
                      size: 18,
                      color: Color(0XFF0066FF),
                    ),
                  ),
                ),
                Card(
                  elevation: 1.0,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    onTap: () {
                      _logout();
                    },
                    minLeadingWidth: 10,
                    leading: const FaIcon(
                      FontAwesomeIcons.signOutAlt,
                      size: 18,
                      color: Color(0XFF0066FF),
                    ),
                    title: const Text(
                      "Đăng xuất",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0XFF242A37),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
