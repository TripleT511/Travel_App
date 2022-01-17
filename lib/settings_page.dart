import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/changepw_page.dart';
import 'package:vietnam_travel_app/edit_info_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0XFFF0F2F5),
        appBar: AppBar(
          elevation: 1.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: Color(0XFF242A37),
              size: 20,
            ),
          ),
          backgroundColor: const Color(0XFFFFFFFF),
          shadowColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Cài đặt",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
              color: Color(0XFF242A37),
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
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
                            builder: (context) => const EditInforPage()));
                  },
                  minLeadingWidth: 10,
                  leading: const FaIcon(
                    FontAwesomeIcons.userAlt,
                    size: 18,
                    color: Color(0XFF0066FF),
                  ),
                  title: const Text(
                    "Thông tin tài khoản",
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChangePasswordPage()));
                  },
                  minLeadingWidth: 10,
                  leading: const FaIcon(
                    FontAwesomeIcons.unlockAlt,
                    size: 18,
                    color: Color(0XFF0066FF),
                  ),
                  title: const Text(
                    "Đổi mật khẩu",
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
            ],
          ),
        ));
  }
}
