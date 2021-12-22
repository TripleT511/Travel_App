import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class create_post extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return create_postState();
  }
}

class create_postState extends State<create_post> {
  List items = ['Công khai', 'Chỉ mình tôi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color(0XFF0869E1),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 80),
              child: Text(
                "Bài viết",
                style: TextStyle(
                    color: Color(0XFF0869E1),
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Color(0XFF0869E1),
                    borderRadius: BorderRadius.circular(5)),
                width: 65,
                height: 35,
                margin: EdgeInsets.only(left: 75),
                child: Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Post",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            child: ListTile(
              leading: Container(
                width: 50,
                height: 50,
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/a.jpg"),
                ),
              ),
              title: Text(
                "Phuc Nguyen",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    child: Row(
                  children: [
                    Text(
                      "Công khai",
                      style: TextStyle(color: Colors.black),
                    ),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                )),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Bạn đang nghĩ gì...", border: InputBorder.none),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          ),
        ],
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {},
            child: Container(
              height: 35,
              width: 160,
              margin: EdgeInsets.only(bottom: 30, left: 20),
              padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0XFF65676B)),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  Icon(
                    Icons.photo_library,
                    color: Colors.greenAccent,
                  ),
                  Text("Ảnh")
                ],
              ),
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Container(
                height: 35,
                width: 160,
                margin: EdgeInsets.only(bottom: 30, right: 20),
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0XFF65676B)),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: Colors.redAccent,
                    ),
                    Text("Địa điểm")
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
