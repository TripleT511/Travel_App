import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vietnam_travel_app/Global/variables.dart';
import 'package:vietnam_travel_app/Models/baiviet_object.dart';
import 'package:vietnam_travel_app/Models/user_object.dart';
import 'package:vietnam_travel_app/Providers/baiviet_provider.dart';
import 'package:http/http.dart' as http;
import 'package:vietnam_travel_app/main.dart';

class EditPost extends StatefulWidget {
  final int idDiaDanh;
  final String tenDiaDanh;
  final BaiVietChiaSeObject post;
  final UserObject user;
  const EditPost(
      {Key? key,
      required this.idDiaDanh,
      required this.tenDiaDanh,
      required this.user,
      required this.post})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return EditPostState(
        idDiaDanh: idDiaDanh, tenDiaDanh: tenDiaDanh, post: post, user: user);
  }
}

class EditPostState extends State<EditPost> {
  final int idDiaDanh;
  final String tenDiaDanh;
  final BaiVietChiaSeObject post;
  final UserObject user;
  EditPostState(
      {required this.idDiaDanh,
      required this.tenDiaDanh,
      required this.post,
      required this.user});
  final TextEditingController txtNoiDung = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var _image;
  final picker = ImagePicker();
  int idUser = 0;
  bool isPost = true;
  String hoTenUser = '';
  String hinhAnh = '';
  Future pickerImage() async {
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {});
      _image = File(pickedFile.path);
      isPost = true;
    } else {
      const snackBar = SnackBar(content: Text('Chưa chọn ảnh'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  _editPost() async {
    bool isSuccess = await BaiVietProvider.editPost(
        _image,
        idDiaDanh.toString(),
        user.id.toString(),
        txtNoiDung.text,
        post.id.toString());

    // ignore: unrelated_type_equality_checks
    if (isSuccess == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MyApp()));
    }
  }

  @override
  void initState() {
    super.initState();
  }

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
            color: Color(0XFF242A37),
            size: 21,
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Bài viết",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: 'Roboto',
            color: Color(0XFF242A37),
          ),
        ),
        actions: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: isPost
                  ? TextButton(
                      onPressed: () {
                        _editPost();
                      },
                      child: const Text(
                        "Update",
                        style: TextStyle(
                            color: Color(0XFF0066FF),
                            fontSize: 18,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  : Container(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Container(
                width: 45,
                height: 45,
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    image: NetworkImage(urlImage + user.hinhAnh),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                user.hoTen,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  color: Color(0XFF242A37),
                ),
              ),
              subtitle: Text(
                tenDiaDanh,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0XFF0066FF),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: TextField(
                controller: txtNoiDung,
                cursorColor: const Color(0XFF0066FF),
                cursorWidth: 1.5,
                decoration: const InputDecoration(border: InputBorder.none),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: _image == null
                      ? GestureDetector(
                          onTap: () {
                            pickerImage();
                          },
                          child: Image.network(
                            urlImage + post.hinhanh.hinhAnh,
                            width: MediaQuery.of(context).size.width - 20,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Image.file(
                          _image,
                          width: MediaQuery.of(context).size.width - 20,
                          fit: BoxFit.cover,
                        ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
