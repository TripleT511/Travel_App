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
  FaIcon cusIcon = const FaIcon(
    FontAwesomeIcons.search,
    color: Color(0XFF0066FF),
  );

  Widget cusSearchBar = const Align(
    alignment: Alignment(0.15, 10),
    child: Text(
      "Điểm đến",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontFamily: 'Roboto',
        color: Color(0XFF242A37),
      ),
    ),
  );

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
                // ignore: unrelated_type_equality_checks
                if (cusIcon.icon == const FaIcon(FontAwesomeIcons.search) &&
                    mounted) {
                  cusIcon = const FaIcon(
                    FontAwesomeIcons.search,
                    color: Color(0XFF0066FF),
                  );
                  cusSearchBar = Container(
                    padding: const EdgeInsets.only(left: 10),
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
                  cusIcon = const FaIcon(
                    FontAwesomeIcons.search,
                    color: Color(0XFF0066FF),
                  );
                  cusSearchBar = const Align(
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
