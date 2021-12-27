import 'package:flutter/material.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CreatePostState();
  }
}

class CreatePostState extends State<CreatePost> {
  List items = ['Công khai', 'Chỉ mình tôi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0XFF0869E1),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 80),
              child: const Text(
                "Bài viết",
                style: TextStyle(
                    color: Color(0XFF0869E1),
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: const Color(0XFF0869E1),
                    borderRadius: BorderRadius.circular(5)),
                width: 65,
                height: 35,
                margin: const EdgeInsets.only(left: 75),
                child: Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Post",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))),
          ],
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const SizedBox(
              width: 50,
              height: 50,
              child: CircleAvatar(
                backgroundImage: AssetImage("images/a.jpg"),
              ),
            ),
            title: const Text(
              "Phuc Nguyen",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: const [
                  Text(
                    "Công khai",
                    style: TextStyle(color: Colors.black),
                  ),
                  Icon(Icons.keyboard_arrow_down)
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: const TextField(
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
              margin: const EdgeInsets.only(bottom: 30, left: 20),
              padding:
                  const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0XFF65676B)),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: const [
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
                margin: const EdgeInsets.only(bottom: 30, right: 20),
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 5, bottom: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0XFF65676B)),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: const [
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
