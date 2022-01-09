import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CreatePostState();
  }
}

class CreatePostState extends State<CreatePost> {
  String dropdownValue = 'Công khai';
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
                color: Color(0XFF0869E1),
              )),
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Bài viết",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto',
                  color: Color(0XFF0869E1),
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
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          )),
      body: Column(
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
            subtitle: Row(
              children: [
                Container(
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
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: const TextField(
              decoration: InputDecoration(
                  hintText: "Bạn đang nghĩ gì...", border: InputBorder.none),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          ),
        ],
      ),
      bottomSheet: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {},
        child: Container(
          width: double.infinity,
          margin:
              const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 7),
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0XFF9F9F9F)),
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              FaIcon(
                FontAwesomeIcons.image,
                size: 18,
                color: Color(0XFF3EFF7F),
              ),
              Text(
                "   Ảnh",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Color(0XFF5C5C5C),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
