import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/Models/tinhthanh_object.dart';
import 'package:vietnam_travel_app/Providers/tinhthanh_provider.dart';
import 'package:vietnam_travel_app/search_page_result.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF0F2F5),
      appBar: AppBar(
        leading: null,
        leadingWidth: 0,
        titleSpacing: 0,
        elevation: 1.0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0XFFFFFFFF),
        title: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Expanded(
                child: TextField(
                  textInputAction: TextInputAction.go,
                  // controller: txtSearch,
                  // onChanged: (String value) {
                  //   _SearchTinhThanh();
                  // },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Nhập địa điểm cần đến...",
                    hintStyle: TextStyle(
                      color: Color(0XFF242A37),
                    ),
                  ),
                ),
              ),
              FaIcon(
                FontAwesomeIcons.search,
                color: Color(0XFF242A37),
                size: 20,
              ),
            ],
          ),
        ),
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
        padding: const EdgeInsets.only(top: 10),
        child: FutureBuilder(
          future: TinhThanhProvider.getAllTinhThanh(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Có lỗi xảy ra!!!'),
              );
            } else if (snapshot.hasData) {
              List<TinhThanhObject> lstTinhThanh = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) => Card(
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
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }
            return const Center(
              child: SpinKitFadingCircle(
                color: Color(0XFF0066FF),
                size: 50.0,
              ),
            );
          },
        ),
      ),
    );
  }
}
