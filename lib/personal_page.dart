import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/settings_page.dart';

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
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0X1A050505),
        elevation: 0,
        leading: null,
        leadingWidth: 0,
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.white,
                ),
              ),
            ),
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
                  color: Colors.white,
                  size: 25,
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Image.asset(
                    "images/slide_1.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 150,
                  left: 10,
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
                  top: 205,
                  left: 70,
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
                  top: 145,
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
            // Container(
            //   decoration: const BoxDecoration(
            //     border: Border.fromBorderSide(
            //       BorderSide(
            //         width: 0.5,
            //         color: Color(0XFFD2D4D8),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Card(
                elevation: 3.0,
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.clone,
                        color: Color(0XFF050505),
                        size: 15,
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
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
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
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      decoration: const BoxDecoration(
                        border: Border.fromBorderSide(
                          BorderSide(
                            width: 2.5,
                            color: Color(0XFFF0F2F5),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
