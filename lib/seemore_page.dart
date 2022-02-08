import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vietnam_travel_app/Global/variables.dart';
import 'package:vietnam_travel_app/Models/user_object.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';
import 'package:vietnam_travel_app/Views/SplashScreen/splash_page2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/de_xuat_dia_danh.dart';
import 'package:vietnam_travel_app/Views/User/personal_page.dart';
import 'package:vietnam_travel_app/Views/User/settings_page.dart';

// ignore: must_be_immutable
class SeeMorePage extends StatefulWidget {
  const SeeMorePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return SeeMorePageState();
  }
}

class SeeMorePageState extends State<SeeMorePage> {
  late UserObject user;
  String hinhAnh = urlImage + 'images/user-default.jpg';
  String hoTen = '';
  void _logout() async {
    bool log = await UserProvider.logout();
    SharedPreferences pres = await SharedPreferences.getInstance();
    pres.setString('user', "");
    if (log) {
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
    user = UserObject.fromJson(jsonDecode(us));
    setState(() {
      hoTen = user.hoTen;
      hinhAnh = urlImage + user.hinhAnh;
    });
  }

  Dialog dialog(String title, String des) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Color(0XFF242A37),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              des,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0XFF242A37),
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(
            height: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5 - 10,
                    height: 50,
                    child: InkWell(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                      ),
                      highlightColor: Colors.grey[200],
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Center(
                        child: Text(
                          "Hủy",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            color: Color(0XFFB1BCD0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5 - 10,
                    height: 50,
                    child: InkWell(
                      highlightColor: Colors.grey[200],
                      onTap: () {
                        _logout();
                      },
                      child: const Center(
                        child: Text(
                          "Đăng xuất",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0XFF0066FF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
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
            fontSize: 18,
            fontWeight: FontWeight.w700,
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
                    builder: (context) => const SettingsPage(),
                  ),
                ).then((value) => setState(() async {
                      SharedPreferences pres =
                          await SharedPreferences.getInstance();
                      String us = pres.getString("user") ?? '';
                      UserObject newUser = UserObject.fromJson(jsonDecode(us));
                      setState(() {
                        hoTen = newUser.hoTen;
                        user = newUser;
                        hinhAnh = urlImage + newUser.hinhAnh;
                      });
                    }));
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
                  ).then((value) => setState(() async {
                        SharedPreferences pres =
                            await SharedPreferences.getInstance();
                        String us = pres.getString("user") ?? '';
                        UserObject newUser =
                            UserObject.fromJson(jsonDecode(us));
                        setState(() {
                          hoTen = newUser.hoTen;
                          user = newUser;
                          hinhAnh = urlImage + newUser.hinhAnh;
                        });
                      }));
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeXuatDiaDanh(),
                        ),
                      );
                    },
                    minLeadingWidth: 10,
                    leading: const CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.transparent,
                      child: FaIcon(
                        FontAwesomeIcons.solidPaperPlane,
                        size: 18,
                        color: Color(0XFF0066FF),
                      ),
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
                      showDialog(
                        barrierColor: Colors.black26,
                        context: context,
                        builder: (context) {
                          return dialog("Đăng xuất",
                              "Bạn muốn đăng xuất khỏi tài khoản này");
                        },
                      );
                    },
                    minLeadingWidth: 10,
                    leading: const CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.transparent,
                      child: FaIcon(
                        FontAwesomeIcons.signOutAlt,
                        size: 18,
                        color: Color(0XFF0066FF),
                      ),
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
