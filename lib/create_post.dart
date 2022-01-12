import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vietnam_travel_app/Models/diadanh_object.dart';
import 'package:vietnam_travel_app/Models/user_object.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:vietnam_travel_app/main.dart';

class CreatePost extends StatefulWidget {
  final DiaDanhObject diadanh;
  final UserObject user;
  const CreatePost({Key? key, required this.diadanh, required this.user})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return CreatePostState(diadanh: diadanh, user: user);
  }
}

class CreatePostState extends State<CreatePost> {
  final DiaDanhObject diadanh;
  final UserObject user;
  CreatePostState({required this.diadanh, required this.user});
  final TextEditingController txtNoiDung = TextEditingController();
  late File? _image;
  final picker = ImagePicker();
  int idUser = 0;
  bool isPost = false;
  String hoTenUser = '';
  String hinhAnh = '';
  String urlImg = 'https://shielded-lowlands-87962.herokuapp.com/';
  Future pickerImage() async {
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
          isPost = true;
        });
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> uploadImage() async {
    if (_image == null) return;
    var token = await UserProvider.getToken();
    var stream = http.ByteStream(_image!.openRead());
    stream.cast();
    var length = await _image!.length();
    Map<String, String> headers = {"Authorization": "Bearer $token"};

    var uri = Uri.parse(
        "https://shielded-lowlands-87962.herokuapp.com/api/baiviet/create");
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(headers);
    request.fields["idDiaDanh"] = diadanh.id.toString();
    request.fields["idUser"] = idUser.toString();
    request.fields["noiDung"] = txtNoiDung.text;

    var multiport =
        http.MultipartFile("hinhAnh", stream, length, filename: _image!.path);

    request.files.add(multiport);
    var response = await request.send();

    if (response.statusCode == 200) {
      print("Upload success");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MyApp()));
    } else {
      print("Failed");
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
                        uploadImage();
                      },
                      child: const Text(
                        "Post",
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
                    image: NetworkImage(urlImg + user.hinhAnh),
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
                diadanh.tenDiaDanh,
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
                decoration: const InputDecoration(
                    hintText: "Bạn đang nghĩ gì...", border: InputBorder.none),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     ClipRRect(
            //       borderRadius: BorderRadius.circular(10.0),
            //       child: _image == null
            //           ? Text("No image")
            //           : Image.file(
            //               _image,
            //               width: MediaQuery.of(context).size.width - 20,
            //               fit: BoxFit.cover,
            //             ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
      bottomSheet: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {
          pickerImage();
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          margin:
              const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 7),
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0XFF242A37)),
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const FaIcon(
                FontAwesomeIcons.image,
                size: 18,
                color: Color(0XFF242A37),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Text(
                  "Ảnh",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Color(0XFF242A37),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
