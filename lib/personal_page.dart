import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vietnam_travel_app/Models/user_object.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';
import 'package:vietnam_travel_app/settings_page.dart';
import 'dart:math' as math;

// ignore: must_be_immutable
class PersonalPage extends StatefulWidget {
  UserObject user;
  PersonalPage({Key? key, required this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return PersonalPageState(user: user);
  }
}

class PersonalPageState extends State<PersonalPage> {
  UserObject user;
  PersonalPageState({required this.user});
  bool checkLike = true;
  bool checkUnLike = false;
  String urlImg = 'https://shielded-lowlands-87962.herokuapp.com/';
  late File? _image;
  final picker = ImagePicker();
  int idUser = 0;
  String hoTenUser = '';
  Future pickerImage() async {
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {});
      _image = File(pickedFile.path);
      bool isSuccess = await UserProvider.uploadImage(_image!);
      // ignore: unrelated_type_equality_checks
      if (isSuccess == true) {
        Navigator.pop(context);
        Future.delayed(const Duration(seconds: 1), () {
          setState(() => {pickedFile.path});
        });
      }
    } else {
      const snackBar = SnackBar(content: Text('Chưa chọn ảnh'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  showModal() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        backgroundColor: Colors.white,
        builder: (context) {
          return ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.images,
              color: Color(0XFF242A37),
            ),
            title: const Text("Chọn từ thư viện"),
            onTap: () {
              pickerImage();
            },
          );
        });
  }

  _loadUser() async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    setState(() {});
    idUser = pres.getInt('id') ?? 0;
  }

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: null,
        leadingWidth: 0,
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: Color(0XFF242A37),
                  size: 21,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: idUser == user.id
                  ? IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingsPage()));
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.cog,
                        color: Color(0XFF242A37),
                        size: 21,
                      ),
                    )
                  : Container(),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                ),
                Positioned(
                    top: 80,
                    left: (MediaQuery.of(context).size.width * 0.5) - 60,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 120,
                        height: 120,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            urlImg + user.hinhAnh,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                          border: Border.all(
                            width: 7,
                            color: const Color(0XFFECF8FF),
                          ),
                        ),
                      ),
                    )),
                GestureDetector(
                  onTap: () {
                    showModal();
                  },
                  child: Container(
                    width: 25,
                    height: 25,
                    margin: const EdgeInsets.only(top: 185),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0XFFECF8FF),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: FaIcon(
                        FontAwesomeIcons.camera,
                        color: Color(0XFF0066FF),
                        size: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                user.hoTen,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                    color: Color(0XFF242A37)),
                softWrap: true,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      '50',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(0XFF0066FF),
                      ),
                    ),
                    Text(
                      'Bài viết',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Color(0XFFB1BCD0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      '12',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(0XFF0066FF),
                      ),
                    ),
                    Text(
                      'Tỉnh thành',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Color(0XFFB1BCD0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 50, top: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 18,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 10),
                    child: const FaIcon(
                      FontAwesomeIcons.phoneAlt,
                      size: 18,
                      color: Color(0XFFB1BCD0),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      user.soDienThoai,
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: Color(0XFF242A37),
                          height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 50, top: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 18,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 10),
                    child: const FaIcon(
                      FontAwesomeIcons.solidEnvelope,
                      size: 18,
                      color: Color(0XFFB1BCD0),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      user.email,
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: Color(0XFF242A37),
                          height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Card(
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.clone,
                        color: Color(0XFF242A37),
                        size: 15,
                      ),
                      Text(
                        " Bài viết đã chia sẻ",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Color(0XFF242A37),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
