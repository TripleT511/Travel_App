import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vietnam_travel_app/Global/variables.dart';
import 'package:vietnam_travel_app/Models/baiviet_object.dart';
import 'package:vietnam_travel_app/Models/user_object.dart';
import 'package:vietnam_travel_app/Providers/baiviet_provider.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';
import 'package:vietnam_travel_app/chitiet_dia_danh.dart';
import 'package:vietnam_travel_app/edit_post.dart';
import 'package:vietnam_travel_app/main.dart';
import 'package:vietnam_travel_app/personal_page.dart';

// ignore: must_be_immutable
class ChiTietBaiViet extends StatefulWidget {
  BaiVietChiaSeObject baiviet;
  int index;
  int loaibaiviet;
  ChiTietBaiViet(
      {Key? key,
      required this.baiviet,
      required this.index,
      required this.loaibaiviet})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return ChiTietBaiVietState(baiviet, index, loaibaiviet);
  }
}

class ChiTietBaiVietState extends State<ChiTietBaiViet> {
  BaiVietChiaSeObject baiviet;
  int loaibaiviet;
  int index;
  int idUser = 0;
  List<BaiVietChiaSeObject> lstBaiViet = [];
  List<BaiVietChiaSeObject> lstBaiVietNoiBat = [];
  List<BaiVietChiaSeObject> lstBaiVietUser = [];
  ChiTietBaiVietState(this.baiviet, this.index, this.loaibaiviet);

  _like(int id) async {
    setState(() {});
    // ignore: unused_local_variable
    bool boollike = await BaiVietProvider.likePost(id);
    _loadBaiViet();
  }

  _dislike(int id) async {
    setState(() {});
    // ignore: unused_local_variable
    bool boolUnLike = await BaiVietProvider.unLikePost(id);
    _loadBaiViet();
  }

  _loadBaiViet() async {
    var baivietdata = await BaiVietProvider.getAllBaiViet();
    var baivietnoibatdata = await BaiVietProvider.getAllBaiVietNoiBat();
    var baivietuserdata =
        await BaiVietProvider.getAllBaiVietUser(baiviet.user.id.toInt());
    if (mounted) {
      setState(() {
        setState(() {
          if (loaibaiviet == 0) {
            lstBaiVietNoiBat = baivietnoibatdata;
            baiviet = lstBaiVietNoiBat[index];
          } else if (loaibaiviet == 1) {
            lstBaiViet = baivietdata;
            baiviet = lstBaiViet[index];
          } else {
            lstBaiVietUser = baivietuserdata;
            baiviet = lstBaiVietUser[index];
          }
        });
      });
    }
  }

  _deletePost(int id) async {
    EasyLoading.show(status: 'Vui lòng đợi...');
    bool isSuccess = await BaiVietProvider.deletePost(id);
    if (isSuccess == true) {
      List<BaiVietChiaSeObject> newBaiViet =
          await BaiVietProvider.getAllBaiViet();
      await UserProvider.getUser();
      setState(() {
        lstBaiViet = newBaiViet;
      });

      EasyLoading.showSuccess('Xóa bài viết thành công');
      EasyLoading.dismiss();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MyApp()),
          (route) => false);
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
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              des,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0XFF242A37),
                fontSize: 14,
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

  _addViewPost() async {
    bool view = await BaiVietProvider.viewPost(baiviet.id);
    _loadBaiViet();
    // setState(() {});
  }

  _loadUser() async {
    UserObject user = await UserProvider.getUser();
    if (mounted) {
      setState(() {
        idUser = user.id;
      });
    }
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
                  );
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
                          "Bạn có chắc chắn muốn xoá bài viết này?",
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

  @override
  void initState() {
    super.initState();
    _addViewPost();
    _loadUser();
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
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 1.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Color(0XFF242A37),
            size: 21,
          ),
        ),
        backgroundColor: const Color(0XFFFFFFFF),
        shadowColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Chi tiết bài viết",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: 'Roboto',
            color: Color(0XFF242A37),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              ListTile(
                leading: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PersonalPage(user: baiviet.user)));
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(urlImage + baiviet.user.hinhAnh),
                    ),
                  ),
                ),
                title: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PersonalPage(user: baiviet.user)));
                  },
                  child: Text(
                    baiviet.user.hoTen,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: Color(0XFF242A37)),
                  ),
                ),
                subtitle: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    baiviet.thoiGian,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: Color(0XFFB1BCD0),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    if (idUser == baiviet.user.id) {
                      showModalEdit(baiviet);
                    } else {
                      print("Không được phép sửa");
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
              SizedBox(
                width: MediaQuery.of(context).size.width - 20,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    urlImage + baiviet.hinhanh.hinhAnh,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  baiviet.noiDung,
                  textAlign: TextAlign.justify,
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
                        builder: (context) => PlaceDetail(baiviet.diadanh.id),
                      ),
                    );
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: const Color(0XFF0066FF),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        baiviet.diadanh.tenDiaDanh,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            kLike(
                                baiviet.likes_count,
                                baiviet.islike_count == 1
                                    ? Icons.thumb_up_alt
                                    : Icons.thumb_up_alt_outlined,
                                baiviet.islike_count == 1
                                    ? const Color(0XFF0066FF)
                                    : const Color(0XFFB1BCD0), () {
                              setState(() {
                                _like(baiviet.id);
                              });
                            }),
                            const SizedBox(
                              width: 15,
                            ),
                            Row(
                              children: [
                                kUnLike(
                                    baiviet.unlikes_count,
                                    baiviet.isdislike_count == 1
                                        ? Icons.thumb_down_alt
                                        : Icons.thumb_down_alt_outlined,
                                    baiviet.isdislike_count == 1
                                        ? const Color(0XFF0066FF)
                                        : const Color(0XFFB1BCD0), () {
                                  setState(() {
                                    _dislike(baiviet.id);
                                  });
                                }),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.solidEye,
                              color: Color(0XFFB1BCD0),
                              size: 18,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5, right: 10),
                              child: Text(
                                baiviet.views_count.toString(),
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
        ),
      ),
    );
  }
}
