import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/changepw_page.dart';
import 'package:vietnam_travel_app/form_change_info.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PersonalPageState();
  }
}

class PersonalPageState extends State<PersonalPage> {
  bool checkLike = true;
  bool checkUnLike = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 173,
                child: Image.asset(
                  "images/h.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 122,
                left: 20,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage(
                          "images/avatar.jpg",
                        ),
                        fit: BoxFit.cover),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                    border: Border.all(width: 5, color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                top: 180,
                left: 80,
                child: IconButton(
                  onPressed: () {},
                  icon: Container(
                    width: 25,
                    height: 25,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0XFFE4E6EB),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: FaIcon(
                        FontAwesomeIcons.camera,
                        color: Color(0XFF050505),
                        size: 14,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 125,
                right: 10,
                child: IconButton(
                  onPressed: () {},
                  icon: Container(
                    width: 25,
                    height: 25,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0XFFE4E6EB),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: FaIcon(
                        FontAwesomeIcons.camera,
                        color: Color(0XFF050505),
                        size: 14,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 5,
                child: PopupMenuButton(
                  icon: const SizedBox(
                    width: 30,
                    height: 30,
                    child: FaIcon(
                      FontAwesomeIcons.cog,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(Icons.lock_outline),
                        title: const Text(
                          'Đổi mật khẩu',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              color: Color(0XFF050505),
                              fontSize: 16),
                        ),
                        subtitle: const Text(
                          'Thay đổi mật khẩu',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              color: Color(0XFF65676B),
                              fontSize: 16),
                        ),
                        onTap: () {
                          setState(() {});
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChangePasswordPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(Icons.border_color_outlined),
                        title: const Text(
                          'Chỉnh sửa thông tin ',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              color: Color(0XFF050505),
                              fontSize: 16),
                        ),
                        subtitle: const Text(
                          'Thay đổi thông tin cá nhân',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              color: Color(0XFF65676B),
                              fontSize: 16),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => form_change_info(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 130),
            child: const Text(
              "Akagami no Shankusu",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
              ),
              softWrap: true,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '50',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color(0XFF0869E1),
                    ),
                  ),
                  Text(
                    'Bài viết',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Color(0XFF65676B),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '12',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color(0XFF0869E1),
                    ),
                  ),
                  Text(
                    'Tỉnh thành',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Color(0XFF65676B),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border.fromBorderSide(
                BorderSide(
                  width: 0.5,
                  color: Color(0XFFD2D4D8),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                FaIcon(
                  FontAwesomeIcons.clone,
                  color: Color(0XFF050505),
                  size: 18,
                ),
                Text(
                  " Bài viết đã chia sẻ",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Color(0XFF050505),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            decoration: const BoxDecoration(
                border: Border.fromBorderSide(
                    BorderSide(width: 2.5, color: Color(0XFFF0F2F5)))),
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage("images/avatar.jpg"),
            ),
            title: const Text(
              "Akagami no Shankusu",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
                fontSize: 16,
              ),
            ),
            subtitle: const Align(
              alignment: Alignment.centerLeft,
              child: Text("23-12-2021"),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.ellipsisH,
                size: 18,
              ),
            ),
          ),
          Image.asset(
            "images/slide_1.jpg",
            height: 240,
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 5, left: 10),
            child: Text(
              "Hạ Long Bay is a UNESCO World Heritage Site and popular travel destination in Quảng Ninh Province, Vietnam",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                color: Color(0XFF050505),
                height: 1.4,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: TextButton(
              onPressed: () {},
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color(0XFF0869E1),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    "Ho Chi Minh City, Viet Nam",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0XFF0869E1),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.solidEye,
                      color: Color(0XFF65676B),
                      size: 18,
                    ),
                    Text(
                      " 10k lượt xem",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0XFF65676B),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        "1.2k lượt thích",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0XFF65676B),
                        ),
                      ),
                      Text(
                        "56 lượt không thích",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0XFF65676B),
                        ),
                      ),
                    ]),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: const BoxDecoration(
                    border: Border.fromBorderSide(
                      BorderSide(
                        width: 0.5,
                        color: Color(0XFFD2D4D8),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.thumb_up,
                            color: Color(0XFF0869E1),
                          ),
                        ),
                        const Text(
                          "Thích",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0XFF65676B),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.thumb_down_outlined,
                              color: Colors.grey),
                        ),
                        const Text(
                          "Không thích",
                          style: TextStyle(
                            color: Color(0XFF65676B),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border.fromBorderSide(
                      BorderSide(
                        width: 0.5,
                        color: Color(0XFFD2D4D8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: const Color(0XFF0869E1),
        child: const FaIcon(FontAwesomeIcons.arrowLeft),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
