import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vietnam_travel_app/chitiet_luu_tru.dart';

class luu_tru extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return luu_truState();
  }
}

class luu_truState extends State<luu_tru> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Image.network("sadad"),
          const ListTile(
            title: Icon(Icons.add),
            subtitle: Icon(Icons.add),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Container(
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
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "images/a.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0)),
                                    border: Border.all(
                                        width: 2, color: Colors.white))))
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                    border: Border.fromBorderSide(
                        BorderSide(width: 1, color: Colors.grey))),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Text(
                  "LƯU TRÚ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF0869E1)),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      width: 360,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Nhập điểm cần đến....",
                            prefixIcon: Icon(
                              Icons.place,
                              color: Color(0XFF0869E1),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.near_me_outlined),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "Sử dụng vị trí của bạn ngay bây giờ",
                            style: TextStyle(color: Colors.grey, fontSize: 17),
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 15, bottom: 10),
            child: Text(
              "Hồ Chí Minh",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => chitiet_luutru()));
            },
            child: Expanded(
                child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(20),
                          topEnd: Radius.circular(20))),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    "images/z.jpg",
                    width: double.maxFinite,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Text("Khách Sạn Wano"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [Icon(Icons.place), Text("Ho Chi Minh")],
                          )),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.access_time_outlined),
                              Text("12 a.m - 10 p.m")
                            ],
                          )),
                    ),
                  ],
                ),
              ],
            )),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
                border: Border.fromBorderSide(
                    BorderSide(width: 1, color: Colors.grey))),
          ),
          TextButton(
            onPressed: () {},
            child: Expanded(
                child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(20),
                          topEnd: Radius.circular(20))),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    "images/z.jpg",
                    width: double.maxFinite,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Text("Khách Sạn Wano"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [Icon(Icons.place), Text("Ho Chi Minh")],
                          )),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.access_time_outlined),
                              Text("12 a.m - 10 p.m")
                            ],
                          )),
                    ),
                  ],
                ),
              ],
            )),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
                border: Border.fromBorderSide(
                    BorderSide(width: 1, color: Colors.grey))),
          ),
          TextButton(
            onPressed: () {},
            child: Expanded(
                child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(20),
                          topEnd: Radius.circular(20))),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    "images/z.jpg",
                    width: double.maxFinite,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Text("Khách Sạn Wano"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [Icon(Icons.place), Text("Ho Chi Minh")],
                          )),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.access_time_outlined),
                              Text("12 a.m - 10 p.m")
                            ],
                          )),
                    ),
                  ],
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
