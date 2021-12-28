import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/personal_page.dart';

import 'main.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: const Text(
                  "ĐIỂM ĐẾN",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF0869E1)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  height: 45.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white),
                  child: TextField(
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: "Nhập đia điểm cần đến",
                      contentPadding:
                          const EdgeInsets.only(left: 15.0, top: 15.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Color(0XFFB9B9B9)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Color(0XFF0869E1)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: const FaIcon(
                        FontAwesomeIcons.search,
                        size: 20,
                      ),
                    ),
                    onChanged: (val) {},
                    onSubmitted: (term) {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.near_me_outlined),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: const Text(
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
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 65),
                        child: Table(
                          children: const [
                            TableRow(children: [
                              SizedBox(
                                height: 30,
                                child: Text("Long An"),
                              ),
                              SizedBox(
                                height: 30,
                                child: Text("Long An"),
                              )
                            ]),
                            TableRow(children: [
                              SizedBox(
                                height: 30,
                                child: Text("Long An"),
                              ),
                              SizedBox(
                                height: 30,
                                child: Text("Long An"),
                              )
                            ]),
                            TableRow(children: [
                              SizedBox(
                                height: 30,
                                child: Text("Long An"),
                              ),
                              SizedBox(
                                height: 30,
                                child: Text("Long An"),
                              )
                            ]),
                            TableRow(children: [
                              SizedBox(
                                height: 30,
                                child: Text("Long An"),
                              ),
                              SizedBox(
                                height: 30,
                                child: Text("Long An"),
                              )
                            ]),
                            TableRow(children: [
                              SizedBox(
                                height: 30,
                                child: Text("Long An"),
                              ),
                              SizedBox(
                                height: 30,
                                child: Text("Long An"),
                              )
                            ]),
                            TableRow(children: [
                              SizedBox(
                                height: 30,
                                child: Text("Long An"),
                              ),
                              SizedBox(
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
