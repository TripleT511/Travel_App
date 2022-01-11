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
            "Cài đặt",
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditInforPage()));
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 25,
                              margin: const EdgeInsets.only(right: 15),
                              child: const FaIcon(
                                FontAwesomeIcons.userEdit,
                                size: 18,
                                color: Color(0XFF0066FF),
                              ),
                            ),
                            const Text(
                              "Chỉnh sửa thông tin cá nhân",
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
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    width: 374,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ChangePasswordPage()));
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 25,
                              margin: const EdgeInsets.only(right: 15),
                              child: const FaIcon(
                                FontAwesomeIcons.unlockAlt,
                                size: 18,
                                color: Color(0XFF0066FF),
                              ),
                            ),
                            const Text(
                              "Đổi mật khẩu",
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
            ],
          ),
        ));
  }
}
