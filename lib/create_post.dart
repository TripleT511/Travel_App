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
              child: Container(
                height: 35,
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: const Color(0XFFE4E6EB),
                ),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const FaIcon(
                    FontAwesomeIcons.chevronDown,
                    color: Color(0XFF050505),
                    size: 14,
                  ),
                  elevation: 3,
                  underline: const SizedBox(),
                  style: const TextStyle(
                    color: Color(0XFF050505),
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Công khai', 'Chỉ mình tôi']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
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
