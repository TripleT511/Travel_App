import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/Global/variables.dart';
import 'package:vietnam_travel_app/Providers/address_provider.dart';

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
  final formKey = GlobalKey<FormState>();

  _checkIn() async {
    final result = await acquireCurrentLocation();
    final geoCoding = await AddressProvider.getNameCurrentLocation(
        result.latitude, result.longitude);
    if (result != null) {
      if (mounted) {
        setState(() {
          txtTenDiaDanh.text = geoCoding.formatted_address;
          txtViDo.text = geoCoding.geometry.location.lat.toString();
          txtKinhDo.text = geoCoding.geometry.location.lng.toString();
        });
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
              SizedBox(
                width: MediaQuery.of(context).size.width - 20,
                child: Card(
                  elevation: 0,
                  color: const Color(0XFFF3F3F3),
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
                      backgroundColor: Color(0X1AFF2D55),
                      child: FaIcon(
                        FontAwesomeIcons.mapMarkerAlt,
                        size: 16,
                        color: Color(0XFFFF2D55),
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
              Container(
                margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
                width: 374,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0XFF0066FF)),
                child: TextButton(
                  onPressed: () {},
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
