import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vietnam_travel_app/Global/variables.dart';
import 'package:vietnam_travel_app/Models/tinhthanh_object.dart';
import 'package:vietnam_travel_app/Providers/address_provider.dart';
import 'package:vietnam_travel_app/Providers/diadanh_provider.dart';
import 'package:vietnam_travel_app/Providers/tinhthanh_provider.dart';
import 'package:vietnam_travel_app/home_tab.dart';

class DeXuatDiaDanh extends StatefulWidget {
  const DeXuatDiaDanh({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DeXuatDiaDanhState();
  }
}

class DeXuatDiaDanhState extends State<DeXuatDiaDanh> {
  TextEditingController txtTenDiaDanh = TextEditingController();
  TextEditingController txtMoTa = TextEditingController();
  TextEditingController txtViDo = TextEditingController();
  TextEditingController txtKinhDo = TextEditingController();
  TextEditingController txtSearch = TextEditingController();
  List<TinhThanhObject> lstTinhThanh = [];
  List<TinhThanhObject> lstTinhThanhSearch = [];
  List<TinhThanhObject> lstSearch = [];
  String tinhThanhID = "";
  String tenTinhThanh = "";
  var _image;
  final picker = ImagePicker();
  final formKey = GlobalKey<FormState>();

  _checkIn() async {
    final result = await acquireCurrentLocation();
    final geoCoding = await AddressProvider.getNameCurrentLocation(
        result.latitude, result.longitude);
    String tenTinh = geoCoding
        .address_components![geoCoding.address_components!.length - 1]
        .short_name;
    if (result != null) {
      if (mounted) {
        setState(() {
          txtTenDiaDanh.text = geoCoding.address_components![0].short_name;
          tenTinhThanh = tenTinh;
          txtViDo.text = geoCoding.geometry.location.lat.toString();
          txtKinhDo.text = geoCoding.geometry.location.lng.toString();
        });
      }
    }
  }

  void _Search() async {
    setState(() {});
    if (txtSearch.text.isEmpty) {
      lstTinhThanhSearch = lstTinhThanh;
    } else {
      lstTinhThanhSearch = [];
      for (var item in lstTinhThanh) {
        if (item.tenTinhThanh
            .toUpperCase()
            .contains(txtSearch.text.toUpperCase())) {
          lstTinhThanhSearch.add(item);
        }
      }
    }

    _showBottomSheet().runtimeType;

    print(lstTinhThanhSearch.length.toString());
  }

  _showBottomSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.1,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
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
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: TextField(
                    onChanged: (String value) {
                      _Search();
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
                    itemCount: lstTinhThanhSearch.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == lstTinhThanhSearch.length - 1 &&
                          lstTinhThanhSearch.length > 9) {
                        if (index != lstTinhThanh.length - 1 &&
                            lstTinhThanhSearch.length > 9) {
                          // return CupertinoActivityIndicator();
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
                          onTap: () {},
                          title: Text(
                            lstTinhThanhSearch[index].tenTinhThanh,
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
      },
    );
  }

  Future pickerImage() async {
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {});
      _image = File(pickedFile.path);
    } else {
      EasyLoading.showInfo('Chưa chọn ảnh');
      EasyLoading.dismiss();
    }
  }

  _loadTinhThanh() async {
    var data = await TinhThanhProvider.getAllTinhThanh();
    setState(() {
      lstTinhThanh = data;
    });
    lstTinhThanhSearch = lstTinhThanh;
  }

  @override
  void initState() {
    super.initState();
    setState(() {});
    _loadTinhThanh();
  }

  String _checkTinhThanh(String diaChi) {
    for (int i = 0; i < lstTinhThanh.length; i++) {
      if (lstTinhThanh[i].tenTinhThanh == tenTinhThanh) {
        setState(() {
          tinhThanhID = lstTinhThanh[i].id.toString();
        });
      }
    }
    if (tinhThanhID != "") {
      return tinhThanhID;
    }
    return '1';
  }

  _deXuatDiaDanh() async {
    print(tinhThanhID);
    if (formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Vui lòng đợi...');
      bool isSuccess = await DiaDanhProvider.deXuatDiaDanh(
          txtTenDiaDanh.text,
          txtMoTa.text,
          txtKinhDo.text,
          txtViDo.text,
          _checkTinhThanh(tenTinhThanh),
          _image);

      // ignore: unrelated_type_equality_checks
      if (isSuccess == true) {
        EasyLoading.showSuccess('Đề xuất địa danh thành công');
        EasyLoading.dismiss();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
      appBar: AppBar(
        elevation: 1.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Color(0XFF242A37),
            size: 20,
          ),
        ),
        backgroundColor: const Color(0XFFFFFFFF),
        shadowColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Đề xuất địa danh",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: 'Roboto',
            color: Color(0XFF242A37),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                    top: 20, left: 15, right: 15, bottom: 10),
                child: const Text(
                  "Tên địa danh",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0XFF242A37)),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
                child: TextFormField(
                  controller: txtTenDiaDanh,
                  decoration: InputDecoration(
                    hintText: "Nhập tên địa danh",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0XFFB1BCD0)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0XFF0066FF)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Tên địa danh không được bỏ trống";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                    top: 10, left: 15, right: 15, bottom: 10),
                child: const Text(
                  "Mô tả",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0XFF242A37)),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
                child: TextFormField(
                  controller: txtMoTa,
                  decoration: InputDecoration(
                    hintText: "Nhập mô tả",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0XFFB1BCD0)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0XFF0066FF)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Mô tả không được bỏ trống";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                    top: 10, left: 15, right: 15, bottom: 10),
                child: const Text(
                  "Vĩ độ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0XFF242A37)),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
                child: TextFormField(
                  controller: txtViDo,
                  decoration: InputDecoration(
                    hintText: "Nhập vĩ độ",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0XFFB1BCD0)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0XFF0066FF)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Vĩ độ không được bỏ trống";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                    top: 10, left: 15, right: 15, bottom: 10),
                child: const Text(
                  "Kinh độ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0XFF242A37)),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
                child: TextFormField(
                  controller: txtKinhDo,
                  decoration: InputDecoration(
                    hintText: "Nhập kinh độ",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0XFFB1BCD0)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0XFF0066FF)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Kinh độ không được bỏ trống";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                    top: 10, left: 15, right: 15, bottom: 10),
                child: const Text(
                  "Hình ảnh",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0XFF242A37)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
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
                                  width: MediaQuery.of(context).size.width - 30,
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
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 25,
                child: Card(
                  elevation: 0,
                  color: const Color(0XFFFFFFFF),
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Color(0XFF0066FF)),
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
                    title: Text(
                      tenTinhThanh == "" ? "Tỉnh thành" : tenTinhThanh,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF0066FF),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 25,
                child: Card(
                  elevation: 0,
                  color: const Color(0XFFFFFFFF),
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Color(0XFF0066FF)),
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
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF0066FF),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 15, left: 15, right: 15, bottom: 15),
                width: 374,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0XFF0066FF)),
                child: TextButton(
                  onPressed: () {
                    _deXuatDiaDanh();
                  },
                  child: const Text(
                    "Đề xuất",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700),
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
