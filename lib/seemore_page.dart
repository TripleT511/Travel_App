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
      backgroundColor: const Color(0XFFF0F2F5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1.0,
        leadingWidth: 0,
        title: const Text(
          "Tài khoản",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
            color: Color(0XFF242A37),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0XFFFFFFFF),
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
                color: Color(0XFF242A37),
                size: 20,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Card(
              elevation: 1.0,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonalPage(user: user),
                    ),
                  );
                },
                minLeadingWidth: 10,
                leading: CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(hinhAnh),
                ),
                title: Text(
                  hoTen,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0XE6242A37),
                  ),
                ),
                subtitle: const Text(
                  "Xem Trang Cá Nhân",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF0066FF),
                  ),
                ),
              ),
            ),
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
