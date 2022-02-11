import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vietnam_travel_app/Global/variables.dart';
import 'package:vietnam_travel_app/Models/diadanh_object.dart';
import 'package:vietnam_travel_app/Models/user_object.dart';
import 'package:vietnam_travel_app/Providers/address_provider.dart';
import 'package:vietnam_travel_app/Providers/baiviet_provider.dart';
import 'package:vietnam_travel_app/Providers/diadanh_provider.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';
import 'package:vietnam_travel_app/main.dart';

// ignore: must_be_immutable
class CreatePost extends StatefulWidget {
  DiaDanhObject? diadanh;
  final UserObject user;
  CreatePost({Key? key, this.diadanh, required this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return CreatePostState(diadanh: diadanh, user: user);
  }
}

class CreatePostState extends State<CreatePost> {
  DiaDanhObject? diadanh;
  final UserObject user;
  CreatePostState({this.diadanh, required this.user});
  final TextEditingController txtNoiDung = TextEditingController();
  final TextEditingController txtSearch = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  final formKey = GlobalKey<FormState>();
  var _image;
  final picker = ImagePicker();
  int idUser = 0;
  String idDiaDanh = "0";
  String tenDiaDanhCheckIn = "";
  String tenTinhThanhCheckIn = "";
  String kinhDo = "";
  String viDo = "";
  bool isPost = false;
  String viTriCuaToi = '';
  String hinhAnh = '';
  List<DiaDanhObject> lstDiaDanh = [];
  List<DiaDanhObject> lstDiaDanhSearch = [];
  Future pickerImage() async {
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {});
      _image = File(pickedFile.path);
      isPost = true;
    } else {
      EasyLoading.showInfo('Chưa chọn ảnh');
      EasyLoading.dismiss();
    }
  }

  _loadDiaDanh() async {
    var data = await DiaDanhProvider.getAllDiaDanh();
    if (mounted) {
      setState(() {});
      lstDiaDanh = data;
      lstDiaDanhSearch = lstDiaDanh;
    }
  }

  _createPost() async {
    if (idDiaDanh == "0" && tenDiaDanhCheckIn == "") {
      EasyLoading.showError('Chưa chọn địa danh');
      return;
    }
    if (formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Vui lòng đợi...');
      bool isSuccess = false;
      if (idDiaDanh != "0") {
        isSuccess = await BaiVietProvider.createPost(_image, idDiaDanh,
            user.id.toString(), txtNoiDung.text, null, null, null, null);
      } else {
        isSuccess = await BaiVietProvider.createPost(
            _image,
            idDiaDanh,
            user.id.toString(),
            txtNoiDung.text,
            tenDiaDanhCheckIn,
            tenTinhThanhCheckIn,
            viDo,
            kinhDo);
      }
      await UserProvider.getUser();

      // ignore: unrelated_type_equality_checks
      if (isSuccess == true) {
        EasyLoading.showSuccess('Đăng bài viết thành công');
        EasyLoading.dismiss();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MyApp()),
            (route) => false);
      }
    }
  }

  _checkIn() async {
    final result = await acquireCurrentLocation();
    final geoCoding = await AddressProvider.getNameCurrentLocation(
        result.latitude, result.longitude);
    String tenDiaDiem = geoCoding.address_components![0].short_name;
    String tenTinhThanh = geoCoding
        .address_components![geoCoding.address_components!.length - 1]
        .short_name;
    if (result != null) {
      if (mounted) {
        setState(() {
          viTriCuaToi = geoCoding.formatted_address;
          tenDiaDanhCheckIn = tenDiaDiem;
          tenTinhThanhCheckIn = tenTinhThanh;
          viDo = result.latitude.toString();
          kinhDo = result.longitude.toString();
          idDiaDanh = "0";
        });
      }
    }
  }

  _handleClickDiaDanh(DiaDanhObject diadanh) {
    if (mounted) {
      setState(() {
        idDiaDanh = diadanh.id.toString();
        tenDiaDanhCheckIn = diadanh.tenDiaDanh;
        viTriCuaToi = "";
        txtSearch.clear();
      });
    }
    Navigator.pop(context);
  }

  _showBottomSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.1,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Container(
              padding: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: TextField(
                      onChanged: (String value) {
                        if (txtSearch.text.isEmpty) {
                          lstDiaDanhSearch = lstDiaDanh;
                        } else {
                          lstDiaDanhSearch = [];
                          for (var item in lstDiaDanh) {
                            if (item.tenDiaDanh
                                .toUpperCase()
                                .contains(txtSearch.text.toUpperCase())) {
                              lstDiaDanhSearch.add(item);
                            }
                          }
                        }
                        setState(() {});
                      },
                      showCursor: true,
                      controller: txtSearch,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        hintText: "Tìm tỉnh thành mà bạn muốn...",
                        hintStyle: const TextStyle(color: Color(0XFF242A37)),
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.only(left: 15.0, top: 15.0),
                        prefixIcon: IconButton(
                          icon: const FaIcon(FontAwesomeIcons.city),
                          onPressed: () {},
                          iconSize: 20.0,
                          color: const Color(0XFF0066FF),
                        ),
                        suffixIcon: IconButton(
                          icon: const FaIcon(FontAwesomeIcons.search),
                          onPressed: () {},
                          iconSize: 20.0,
                          color: const Color(0XFF242A37),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    color: Color(0XFFB1BCD0),
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      physics: const BouncingScrollPhysics(),
                      itemCount: lstDiaDanhSearch.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == lstDiaDanhSearch.length - 1 &&
                            lstDiaDanhSearch.length > 9) {
                          if (index != lstDiaDanh.length - 1 &&
                              lstDiaDanhSearch.length > 9) {
                            return Shimmer.fromColors(
                                child: const Card(
                                  child: ListTile(
                                    title: Text(
                                      "",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                baseColor: const Color(0X1A242A37),
                                highlightColor: const Color(0X33050505));
                          }
                        }
                        return Card(
                          child: ListTile(
                            onTap: () {
                              _handleClickDiaDanh(lstDiaDanhSearch[index]);
                            },
                            title: Text(
                              lstDiaDanhSearch[index].tenDiaDanh,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ));
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _loadDiaDanh();
    if (diadanh != null) {
      idDiaDanh = diadanh!.id.toString();
      tenDiaDanhCheckIn = diadanh!.tenDiaDanh;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Color(0XFF242A37),
            size: 20,
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Bài viết",
          style: TextStyle(
            fontSize: 18,
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
                        _createPost();
                      },
                      child: const Text(
                        "Chia sẻ",
                        style: TextStyle(
                            color: Color(0XFF0066FF),
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700),
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
                diadanh == null && tenDiaDanhCheckIn == ""
                    ? ""
                    : tenDiaDanhCheckIn,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0XFF0066FF),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Form(
                key: formKey,
                child: TextFormField(
                  controller: txtNoiDung,
                  cursorColor: const Color(0XFF0066FF),
                  cursorWidth: 1.5,
                  decoration: const InputDecoration(
                      hintText: "Bạn đang nghĩ gì...",
                      border: InputBorder.none),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  onChanged: (value) {
                    formKey.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nội dung không được bỏ trống";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 10,
              child: Card(
                elevation: 0,
                color: const Color(0X1AB1BCD0),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return _showBottomSheet();
                      },
                    );
                  },
                  minLeadingWidth: 10,
                  leading: const CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(0X1A0066FF),
                    child: FaIcon(
                      FontAwesomeIcons.city,
                      size: 16,
                      color: Color(0XFF0066FF),
                    ),
                  ),
                  title: const Text(
                    "Địa danh",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0XFF242A37),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 10,
              child: Card(
                elevation: 0,
                color: const Color(0X1AB1BCD0),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  onTap: () {
                    _checkIn();
                  },
                  minLeadingWidth: 10,
                  leading: const CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(0X1A0066FF),
                    child: FaIcon(
                      FontAwesomeIcons.mapMarkerAlt,
                      size: 16,
                      color: Color(0XFF0066FF),
                    ),
                  ),
                  title: const Text(
                    "Vị trí của tôi",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0XFF242A37),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
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
                          child: Image.asset(
                            'images/no-image-available.jpg',
                            width: MediaQuery.of(context).size.width - 20,
                            fit: BoxFit.cover,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            pickerImage();
                          },
                          child: Image.file(
                            _image,
                            width: MediaQuery.of(context).size.width - 20,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
