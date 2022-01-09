import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/Models/tinhthanh_object.dart';
import 'package:vietnam_travel_app/Providers/tinhthanh_provider.dart';
import 'package:vietnam_travel_app/personal_page.dart';
import 'package:vietnam_travel_app/search_page_result.dart';

import 'main.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  Icon cusIcon = const Icon(
    Icons.search,
    size: 30,
    color: Color(0XFF0066FF),
  );

  Widget cusSearchBar = const Align(
      alignment: Alignment(0.15, 10),
      child: Text("ĐIỂM ĐẾN",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0XFF0066FF))));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        leadingWidth: 0,
        titleSpacing: 0,
        elevation: 1.5,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (this.cusIcon.icon == Icons.search && this.mounted) {
                  this.cusIcon = const Icon(
                    Icons.cancel,
                    size: 30,
                    color: Color(0XFF0066FF),
                  );
                  this.cusSearchBar = Container(
                    padding: EdgeInsets.only(left: 10),
                    child: const TextField(
                      textInputAction: TextInputAction.go,
                      // controller: txtSearch,
                      // onChanged: (String value) {
                      //   _SearchTinhThanh();
                      // },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Nhập địa điểm cần đến",
                      ),
                    ),
                  );
                } else {
                  this.cusIcon = const Icon(
                    Icons.search,
                    size: 30,
                    color: Color(0XFF0066FF),
                  );
                  this.cusSearchBar = const Align(
                    alignment: Alignment(0.15, 10),
                    child: Text(
                      "ĐIỂM ĐẾN",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF0066FF),
                      ),
                    ),
                  );
                }
              });
            },
            icon: cusIcon,
          ),
        ],
        title: cusSearchBar,
      ),
      // Padding(
      //   padding: const EdgeInsets.only(left: 10, right: 10),
      //   child: TextButton(
      //     onPressed: () {},
      //     child: Row(
      //       children: [
      //         const FaIcon(
      //           FontAwesomeIcons.locationArrow,
      //           size: 20,
      //         ),
      //         Container(
      //           margin: const EdgeInsets.only(left: 10),
      //           child: const Text(
      //             "Sử dụng vị trí của bạn ngay bây giờ",
      //             style: TextStyle(
      //               color: Color(0XFF65676B),
      //               fontSize: 16,
      //               fontFamily: 'Roboto',
      //             ),
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      body: Container(
        padding: EdgeInsets.only(top: 15),
        child: FutureBuilder(
          future: TinhThanhProvider.getAllTinhThanh(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Có lỗi xảy ra!!!'),
              );
            } else if (snapshot.hasData) {
              List<TinhThanhObject> lstTinhThanh = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) => Card(
                  elevation: 3.0,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SearchResult(tinhthanh: lstTinhThanh[index]),
                        ),
                      );
                    },
                    title: Text(
                      lstTinhThanh[index].tenTinhThanh,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
