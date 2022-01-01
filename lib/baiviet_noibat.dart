import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/main.dart';
import 'package:vietnam_travel_app/personal_page.dart';

class BaiVietNoiBatPage extends StatefulWidget {
  const BaiVietNoiBatPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BaiVietNoiBatPageState();
  }
}

class BaiVietNoiBatPageState extends State<BaiVietNoiBatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: null,
          leadingWidth: 0,
          titleSpacing: 0,
          elevation: 1.5,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyApp()));
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  width: 95,
                  child: Image.asset("images/logo-ver3.png"),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PersonalPage()));
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 5),
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xff7c94b6),
                    image: DecorationImage(
                      image: AssetImage('images/avatar.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    "Bài viết nổi bật",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 1, color: Colors.grey.shade300)),
                ),
                ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PersonalPage()));
                            },
                            leading: const CircleAvatar(
                              backgroundImage: AssetImage("images/avatar.jpg"),
                            ),
                            title: const Text(
                              "Phuc Nguyen",
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
                            width: 392,
                            fit: BoxFit.cover,
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(top: 10, bottom: 5, left: 10),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 10, 5),
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
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, right: 10),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                                          icon: const Icon(
                                              Icons.thumb_down_outlined,
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
                      );
                    }),
              ],
            )
          ],
        ));
  }
}
