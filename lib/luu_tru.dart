import 'package:flutter/material.dart';

class LuuTru extends StatefulWidget {
  const LuuTru({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LuuTruState();
  }
}

class LuuTruState extends State<LuuTru> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: SizedBox(
                              width: 95,
                              child: Image.asset("images/logo-ver3.png"),
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                          "images/a.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50.0)),
                                    border: Border.all(
                                        width: 2, color: Colors.white))))
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                decoration: const BoxDecoration(
                    border: Border.fromBorderSide(
                        BorderSide(width: 0.5, color: Colors.grey))),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: const Text(
                  "Lưu Trú - Hồ Chí Minh",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF0869E1),
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {}, // Handle your callback
            child: Column(
              children: [
                SizedBox(
                  height: 265,
                  width: 374,
                  child: Card(
                    elevation: 3.0,
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(16.0),
                        topEnd: Radius.circular(16.0),
                        bottomStart: Radius.circular(16.0),
                        bottomEnd: Radius.circular(16.0),
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "images/luutru1.jpg",
                          width: 374,
                          height: 132,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20, bottom: 12),
                          child: const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Khách Sạn Sunny",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0XFF000000),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15, bottom: 12),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.place,
                                color: Color(0XFF0869E1),
                              ),
                              Text(
                                " 65, Huỳnh Thúc Kháng, P.Bến Nghé, Q.1, Tp.HCM",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0XFF050505),
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15, bottom: 12),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.access_time_outlined,
                                color: Color(0XFF0869E1),
                              ),
                              Text(
                                " 12 a.m - 10 p.m",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0XFF050505),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          InkWell(
            onTap: () {}, // Handle your callback
            child: Column(
              children: [
                SizedBox(
                  height: 265,
                  width: 374,
                  child: Card(
                    elevation: 3.0,
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(16.0),
                        topEnd: Radius.circular(16.0),
                        bottomStart: Radius.circular(16.0),
                        bottomEnd: Radius.circular(16.0),
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "images/luutru.jpg",
                          width: 374,
                          height: 132,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20, bottom: 12),
                          child: const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Khách Sạn Sunny",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0XFF000000),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15, bottom: 12),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.place,
                                color: Color(0XFF0869E1),
                              ),
                              Text(
                                " " +
                                    "65, Huỳnh Thúc Kháng, P.Bến Nghé, Q.1, Tp.HCM",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0XFF050505),
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15, bottom: 12),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.access_time_outlined,
                                color: Color(0XFF0869E1),
                              ),
                              Text(
                                "12 a.m - 10 p.m",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0XFF050505),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
