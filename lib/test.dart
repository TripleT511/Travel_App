import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/Models/diadanh_object.dart';
import 'package:vietnam_travel_app/Models/nhucau_object.dart';
import 'package:vietnam_travel_app/Providers/diadanh_provider.dart';
import 'package:vietnam_travel_app/Providers/nhucau_provider.dart';

class TextPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TextPageState();
  }
}

class TextPageState extends State<TextPage> {
  List<DiaDanhObject> lstResult = [];
  String urlImg = 'https://shielded-lowlands-87962.herokuapp.com/';
  _bindingDiaDanh() async {
    setState(() {});
    lstResult = await DiaDanhProvider.getAllDiaDanh();
  }

  @override
  void initState() {
    super.initState();
    _bindingDiaDanh();
  }

  Widget VungDiaDanh() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: Colors.grey[350],
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: lstResult.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {},
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Card(
                          elevation: 3.0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.all(
                              Radius.circular(16),
                            ),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            urlImg + lstResult[index].hinhanh.hinhAnh,
                            /*a.image*/
                            width: double.maxFinite,
                            height: 210,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 185,
                          left: 20,
                          child: Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.mapMarkerAlt,
                                color: Color(0XFFFF3535),
                                size: 18,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  lstResult[index].tenDiaDanh,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ];
      },
      body: Container(
        child: Text('xvzx'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 210,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: lstResult.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    width: 271,
                    height: 210,
                    child: GestureDetector(
                      onTap: () {},
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Card(
                            elevation: 3.0,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(16),
                              ),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.network(
                              urlImg + lstResult[index].hinhanh.hinhAnh,
                              /*a.image*/
                              width: double.maxFinite,
                              height: 210,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 170,
                            left: 20,
                            child: Row(
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.mapMarkerAlt,
                                  color: Color(0XFFFF3535),
                                  size: 18,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    lstResult[index].tenDiaDanh,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
