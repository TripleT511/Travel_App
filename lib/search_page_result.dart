import 'package:flutter/material.dart';
import 'package:vietnam_travel_app/Models/diadanh_object.dart';
import 'package:vietnam_travel_app/Models/tinhthanh_object.dart';
import 'package:vietnam_travel_app/Providers/diadanh_provider.dart';
import 'package:vietnam_travel_app/chitiet_quan_an.dart';

class SearchResult extends StatefulWidget {
  final TinhThanhObject tinhthanh;
  SearchResult({Key? key, required this.tinhthanh}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SearchResultState(tinhthanh: tinhthanh);
  }
}

class SearchResultState extends State<SearchResult> {
  final TinhThanhObject tinhthanh;
  Future<List<DiaDanhObject>> lst = DiaDanhProvider.getAllDiaDanh();
  List<DiaDanhObject> lstDiaDanhs = [];
  String urlImg = 'https://shielded-lowlands-87962.herokuapp.com/';

  SearchResultState({required this.tinhthanh});

  void _LoadDiaDanh() async {
    final data = await DiaDanhProvider.getAllDiaDanh();
    setState(() {});
    for (var i = 0; i < data.length; i++) {
      if (data[i].tinh_thanh_id == tinhthanh.id) lstDiaDanhs.add(data[i]);
    }
  }

  @override
  void initState() {
    super.initState();
    _LoadDiaDanh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: SizedBox(
                              width: 95,
                              child: Image.asset("images/logo-ver3.png"),
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                          "images/a.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50.0)),
                                    border: Border.all(
                                        width: 2, color: Colors.white))))
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                decoration: const BoxDecoration(
                    border: Border.fromBorderSide(
                        BorderSide(width: 0.5, color: Colors.grey))),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: Text(
                  "Địa Danh - " + tinhthanh.tenTinhThanh,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF0869E1),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                future: DiaDanhProvider.getAllDiaDanh(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  // if (lstDiaDanhs.length == 0) {
                  //   return Center(
                  //     child: Text(
                  //       'Hiên Tại Chưa Có Địa Danh Tại Tỉnh Thành Này',
                  //       style: TextStyle(
                  //         color: Colors.red,
                  //         fontSize: 20,
                  //       ),
                  //       textAlign: TextAlign.center,
                  //     ),
                  //   );
                  // }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Có lỗi xảy ra!!!'),
                    );
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: lstDiaDanhs.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RestaurantDetail()));
                        }, // Handle your callback
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 230,
                              width: 374,
                              child: Card(
                                elevation: 3.0,
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
                                      urlImg +
                                          lstDiaDanhs[index].hinhanh.hinhAnh,
                                      width: 374,
                                      height: 132,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(
                                      height: 15.0,
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 20, bottom: 12),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          lstDiaDanhs[index].tenDiaDanh,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0XFF000000),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 15, bottom: 12),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.place,
                                            color: Color(0XFF0869E1),
                                          ),
                                          Text(
                                            " " +
                                                lstDiaDanhs[index]
                                                    .tinhthanh
                                                    .tenTinhThanh,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0XFF050505),
                                              fontFamily: 'Roboto',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void loadListNhuCau() {
    FutureBuilder a = FutureBuilder<List<DiaDanhObject>>(
      future: lst,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<DiaDanhObject> lstRs = snapshot.data!;
          return ListView.builder(
              itemCount: lstRs.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RestaurantDetail()));
                  }, // Handle your callback
                  child: Column(
                    children: [
                      SizedBox(
                        height: 230,
                        width: 374,
                        child: Card(
                          elevation: 3.0,
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
                                urlImg + lstDiaDanhs[index].hinhanh.hinhAnh,
                                width: 374,
                                height: 132,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20, bottom: 12),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    lstDiaDanhs[index].tenDiaDanh,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0XFF000000),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 15, bottom: 12),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.place,
                                      color: Color(0XFF0869E1),
                                    ),
                                    Text(
                                      " " +
                                          lstDiaDanhs[index]
                                              .tinhthanh
                                              .tenTinhThanh,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0XFF050505),
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        }
        return Text("Không có dữ liệu");
      },
    );
  }
}
