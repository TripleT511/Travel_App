import 'package:flutter/material.dart';
import 'package:travel_p/form_change_info.dart';
import 'package:travel_p/form_change_pass.dart';

class trang_ca_nhan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return trang_ca_nhanState();
  }
}

class trang_ca_nhanState extends State<trang_ca_nhan> {
  bool checkLike = true;
  bool checkUnLike = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                child: Image.asset(
                  "images/z.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 172,
                left: 20,
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "images/a.jpg",
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        border: Border.all(width: 2, color: Colors.white))),
              ),
              Positioned(
                top: 220,
                left: 75,
                child: IconButton(
                    onPressed: () {},
                    icon: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade300,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          size: 20,
                        ))),
              ),
              Positioned(
                top: 170,
                right: 10,
                child: IconButton(
                    onPressed: () {},
                    icon: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade300,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          size: 20,
                        ))),
              ),
              Positioned(
                  top: 10,
                  right: 10,
                  child: PopupMenuButton(
                    icon: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade300,
                        ),
                        child: Icon(
                          Icons.settings,
                          size: 20,
                        )),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: ListTile(
                          leading: Icon(Icons.lock_outline),
                          title: Text('Đổi mật khẩu'),
                          subtitle: Text('Thay đổi mật khẩu'),
                          onTap: () {
                            setState(() {});
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => form_change_pass()));
                          },
                        ),
                      ),
                      PopupMenuItem(
                        child: ListTile(
                          leading: Icon(Icons.border_color_outlined),
                          title: Text('Chỉnh sửa thông tin '),
                          subtitle: Text('Thay đổi thông tin cá nhân'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => form_change_info()));
                          },
                        ),
                      ),
                    ],
                  ))
            ],
          ),
          SizedBox(
            height: 55,
          ),
          Container(
            padding: EdgeInsets.only(left: 15, bottom: 10),
            child: Text(
              "Phuc Nguyen",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
                border: Border.fromBorderSide(
                    BorderSide(width: 1, color: Colors.grey.shade300))),
          ),
          TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.border_all), Text("Bài viết đã chia sẻ")],
              )),
          Container(
            margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
                border: Border.fromBorderSide(
                    BorderSide(width: 2.5, color: Colors.grey.shade300))),
          ),
          Container(
            child: ListTile(
              leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "images/a.jpg",
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      border: Border.all(width: 2, color: Colors.white))),
              title: Text(
                "Phuc Nguyen",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Align(
                alignment: Alignment.centerLeft,
                child: Text("13 giờ"),
              ),
              trailing:
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
            ),
          ),
          Container(
            child: Image.asset("images/i.jpg"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 25, right: 25, left: 25),
            child: Text("Đẹp vl !"),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextButton(
                onPressed: () {},
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0XFF0869E1)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text("Ho Chi Minh City,Viet Nam"),
                  ),
                )),
          ),
          Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.remove_red_eye, color: Colors.grey),
                      Text("10k lượt xem")
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [Text("1.2k lượt thích")],
                      ),
                      Row(
                        children: [Text("56 lượt không thích")],
                      ),
                      Row(
                        children: [Text("5.6k lượt chia sẻ")],
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        border: Border.fromBorderSide(
                            BorderSide(width: 1, color: Colors.grey.shade300))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {});
                              checkLike = !checkLike;
                            },
                            icon: checkLike
                                ? Icon(Icons.thumb_up, color: Color(0XFF0869E1))
                                : Icon(Icons.thumb_up_outlined,
                                    color: Colors.grey),
                          ),
                          Text("Thích")
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {});
                              checkUnLike = !checkUnLike;
                            },
                            icon: checkUnLike
                                ? Icon(Icons.thumb_down,
                                    color: Color(0XFF0869E1))
                                : Icon(Icons.thumb_down_outlined,
                                    color: Colors.grey),
                          ),
                          Text("Không thích")
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon:
                                Icon(Icons.share_outlined, color: Colors.grey),
                          ),
                          Text("Chia sẻ")
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                        border: Border.fromBorderSide(
                            BorderSide(width: 1, color: Colors.grey.shade300))),
                  )
                ],
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
