import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:vietnam_travel_app/Global/variables.dart';
import 'package:vietnam_travel_app/Models/user_object.dart';
import 'package:vietnam_travel_app/Providers/baiviet_provider.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';
import 'package:vietnam_travel_app/main.dart';

class CreatePost extends StatefulWidget {
  final int idDiaDanh;
  final String tenDiaDanh;
  final UserObject user;
  const CreatePost(
      {Key? key,
      required this.idDiaDanh,
      required this.tenDiaDanh,
      required this.user})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return CreatePostState(
        idDiaDanh: idDiaDanh, tenDiaDanh: tenDiaDanh, user: user);
  }
}

class CreatePostState extends State<CreatePost> {
  final int idDiaDanh;
  final String tenDiaDanh;
  final UserObject user;
  CreatePostState(
      {required this.idDiaDanh, required this.tenDiaDanh, required this.user});
  final TextEditingController txtNoiDung = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  final formKey = GlobalKey<FormState>();
  var _image;
  final picker = ImagePicker();
  int idUser = 0;
  bool isPost = false;
  String toaDo = '';
  String hinhAnh = '';
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

  _createPost() async {
    if (formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Vui lòng đợi...');
      bool isSuccess = await BaiVietProvider.createPost(
          _image, idDiaDanh.toString(), user.id.toString(), txtNoiDung.text);
      await UserProvider.getUser();
      // ignore: unrelated_type_equality_checks
      if (isSuccess == true) {
        EasyLoading.showSuccess('Đăng bài viết thành công');
        EasyLoading.dismiss();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MyApp()));
      }
    }
  }

  _checkIn() async {
    final result = await acquireCurrentLocation();

    if (result != null) {
      if (mounted) {
        setState(() {
          toaDo =
              result.latitude.toString() + ", " + result.longitude.toString();
        });
      }
    }
  }

  Future<LatLng> acquireCurrentLocation() async {
    // Initializes the plugin and starts listening for potential platform events
    Location location = Location();

    // Whether or not the location service is enabled
    bool serviceEnabled;

    // Status of a permission request to use location services
    PermissionStatus permissionGranted;

    // Check if the location service is enabled, and if not, then request it. In
    // case the user refuses to do it, return immediately with a null result
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {}
    }

    // Check for location permissions; similar to the workflow in Android apps,
    // so check whether the permissions is granted, if not, first you need to
    // request it, and then read the result of the request, and only proceed if
    // the permission was granted by the user
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {}
    }

    // Gets the current location of the user
    final locationData = await location.getLocation();
    return LatLng(locationData.latitude!, locationData.longitude!);
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
                toaDo == "" ? tenDiaDanh : toaDo,
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
            SizedBox(
              width: MediaQuery.of(context).size.width - 10,
              child: Card(
                elevation: 1.0,
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
                      fontWeight: FontWeight.w500,
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
