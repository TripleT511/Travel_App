import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vietnam_travel_app/Global/variables.dart';
import 'package:vietnam_travel_app/Models/baiviet_object.dart';
import 'package:vietnam_travel_app/Models/user_object.dart';
import 'package:vietnam_travel_app/Providers/baiviet_provider.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';
import 'package:vietnam_travel_app/Views/baiviet/chitiet_baiviet.dart';
import 'package:vietnam_travel_app/Views/diadanh/chitiet_dia_danh.dart';
import 'package:vietnam_travel_app/Views/baiviet/edit_post.dart';

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
  List<BaiVietChiaSeObject> lstBaiViet = [];
  // ignore: prefer_typing_uninitialized_variables
  var _image;
  final picker = ImagePicker();
  String avatar = "images/user-default.jpg";
  bool isEdit = false;

  _like(int id) async {
    setState(() {
      isEdit = true;
    });
    await BaiVietProvider.likePost(id);
  }

  _dislike(int id) async {
    setState(() {
      isEdit = true;
    });
    await BaiVietProvider.unLikePost(id);
  }

  int idUser = 0;
  String countBaiViet = "0";
  Future pickerImage() async {
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      _image = File(pickedFile.path);
      EasyLoading.show(status: 'Vui lòng đợi...');
      bool isSuccess = await UserProvider.uploadImage(_image!);
      // ignore: unrelated_type_equality_checks
      if (isSuccess == true) {
        EasyLoading.showSuccess('Cập nhật ảnh đại diện thành công');
        EasyLoading.dismiss();
        UserObject newUser = await UserProvider.getUser();
        setState(() {
          avatar = newUser.hinhAnh;
          isEdit = true;
        });
        Navigator.pop(context);
      } else {
        EasyLoading.showError('Cập nhật ảnh đại diện thất bại');
        EasyLoading.dismiss();
        Navigator.pop(context);
      }
    } else {
      EasyLoading.showToast('Chưa chọn ảnh');
      EasyLoading.dismiss();
    }
  }

  _deletePost(int id) async {
    EasyLoading.show(status: 'Vui lòng đợi...');
    bool isSuccess = await BaiVietProvider.deletePost(id);
    if (isSuccess == true) {
      List<BaiVietChiaSeObject> newBaiViet =
          await BaiVietProvider.getAllBaiVietUser(idUser);
      UserObject newUser = await UserProvider.getUser();
      setState(() {
        lstBaiViet = newBaiViet;
        user = newUser;
        isEdit = true;
      });
      Navigator.pop(context, true);

      EasyLoading.showSuccess('Xóa bài viết thành công');
      EasyLoading.dismiss();
    } else {
      EasyLoading.showError('Xóa bài viết thất bại');
      EasyLoading.dismiss();
    }
  }

  Dialog dialog(String title, String des, int id) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Color(0XFF242A37),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text(
              des,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0XFF242A37),
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(
            height: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5 - 10,
                    height: 50,
                    child: InkWell(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                      ),
                      highlightColor: Colors.grey[200],
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Center(
                        child: Text(
                          "Hủy",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            color: Color(0XFFB1BCD0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5 - 10,
                    height: 50,
                    child: InkWell(
                      highlightColor: Colors.grey[200],
                      onTap: () {
                        _deletePost(id);
                        Navigator.pop(context);
                      },
                      child: const Center(
                        child: Text(
                          "Xoá",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0XFFFF2D55),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  showModal() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        backgroundColor: Colors.white,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(top: 7),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0X1A242A37),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0X1A242A37),
                  child: FaIcon(
                    FontAwesomeIcons.images,
                    color: Color(0XFF242A37),
                    size: 18,
                  ),
                ),
                title: const Text(
                  "Chọn từ thư viện",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFF242A37),
                  ),
                ),
                onTap: () {
                  pickerImage();
                },
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          );
        });
  }

  showModalEdit(BaiVietChiaSeObject baiviet) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        backgroundColor: Colors.white,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(top: 7),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0X1A242A37),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0X1A242A37),
                  child: FaIcon(
                    FontAwesomeIcons.pen,
                    color: Color(0XFF242A37),
                    size: 18,
                  ),
                ),
                title: const Text(
                  "Chỉnh sửa bài viết",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFF242A37),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditPost(
                          tenDiaDanh: baiviet.diadanh.tenDiaDanh,
                          user: baiviet.user,
                          post: baiviet),
                    ),
                  ).then((value) async {
                    if (value != false) {
                      Navigator.pop(context);
                      EasyLoading.show(status: 'Đang cập nhật lại dữ liệu...');
                      List<BaiVietChiaSeObject> newBaiViet =
                          await BaiVietProvider.getAllBaiVietUser(idUser);
                      UserObject newUser = await UserProvider.getUser();
                      setState(() {
                        lstBaiViet = newBaiViet;
                        user = newUser;
                      });
                      EasyLoading.dismiss();
                    }
                  });
                },
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0X1A242A37),
                  child: FaIcon(
                    FontAwesomeIcons.solidTrashAlt,
                    color: Color(0XFFFF2D55),
                    size: 18,
                  ),
                ),
                title: const Text(
                  "Xoá bài viết",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFFFF2D55),
                  ),
                ),
                onTap: () {
                  showDialog(
                    barrierColor: Colors.black26,
                    context: context,
                    builder: (context) {
                      return dialog(
                          "Xoá bài viết",
                          "Bạn có chắc chắn muốn xoá bài viết này không?",
                          baiviet.id);
                    },
                  );
                },
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          );
        });
  }

  _updateUser() async {
    EasyLoading.show(status: "Đang cập nhật lại dữ liệu");
    UserObject newUser = await UserProvider.getUser();
    setState(() {
      user = newUser;
    });
    EasyLoading.dismiss();
  }

  _loadUser() async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    String us = pres.getString("user") ?? '';
    UserObject user = UserObject.fromJson(jsonDecode(us));
    setState(() {
      idUser = user.id;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUser();
    avatar = user.hinhAnh;
  }

  InkWell kLike(int value, IconData icon, Color color, Function ontap) {
    return InkWell(
      onTap: () => ontap(),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            '$value',
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0XFFB1BCD0),
            ),
          ),
        ],
      ),
    );
  }

  InkWell kUnLike(int value, IconData icon, Color color, Function ontap) {
    return InkWell(
      onTap: () => ontap(),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            '$value',
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0XFFB1BCD0),
            ),
          ),
        ],
      ),
    );
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
        leading: TextButton(
          onPressed: () {},
          child: IconButton(
            onPressed: () {
              Navigator.pop(context, isEdit);
            },
            icon: const FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: Color(0XFF242A37),
              size: 21,
            ),
          ),
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
                        child: _image == null
                            ? CircleAvatar(
                                backgroundImage: NetworkImage(
                                  urlImage + avatar,
                                ),
                              )
                            : CircleAvatar(
                                backgroundImage: FileImage(
                                  _image,
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
                    if (idUser == user.id) {
                      showModal();
                    } else {
                      return;
                    }
                  },
                  child: Container(
                    width: 25,
                    height: 25,
                    margin: const EdgeInsets.only(top: 185),
                    decoration: idUser == user.id
                        ? const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0XFFECF8FF),
                          )
                        : const BoxDecoration(),
                    child: idUser == user.id
                        ? const Align(
                            alignment: Alignment.center,
                            child: FaIcon(
                              FontAwesomeIcons.camera,
                              color: Color(0XFF0066FF),
                              size: 12,
                            ),
                          )
                        : Container(),
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
                  children: [
                    Text(
                      user.baiviets_count.toString(),
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(0XFF0066FF),
                      ),
                    ),
                    const Text(
                      'Bài viết',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
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
                  children: [
                    Text(
                      user.tinhthanhs_count.toString(),
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(0XFF0066FF),
                      ),
                    ),
                    const Text(
                      'Tỉnh thành',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
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
                      idUser != user.id
                          ? (user.trangThaiSDT == 1
                              ? user.soDienThoai
                              : "Không hiển thị")
                          : user.soDienThoai,
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
                      idUser != user.id
                          ? (user.trangThaiEmail == 1
                              ? user.email
                              : "Không hiển thị")
                          : user.email,
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
                        "  Bài viết đã chia sẻ",
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
            FutureBuilder<List<BaiVietChiaSeObject>>(
              future: BaiVietProvider.getAllBaiVietUser(user.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<BaiVietChiaSeObject> lstBaiViet = snapshot.data!;
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: lstBaiViet.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 10,
                              width: double.infinity,
                              decoration:
                                  const BoxDecoration(color: Color(0XFFF0F2F5)),
                            ),
                            ListTile(
                              leading: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(urlImage +
                                      lstBaiViet[index].user.hinhAnh),
                                ),
                              ),
                              title: Text(
                                lstBaiViet[index].user.hoTen,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Roboto',
                                    fontSize: 16,
                                    color: Color(0XFF242A37)),
                              ),
                              subtitle: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  lstBaiViet[index].thoiGian,
                                  style: const TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                    color: Color(0XFFB1BCD0),
                                  ),
                                ),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  if (idUser == user.id) {
                                    showModalEdit(lstBaiViet[index]);
                                  } else {
                                    return;
                                  }
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.ellipsisV,
                                  size: 16,
                                  color: Color(0XFFB1BCD0),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isEdit = true;
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChiTietBaiViet(
                                      baiviet: lstBaiViet[index],
                                    ),
                                  ),
                                ).then((value) {
                                  if (value != false) {
                                    setState(() {
                                      if (mounted && idUser == user.id) {
                                        _updateUser();
                                      }
                                    });
                                  }
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width - 20,
                                height: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      urlImage +
                                          lstBaiViet[index].hinhanh.hinhAnh,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                lstBaiViet[index].noiDung,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  color: Color(0XFF242A37),
                                  height: 1.4,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PlaceDetail(
                                          lstBaiViet[index].diadanh.id),
                                    ),
                                  );
                                },
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: const Color(0XFF0066FF),
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      lstBaiViet[index].diadanh.tenDiaDanh,
                                      style: const TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Color(0XFF0066FF),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  decoration: const BoxDecoration(
                                    border: Border.fromBorderSide(
                                      BorderSide(
                                        width: 0.5,
                                        color: Color(0XFFe4e6eb),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          kLike(
                                              lstBaiViet[index].likes_count,
                                              lstBaiViet[index].islike_count ==
                                                      1
                                                  ? Icons.thumb_up_alt
                                                  : Icons.thumb_up_alt_outlined,
                                              lstBaiViet[index].islike_count ==
                                                      1
                                                  ? const Color(0XFF0066FF)
                                                  : const Color(0XFFB1BCD0),
                                              () {
                                            setState(() {
                                              _like(lstBaiViet[index].id);
                                            });
                                          }),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Row(
                                            children: [
                                              kUnLike(
                                                  lstBaiViet[index]
                                                      .unlikes_count,
                                                  lstBaiViet[index]
                                                              .isdislike_count ==
                                                          1
                                                      ? Icons.thumb_down_alt
                                                      : Icons
                                                          .thumb_down_alt_outlined,
                                                  lstBaiViet[index]
                                                              .isdislike_count ==
                                                          1
                                                      ? const Color(0XFF0066FF)
                                                      : const Color(0XFFB1BCD0),
                                                  () {
                                                setState(() {
                                                  _dislike(
                                                      lstBaiViet[index].id);
                                                });
                                              }),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const FaIcon(
                                            FontAwesomeIcons.solidEye,
                                            color: Color(0XFFB1BCD0),
                                            size: 18,
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 5, right: 10),
                                            child: Text(
                                              lstBaiViet[index]
                                                  .views_count
                                                  .toString(),
                                              style: const TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0XFFB1BCD0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
                return shimmerBaiViet(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
