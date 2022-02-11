import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/Global/variables.dart';
import 'package:vietnam_travel_app/Models/baiviet_object.dart';
import 'package:vietnam_travel_app/Models/diadanh_object.dart';
import 'package:vietnam_travel_app/Models/nhucau_object.dart';
import 'package:vietnam_travel_app/Models/user_object.dart';
import 'package:vietnam_travel_app/Providers/baiviet_provider.dart';
import 'package:vietnam_travel_app/Providers/diadanh_provider.dart';
import 'package:vietnam_travel_app/Providers/nhucau_provider.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';
import 'package:vietnam_travel_app/Views/baiviet/chitiet_baiviet.dart';
import 'package:vietnam_travel_app/Views/diadanh/chitiet_dia_danh.dart';
import 'package:vietnam_travel_app/Views/baiviet/edit_post.dart';
import 'package:vietnam_travel_app/Views/User/personal_page.dart';
import 'package:vietnam_travel_app/chitiet_nhu_cau.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int currentLoad = 1;
  List<BaiVietChiaSeObject> lstBaiViet = [];
  List<BaiVietChiaSeObject> lstBaiViet1 = [];
  List<BaiVietChiaSeObject> lstBaiVietNoiBat = [];
  List<DiaDanhObject> lstDD = [];
  List<NhuCauObject> lstNC = [];
  ScrollController _scrollController = ScrollController();
  bool isLoadingNhuCau = false;
  bool isLoadingDiaDanh = false;
  bool isLoadingBaiVietNB = false;

  late int isLike;
  late int isUnLike;
  _loadNhuCau() async {
    setState(() {
      isLoadingNhuCau = true;
    });
    final data = await NhuCauProvider.getAllNhuCau();
    if (mounted) {
      setState(() {
        lstNC = data;
        isLoadingNhuCau = false;
      });
    }
  }

  _loadDiaDanhNoiBat() async {
    setState(() {
      isLoadingDiaDanh = true;
    });
    final data = await DiaDanhProvider.getAllDiaDanh();
    if (mounted) {
      setState(() {
        lstDD = data;
        isLoadingDiaDanh = false;
      });
    }
  }

  _loadBaiVietNoiBat() async {
    setState(() {
      isLoadingBaiVietNB = true;
    });
    final data = await BaiVietProvider.getAllBaiVietNoiBat();
    if (mounted) {
      setState(() {
        lstBaiVietNoiBat = data;
        isLoadingBaiVietNB = false;
      });
    }
  }

  _like(int id) async {
    setState(() {});
    // ignore: unused_local_variable
    bool boollike = await BaiVietProvider.likePost(id);
    loadListBaiVietKhiLike();
  }

  _dislike(int id) async {
    setState(() {});
    // ignore: unused_local_variable
    bool boolUnLike = await BaiVietProvider.unLikePost(id);
    loadListBaiVietKhiLike();
  }

  int idUser = 0;
  _loadUser() async {
    UserObject user = await UserProvider.getUser();

    setState(() {
      idUser = user.id;
    });
  }

  @override
  void initState() {
    super.initState();
    loadListBaiViet();
    _loadUser();
    _loadNhuCau();
    _loadDiaDanhNoiBat();
    _loadBaiVietNoiBat();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getData();
      }
    });
  }

  _getData() {
    if (currentLoad + 1 <= lstBaiViet1.length) {
      for (int i = currentLoad; i < currentLoad + 1; i++) {
        lstBaiViet.add(lstBaiViet1[i]);
      }
      currentLoad++;
    }
    setState(() {});
  }

  void loadListBaiVietKhiLike() async {
    final data = await BaiVietProvider.getAllBaiViet();
    final data2 = await BaiVietProvider.getAllBaiVietNoiBat();
    if (mounted) {
      setState(() {
        lstBaiViet = data;
        lstBaiVietNoiBat = data2;
      });
    }

    EasyLoading.dismiss();
  }

  void loadListBaiViet() async {
    final data = await BaiVietProvider.getAllBaiViet();
    setState(() {
      lstBaiViet1 = data;
    });
    for (int i = 0; i < currentLoad; i++) {
      lstBaiViet.add(lstBaiViet1[i]);
    }
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

  _deletePost(int id) async {
    EasyLoading.show(status: 'Vui lòng đợi...');
    bool isSuccess = await BaiVietProvider.deletePost(id);
    if (isSuccess == true) {
      List<BaiVietChiaSeObject> newBaiViet =
          await BaiVietProvider.getAllBaiViet();
      List<BaiVietChiaSeObject> newBaiVietNoiBat =
          await BaiVietProvider.getAllBaiVietNoiBat();
      await UserProvider.getUser();
      setState(() {
        lstBaiViet = newBaiViet;
        lstBaiVietNoiBat = newBaiVietNoiBat;
        lstBaiViet1 = [];
      });

      EasyLoading.showSuccess('Xóa bài viết thành công');
      EasyLoading.dismiss();
      Navigator.pop(context);
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
                      loadListBaiVietKhiLike();
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

  @override
  Widget build(BuildContext context) {
    Container slideNhuCau() {
      return Container(
        width: MediaQuery.of(context).size.width - 20,
        height: 35,
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: isLoadingNhuCau ? 2 : lstNC.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => isLoadingNhuCau
              ? Shimmer.fromColors(
                  child: slideNhuCauShimmer(),
                  baseColor: const Color(0X1A242A37),
                  highlightColor: const Color(0X33050505))
              : GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChiTietNhuCau(nhucau: lstNC[index]),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    margin: const EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0X33B1BCD0),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      lstNC[index].tenNhuCau!,
                      style: const TextStyle(
                        color: Color(0XFFFF2D55),
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
        ),
      );
    }

    SizedBox slideBaiViet() {
      return SizedBox(
        height: 215,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: isLoadingBaiVietNB ? 2 : lstBaiVietNoiBat.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => isLoadingBaiVietNB
              ? Shimmer.fromColors(
                  child: slideShimmer(),
                  baseColor: const Color(0X1AC5B5D4),
                  highlightColor: const Color(0X1A050505))
              : Container(
                  padding: const EdgeInsets.only(left: 10),
                  width: 271,
                  height: 210,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChiTietBaiViet(
                            baiviet: lstBaiVietNoiBat[index],
                          ),
                        ),
                      ).then((value) {
                        if (value != false) {
                          EasyLoading.show(
                              status: 'Đang cập nhật lại dữ liệu...');
                          setState(() {
                            loadListBaiVietKhiLike();
                          });
                        }
                      });
                    },
                    child: Stack(children: [
                      Card(
                        elevation: 1.0,
                        color: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(16.0),
                            topEnd: Radius.circular(16.0),
                            bottomStart: Radius.circular(16.0),
                            bottomEnd: Radius.circular(16.0),
                          ),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              urlImage +
                                  lstBaiVietNoiBat[index].hinhanh.hinhAnh,
                              width: 271,
                              height: 132,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 10, bottom: 10, right: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                lstBaiVietNoiBat[index].noiDung,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  color: Color(0XFF242A37),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 0),
                                        child: const Icon(
                                          Icons.thumb_up,
                                          color: Color(0XFF0066FF),
                                          size: 18,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          lstBaiVietNoiBat[index]
                                              .likes_count
                                              .toString(),
                                          style: const TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 14,
                                            color: Color(0XFF242A37),
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: const FaIcon(
                                          FontAwesomeIcons.solidEye,
                                          color: Color(0XFF3EFF7F),
                                          size: 18,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          lstBaiVietNoiBat[index]
                                              .views_count
                                              .toString(),
                                          style: const TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 14,
                                            color: Color(0XFF242A37),
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: const FaIcon(
                                          FontAwesomeIcons.mapMarkerAlt,
                                          color: Color(0XFFFF2D55),
                                          size: 18,
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        margin: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          lstBaiVietNoiBat[index]
                                              .diadanh
                                              .tenDiaDanh,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 14,
                                            color: Color(0XFF242A37),
                                            fontWeight: FontWeight.normal,
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
                      ),
                    ]),
                  ),
                ),
        ),
      );
    }

    SizedBox slideDiaDanh() {
      return SizedBox(
        height: 211,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: isLoadingDiaDanh ? 2 : lstDD.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => isLoadingDiaDanh
              ? Shimmer.fromColors(
                  child: slideShimmer(),
                  baseColor: const Color(0X1AC5B5D4),
                  highlightColor: const Color(0X1A050505))
              : Container(
                  padding: const EdgeInsets.only(left: 10),
                  width: 271,
                  height: 211,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlaceDetail(lstDD[index].id),
                        ),
                      );
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Card(
                          elevation: 1.0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.all(
                              Radius.circular(16),
                            ),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            urlImage + lstDD[index].hinhanh!.hinhAnh,
                            width: double.maxFinite,
                            height: 210,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 117,
                          child: Container(
                            width: 254,
                            height: 90,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadiusDirectional.only(
                                    bottomEnd: Radius.circular(16),
                                    bottomStart: Radius.circular(16)),
                                color: Color(0XFFFFFFFF),
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0X0D5E9EFF),
                                      Color(0XB30066FF)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    tileMode: TileMode.clamp)),
                          ),
                        ),
                        const Positioned(
                          top: 2,
                          right: 20,
                          child: FaIcon(
                            FontAwesomeIcons.solidBookmark,
                            color: Color(0X99FFFFFF),
                            size: 22,
                          ),
                        ),
                        Positioned(
                          top: 150,
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 200,
                                margin: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  lstDD[index].tenDiaDanh,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 5.0,
                                        color: Color(0XFF0066FF),
                                        offset: Offset(1.5, 0.5),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0XFF0066FF),
                                            offset: Offset(1.5, 0.5),
                                            blurRadius: 5.0,
                                          ),
                                        ]),
                                    child: const FaIcon(
                                      FontAwesomeIcons.mapMarkerAlt,
                                      color: Color(0XFFFFFFFF),
                                      size: 13,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      lstDD[index].tinhthanh!.tenTinhThanh,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        shadows: [
                                          Shadow(
                                            blurRadius: 5.0,
                                            color: Color(0XFF0066FF),
                                            offset: Offset(1.5, 0.5),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      );
    }

    ListView _loadPost() {
      return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: lstBaiViet.length,
        itemBuilder: (context, index) {
          isLike = lstBaiViet[index].islike_count!;
          isUnLike = lstBaiViet[index].isdislike_count!;
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  height: 10,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Color(0XFFF0F2F5)),
                ),
                ListTile(
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PersonalPage(
                                  user: lstBaiViet[index].user))).then((value) {
                        if (value != false) {
                          EasyLoading.show(
                              status: 'Đang cập nhật lại dữ liệu...');
                          loadListBaiVietKhiLike();
                          lstBaiViet1 = [];
                        }
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            urlImage + lstBaiViet[index].user.hinhAnh),
                      ),
                    ),
                  ),
                  title: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PersonalPage(
                                  user: lstBaiViet[index].user))).then((value) {
                        if (value != false) {
                          EasyLoading.show(
                              status: 'Đang cập nhật lại dữ liệu...');
                          loadListBaiVietKhiLike();
                          lstBaiViet1 = [];
                        }
                      });
                    },
                    child: Text(
                      lstBaiViet[index].user.hoTen,
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
                      if (idUser == lstBaiViet[index].user.id) {
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChiTietBaiViet(
                          baiviet: lstBaiViet[index],
                        ),
                      ),
                    ).then((value) {
                      if (value != false) {
                        EasyLoading.show(
                            status: 'Đang cập nhật lại dữ liệu...');
                        setState(() {
                          loadListBaiVietKhiLike();
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
                          urlImage + lstBaiViet[index].hinhanh.hinhAnh,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChiTietBaiViet(
                          baiviet: lstBaiViet[index],
                        ),
                      ),
                    ).then((value) {
                      if (value != false) {
                        EasyLoading.show(
                            status: 'Đang cập nhật lại dữ liệu...');
                        setState(() {
                          loadListBaiVietKhiLike();
                        });
                      }
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      lstBaiViet[index].noiDung,
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        color: Color(0XFF242A37),
                        height: 1.4,
                        fontSize: 16,
                      ),
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
                          builder: (context) =>
                              PlaceDetail(lstBaiViet[index].diadanh.id),
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
                          lstBaiViet[index].diadanh.tenDiaDanh,
                          overflow: TextOverflow.fade,
                          softWrap: false,
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
                                  lstBaiViet[index].likes_count,
                                  isLike == 1
                                      ? Icons.thumb_up_alt
                                      : Icons.thumb_up_alt_outlined,
                                  isLike == 1
                                      ? const Color(0XFF0066FF)
                                      : const Color(0XFFB1BCD0), () {
                                _like(lstBaiViet[index].id);
                              }),
                              const SizedBox(
                                width: 15,
                              ),
                              Row(
                                children: [
                                  kUnLike(
                                      lstBaiViet[index].unlikes_count,
                                      isUnLike == 1
                                          ? Icons.thumb_down_alt
                                          : Icons.thumb_down_alt_outlined,
                                      isUnLike == 1
                                          ? const Color(0XFF0066FF)
                                          : const Color(0XFFB1BCD0), () {
                                    _dislike(lstBaiViet[index].id);
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
                                margin:
                                    const EdgeInsets.only(left: 5, right: 10),
                                child: Text(
                                  lstBaiViet[index].views_count.toString(),
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

    return Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1.0,
        leadingWidth: 180,
        backgroundColor: const Color(0XFFFFFFFF),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(
            "images/logo_04.png",
          ),
        ),
      ),
      body: ListView(
        controller: _scrollController,
        children: [
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sliderTitle("Địa Danh Nổi Bật"),
                  slideDiaDanh(),
                  sliderTitle("Bài Viết Nổi Bật"),
                  slideBaiViet(),
                  sliderTitle("Nhu Cầu"),
                  slideNhuCau(),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              _loadPost(),
            ],
          )
        ],
      ),
    );
  }
}
