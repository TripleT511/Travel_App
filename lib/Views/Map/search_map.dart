import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:vietnam_travel_app/Global/variables.dart';
import 'package:vietnam_travel_app/Models/address_object.dart';
import 'package:vietnam_travel_app/Providers/address_provider.dart';
import 'package:vietnam_travel_app/Views/Map/map_page.dart';
import 'dart:async';

// ignore: must_be_immutable
class SearchMap extends StatefulWidget {
  bool? isDirection;
  SearchMap({Key? key, this.isDirection}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return SearchMapState(isDirection);
  }
}

class SearchMapState extends State<SearchMap> {
  bool? isDirection;
  SearchMapState(this.isDirection);
  late List<AddressObject> data = [];
  TextEditingController txtSearch = TextEditingController();
  TextEditingController txtStart = TextEditingController();
  TextEditingController txtEnd = TextEditingController();
  final FocusNode fnOne = FocusNode();
  final FocusNode fnTwo = FocusNode();
  LatLng diemBatDau = const LatLng(0, 0);
  LatLng diemKetThuc = const LatLng(0, 0);
  int indexLoaiXe = 0;
  int indexInput = 0;
  List<String> loaiXe = ["car", "bike", "taxi"];
  Timer? _debounce;
  void _searchDiaDiem() async {
    if (indexInput == 0) {
      if (txtStart.text.isNotEmpty) {
        if (_debounce?.isActive ?? false) _debounce?.cancel();
        _debounce = Timer(const Duration(milliseconds: 100), () async {
          if (mounted) {
            setState(() {});
            data = await AddressProvider.getAllDiaDanh(txtStart.text);
          }
        });
      }
    }

    if (indexInput == 1) {
      if (txtEnd.text.isNotEmpty) {
        if (_debounce?.isActive ?? false) _debounce?.cancel();
        _debounce = Timer(const Duration(milliseconds: 100), () async {
          if (mounted) {
            setState(() {});
            data = await AddressProvider.getAllDiaDanh(txtEnd.text);
          }
        });
      }
    }

    if (txtSearch.text.isNotEmpty) {
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 100), () async {
        if (mounted) {
          setState(() {});
          data = await AddressProvider.getAllDiaDanh(txtSearch.text);
        }
      });
    }
  }

  void _viewBanDo(String placeId) async {
    PlaceDetailObject place = await AddressProvider.getPlaceDetail(placeId);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapPage(
          placeDetail: place,
        ),
      ),
    );
  }

  void _layToaDo(String info) async {
    PlaceDetailObject place = await AddressProvider.getPlaceDetail(info);
    if (place != null) {
      if (indexInput == 0) {
        setState(() {
          diemBatDau =
              LatLng(place.geometry.location.lat, place.geometry.location.lng);
          txtStart.text = place.name;
          fnOne.unfocus();
          if (diemKetThuc == const LatLng(0, 0)) {
            FocusScope.of(context).requestFocus(fnTwo);
            indexInput = 1;
          }
          if (diemKetThuc != const LatLng(0, 0)) {
            _direction();
          }
        });
      } else {
        setState(() {
          diemKetThuc =
              LatLng(place.geometry.location.lat, place.geometry.location.lng);
          txtEnd.text = place.name;
          fnTwo.unfocus();
          if (diemBatDau == const LatLng(0, 0)) {
            FocusScope.of(context).requestFocus(fnOne);
            indexInput = 0;
          }
          if (diemBatDau != const LatLng(0, 0)) {
            _direction();
          }
        });
      }
    }
  }

  _checkIn() async {
    final result = await acquireCurrentLocation();
    final geoCoding = await AddressProvider.getNameCurrentLocation(
        result.latitude, result.longitude);
    if (result != null) {
      if (mounted) {
        setState(() {
          if (indexInput == 0) {
            diemBatDau = LatLng(result.latitude, result.longitude);
            txtStart.text = geoCoding.address_components![0].short_name;
            fnOne.unfocus();
            if (diemKetThuc == const LatLng(0, 0)) {
              FocusScope.of(context).requestFocus(fnTwo);
              indexInput = 1;
            }
          } else if (indexInput == 1) {
            txtEnd.text = geoCoding.address_components![0].short_name;
            diemKetThuc = LatLng(result.latitude, result.longitude);
            fnTwo.unfocus();
            if (diemBatDau == const LatLng(0, 0)) {
              FocusScope.of(context).requestFocus(fnOne);
              indexInput = 0;
            }
          }
        });
        if (diemBatDau == diemKetThuc) {
          EasyLoading.showError('Điểm đến không được trùng với điểm đi');
          return;
        }

        if (diemBatDau != const LatLng(0, 0) &&
            diemKetThuc != const LatLng(0, 0) &&
            diemBatDau != diemKetThuc) {
          _direction();
        }
      }
    }
  }

  _direction() async {
    EasyLoading.show(status: "Đang tìm tuyến đường nhanh nhất...");
    final result = await AddressProvider.getDirection(
        diemBatDau, diemKetThuc, loaiXe[indexLoaiXe]);
    EasyLoading.dismiss();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapPage(
          direction: result,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF0F2F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            isDirection == false
                ? Card(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      color: Colors.white,
                      child: TextField(
                        controller: txtSearch,
                        onChanged: (value) => {
                          _searchDiaDiem(),
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Nhập địa điểm bạn muốn tìm kiếm...",
                          hintStyle: const TextStyle(
                            color: Color(0XFF242A37),
                          ),
                          contentPadding:
                              const EdgeInsets.only(left: 15.0, top: 15.0),
                          prefixIcon: IconButton(
                            icon: const FaIcon(FontAwesomeIcons.arrowLeft),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            iconSize: 20.0,
                            color: const Color(0XFF242A37),
                          ),
                          suffixIcon: IconButton(
                            icon: const FaIcon(FontAwesomeIcons.times),
                            onPressed: () {
                              setState(() {
                                txtSearch.clear();
                              });
                            },
                            iconSize: 20.0,
                            color: txtSearch.text.isNotEmpty
                                ? const Color(0X99242A37)
                                : const Color(0XFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  )
                : Card(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          iconSize: 20.0,
                          color: const Color(0XFF242A37),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 10, top: 5, bottom: 5),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextField(
                                  cursorColor: const Color(0XFF0066FF),
                                  controller: txtStart,
                                  onTap: () {
                                    setState(() {
                                      indexInput = 0;
                                    });
                                  },
                                  focusNode: fnOne,
                                  onChanged: (value) => {_searchDiaDiem()},
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Chọn vị trí bắt đầu...",
                                    hintStyle: const TextStyle(
                                      color: Color(0XFF242A37),
                                    ),
                                    contentPadding: const EdgeInsets.only(
                                        left: 5.0, top: 15.0),
                                    suffixIcon: IconButton(
                                      icon:
                                          const FaIcon(FontAwesomeIcons.times),
                                      onPressed: () {
                                        setState(() {
                                          txtStart.clear();
                                          diemBatDau = const LatLng(0, 0);
                                          data = [];
                                        });
                                      },
                                      iconSize: 20.0,
                                      color: const Color(0X99242A37),
                                    ),
                                  ),
                                ),
                                TextField(
                                  cursorColor: const Color(0XFF0066FF),
                                  controller: txtEnd,
                                  onTap: () {
                                    setState(() {
                                      indexInput = 1;
                                    });
                                  },
                                  focusNode: fnTwo,
                                  onChanged: (value) => {_searchDiaDiem()},
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Chọn điểm đến...",
                                    hintStyle: const TextStyle(
                                      color: Color(0XFF242A37),
                                    ),
                                    contentPadding: const EdgeInsets.only(
                                        left: 5.0, top: 15.0),
                                    suffixIcon: IconButton(
                                      icon:
                                          const FaIcon(FontAwesomeIcons.times),
                                      onPressed: () {
                                        setState(() {
                                          txtEnd.clear();
                                          diemKetThuc = const LatLng(0, 0);
                                          data = [];
                                        });
                                      },
                                      iconSize: 20.0,
                                      color: const Color(0X99242A37),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            isDirection == true
                ? Card(
                    margin: const EdgeInsets.all(0),
                    child: Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                indexLoaiXe = 0;
                              });
                            },
                            tooltip: 'Ô tô',
                            icon: FaIcon(
                              FontAwesomeIcons.car,
                              color: indexLoaiXe == 0
                                  ? const Color(0XFF0066FF)
                                  : const Color(0XFFB1BCD0),
                            ),
                            iconSize: 18,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                indexLoaiXe = 1;
                              });
                            },
                            tooltip: 'Xe đạp',
                            icon: FaIcon(
                              FontAwesomeIcons.bicycle,
                              color: indexLoaiXe == 1
                                  ? const Color(0XFF0066FF)
                                  : const Color(0XFFB1BCD0),
                            ),
                            iconSize: 18,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                indexLoaiXe = 2;
                              });
                            },
                            tooltip: 'Taxi',
                            icon: FaIcon(
                              FontAwesomeIcons.taxi,
                              color: indexLoaiXe == 2
                                  ? const Color(0XFF0066FF)
                                  : const Color(0XFFB1BCD0),
                            ),
                            iconSize: 18,
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
            isDirection == true && txtStart != null && txtEnd != null
                ? Container(
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: GestureDetector(
                      onTap: () {
                        _checkIn();
                      },
                      child: Card(
                        elevation: 1.0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(10),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: const ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color(0X1A006644),
                            child: FaIcon(
                              FontAwesomeIcons.mapMarkerAlt,
                              color: Color(0XFF0066FF),
                              size: 16,
                            ),
                          ),
                          title: Text(
                            "Vị trí của tôi",
                            softWrap: false,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ))
                : Container(),
            Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: ListView.builder(
                itemCount: data != [] ? data.length : 0,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (isDirection == false) {
                        _viewBanDo(data[index].place_id);
                      } else {
                        if (indexInput == 0) {
                          _layToaDo(data[index].place_id);
                        } else if (indexInput == 1) {
                          _layToaDo(data[index].place_id);
                        }
                      }
                    },
                    child: Card(
                      elevation: 1.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(10),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Color(0X1A006644),
                          child: FaIcon(
                            FontAwesomeIcons.mapMarkerAlt,
                            color: Color(0XFF0066FF),
                            size: 16,
                          ),
                        ),
                        title: Text(
                          data[index].structured_formatting.main_text,
                          softWrap: false,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          data[index].structured_formatting.secondary_text,
                          textAlign: TextAlign.left,
                          softWrap: false,
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            height: 1.2,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
