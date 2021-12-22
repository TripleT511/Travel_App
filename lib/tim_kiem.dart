import 'package:flutter/material.dart';
import 'package:travel_p/main.dart';

class search_tab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return search_tabState();
  }
}

class search_tabState extends State<search_tab> {
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
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyApp()));
                            },
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
                                height: 40,
                                width: 40,
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
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                    border: Border.fromBorderSide(
                        BorderSide(width: 1, color: Colors.grey.shade300))),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Text(
                  "ĐIỂM ĐẾN",
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
                            style: TextStyle(
                                color: Color(0XFF65676B), fontSize: 17),
                          ),
                        )
                      ],
                    )),
              ),
              Container(
                  height: 300,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 65),
                        child: Table(
                          children: [
                            TableRow(children: [
                              Container(
                                height: 30,
                                child: Text("Long An"),
                              ),
                              Container(
                                height: 30,
                                child: Text("Long An"),
                              )
                            ]),
                            TableRow(children: [
                              Container(
                                height: 30,
                                child: Text("Long An"),
                              ),
                              Container(
                                height: 30,
                                child: Text("Long An"),
                              )
                            ]),
                            TableRow(children: [
                              Container(
                                height: 30,
                                child: Text("Long An"),
                              ),
                              Container(
                                height: 30,
                                child: Text("Long An"),
                              )
                            ]),
                            TableRow(children: [
                              Container(
                                height: 30,
                                child: Text("Long An"),
                              ),
                              Container(
                                height: 30,
                                child: Text("Long An"),
                              )
                            ]),
                            TableRow(children: [
                              Container(
                                height: 30,
                                child: Text("Long An"),
                              ),
                              Container(
                                height: 30,
                                child: Text("Long An"),
                              )
                            ]),
                            TableRow(children: [
                              Container(
                                height: 30,
                                child: Text("Long An"),
                              ),
                              Container(
                                height: 30,
                                child: Text("Long An"),
                              )
                            ]),
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
