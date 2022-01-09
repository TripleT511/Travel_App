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
    size: 20,
    color: Color(0XFF0869E1),
  );

  Widget cusSearchBar = const Align(
      alignment: Alignment(0.15, 10),
      child: Text("ĐIỂM ĐẾN",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0XFF0869E1))));

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
                    size: 20,
                    color: Color(0XFF0869E1),
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
                    size: 20,
                    color: Color(0XFF0869E1),
                  );
                  this.cusSearchBar = const Align(
                    alignment: Alignment(0.15, 10),
                    child: Text(
                      "ĐIỂM ĐẾN",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF0869E1),
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
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: 20,
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(left: 10, right: 10),
      //         child: TextButton(
      //           onPressed: () {},
      //           child: Row(
      //             children: [
      //               const FaIcon(
      //                 FontAwesomeIcons.locationArrow,
      //                 size: 20,
      //               ),
      //               Container(
      //                 margin: const EdgeInsets.only(left: 10),
      //                 child: const Text(
      //                   "Sử dụng vị trí của bạn ngay bây giờ",
      //                   style: TextStyle(
      //                     color: Color(0XFF65676B),
      //                     fontSize: 16,
      //                     fontFamily: 'Roboto',
      //                   ),
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //       FutureBuilder(
      //         future: TinhThanhProvider.getAllTinhThanh(),
      //         builder: (BuildContext context, AsyncSnapshot snapshot) {
      //           if (snapshot.hasError) {
      //             return Center(
      //               child: Text('Có lỗi xảy ra!!!'),
      //             );
      //           } else if (snapshot.hasData) {
      //             lstTinhThanh = snapshot.data!;
      //             return ListView.builder(
      //               scrollDirection: Axis.vertical,
      //               shrinkWrap: true,
      //               itemCount: snapshot.data.length,
      //               itemBuilder: (context, index) => MaterialButton(
      //                 onPressed: () {
      //                   Navigator.push(
      //                       context,
      //                       MaterialPageRoute(
      //                           builder: (context) => SearchResult(
      //                                 tinhthanh: lstTinhThanh[index],
      //                               )));
      //                 },
      //                 child: Column(
      //                   children: [
      //                     Container(
      //                       alignment: Alignment.centerLeft,
      //                       margin: const EdgeInsets.only(bottom: 5),
      //                       child: Text(
      //                         lstTinhThanh[index].tenTinhThanh,
      //                         style: TextStyle(
      //                           fontFamily: 'Roboto',
      //                           fontSize: 16,
      //                           fontWeight: FontWeight.bold,
      //                         ),
      //                       ),
      //                     ),
      //                     Container(
      //                       margin: const EdgeInsets.only(bottom: 15),
      //                       decoration: const BoxDecoration(
      //                         border: Border.fromBorderSide(
      //                           BorderSide(
      //                             width: 0.5,
      //                             color: Color(0XFFD2D4D8),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             );
      //           }
      //           return Center(
      //             child: CircularProgressIndicator(),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
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
