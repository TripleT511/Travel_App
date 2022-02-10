import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vietnam_travel_app/Global/variables.dart';
import 'package:vietnam_travel_app/Models/address_object.dart';
import 'package:vietnam_travel_app/Models/diadanh_object.dart';
import 'package:vietnam_travel_app/Models/direction_object.dart';
import 'package:vietnam_travel_app/Models/hinhanh_object.dart';
import 'package:vietnam_travel_app/Views/Map/search_map.dart';
import 'package:vietnam_travel_app/de_xuat_dia_danh.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:math' as math;

// ignore: must_be_immutable
class MapPage extends StatefulWidget {
  DiaDanhObject? diadanh;
  PlaceDetailObject? placeDetail;
  DirectionObject? direction;
  MapPage({Key? key, this.diadanh, this.placeDetail, this.direction})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return MapPageState(diadanh, placeDetail, direction);
  }
}

class MapPageState extends State<MapPage> {
  DiaDanhObject? diadanh;
  PlaceDetailObject? placeDetail;
  DirectionObject? direction;
  MapPageState(this.diadanh, this.placeDetail, this.direction);
  late MapboxMapController mapController;
  final LatLng center = const LatLng(10.5601935, 106.632571);
  String styleMap =
      "https://tiles.goong.io/assets/goong_light_v2.json?api_key=" + apiKeyMap;
  List<HinhAnhObject> lstHinhAnh = [];
  _addline() {
    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> result =
        polylinePoints.decodePolyline(direction!.overview_polyline.points);
    List<LatLng> list = [];
    for (var item in result) {
      list.add(LatLng(item.latitude, item.longitude));
    }
    if (mounted) {
      mapController.addLine(
        LineOptions(
            geometry: list,
            lineColor: "#0066ff",
            lineWidth: 8.0,
            lineOpacity: 1,
            draggable: false),
      );
    }
  }

  _onMapCreated(MapboxMapController controller) async {
    mapController = controller;
    if (direction != null) {
      _addline();
      PolylinePoints polylinePoints = PolylinePoints();
      List<PointLatLng> result =
          polylinePoints.decodePolyline(direction!.overview_polyline.points);
      controller.addCircle(
        CircleOptions(
          geometry: LatLng(result[0].latitude, result[0].longitude),
          circleColor: "#0066FF",
          circleStrokeColor: "#FFFFFF",
          circleStrokeWidth: 3,
          circleRadius: 7,
        ),
      );
      int centerIndex = result.length ~/ 2;
      double centerLat = result[centerIndex].latitude;
      double centerLng = result[centerIndex].longitude;
      controller.addSymbol(
        SymbolOptions(
          iconSize: 1,
          geometry: LatLng(result[result.length - 1].latitude,
              result[result.length - 1].longitude),
          iconImage: 'images/red_marker.png',
        ),
      );
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(centerLat, centerLng),
            zoom: 9,
          ),
        ),
      );
    } else if (placeDetail != null) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(placeDetail!.geometry.location.lat,
                  placeDetail!.geometry.location.lng),
              zoom: 12),
        ),
      );

      controller.addSymbol(
        SymbolOptions(
          iconSize: 1,
          draggable: false,
          geometry: LatLng(placeDetail!.geometry.location.lat,
              placeDetail!.geometry.location.lng),
          iconImage: 'images/red_marker.png',
        ),
      );

      // showModal(null, placeDetail);
    } else if (diadanh != null) {
      double viDo = double.parse(diadanh!.viDo);
      double kinhDo = double.parse(diadanh!.kinhDo);
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(viDo, kinhDo), zoom: 12),
        ),
      );

      controller.addSymbol(
        SymbolOptions(
          iconSize: 1,
          draggable: false,
          geometry: LatLng(viDo, kinhDo),
          iconImage: 'images/red_marker.png',
        ),
      );
      if (mounted) {
        setState(() {
          lstHinhAnh = diadanh!.hinhanhs!;
        });
      }
    } else {
      final result = await acquireCurrentLocation();
      controller.animateCamera(
        CameraUpdate.newLatLng(result),
      );
    }
  }

  _viTriCuaToi() async {
    final result = await acquireCurrentLocation();

    mapController
        .animateCamera(
          CameraUpdate.newLatLng(result),
        )
        .then((result) =>
            print("mapController.animateCamera() returned $result"));
  }

  Widget showModal(DiaDanhObject? diadanh, PlaceDetailObject? placeDetail) {
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
        Container(
          alignment: Alignment.centerLeft,
          margin:
              const EdgeInsets.only(top: 10, bottom: 5, left: 15, right: 15),
          child: Text(
            diadanh != null ? diadanh.tenDiaDanh : placeDetail!.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color(0XFF242A37),
            ),
          ),
        ),
        diadanh != null
            ? Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 5, left: 15, right: 15),
                child: Text(
                  diadanh.shares_count.toString() + " lượt đánh giá",
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Color(0XFFB1BCD0),
                    fontSize: 14,
                  ),
                ),
              )
            : Container(),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
          child: Text(
            diadanh != null
                ? diadanh.tinhthanh!.tenTinhThanh
                : placeDetail!.formatted_address,
            softWrap: true,
            overflow: TextOverflow.clip,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Color(0XFFB1BCD0),
              fontSize: 14,
            ),
          ),
        ),
        Row(
          children: [
            diadanh == null && placeDetail != null
                ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeXuatDiaDanh(
                            placeDetail: placeDetail,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 7, bottom: 7),
                      margin: const EdgeInsets.only(right: 10, left: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0XFFFFFFFF),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: const Color(0XFFB1BCD0),
                          width: 0.5,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.buffer,
                            color: Color(0XFF0066FF),
                            size: 14,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Đề xuất địa danh",
                            style: TextStyle(
                              color: Color(0XFF0066FF),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        diadanh != null
            ? SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                height: 150,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: lstHinhAnh.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          urlImage + lstHinhAnh[index].hinhAnh,
                          fit: BoxFit.cover,
                          width: 200,
                          height: 150,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Container(),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Bản đồ",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: 'Roboto',
            color: Color(0XFF242A37),
          ),
        ),
      ),
      body: SlidingUpPanel(
        minHeight: direction != null
            ? 150
            : diadanh != null || placeDetail != null
                ? 130
                : 0,
        maxHeight: direction != null ? MediaQuery.of(context).size.height : 300,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        body: Stack(
          children: [
            MapboxMap(
              styleString: styleMap,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: center,
                zoom: 10,
              ),
              scrollGesturesEnabled: true,
              rotateGesturesEnabled: true,
              tiltGesturesEnabled: true,
              doubleClickZoomEnabled: true,
              myLocationEnabled: true,
              annotationOrder: const [
                AnnotationType.line,
                AnnotationType.symbol,
                AnnotationType.circle,
                AnnotationType.fill,
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 1.7,
              right: 20,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _viTriCuaToi();
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0XFFFFFFFF),
                          borderRadius: BorderRadius.circular(100)),
                      child: const Icon(
                        Icons.my_location_outlined,
                        size: 25,
                        color: Color(0XFF0066FF),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  direction == null && diadanh == null && placeDetail == null
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchMap(
                                        isDirection: true,
                                      )),
                            );
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: const Color(0XFF0066FF),
                                borderRadius: BorderRadius.circular(10)),
                            child: Transform.rotate(
                              angle: -90 * math.pi / 180,
                              child: const FaIcon(
                                FontAwesomeIcons.levelDownAlt,
                                size: 18,
                                color: Color(0XFFFFFFFF),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          direction == null && diadanh == null && placeDetail == null
                ? Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 10.0, right: 10.0),
                    child: Card(
                      elevation: 1.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(10)),
                      clipBehavior: Clip.antiAlias,
                      child: SizedBox(
                        height: 50.0,
                        width: double.infinity,
                        child: TextField(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchMap(
                                        isDirection: false,
                                      )),
                            );
                          },
                          showCursor: true,
                          readOnly: true,
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            hintText: "Tìm địa điểm mà bạn muốn",
                            hintStyle:
                                const TextStyle(color: Color(0XFF242A37)),
                            border: InputBorder.none,
                            contentPadding:
                                const EdgeInsets.only(left: 15.0, top: 15.0),
                            prefixIcon: IconButton(
                              icon: const FaIcon(FontAwesomeIcons.mapMarkerAlt),
                              onPressed: () {},
                              iconSize: 20.0,
                              color: const Color(0XFF0066FF),
                            ),
                            suffixIcon: IconButton(
                              icon: const FaIcon(FontAwesomeIcons.search),
                              onPressed: () {},
                              iconSize: 20.0,
                              color: const Color(0XFF242A37),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
        panel: direction != null
            ? showModalDirection(direction!)
            : diadanh != null
                ? showModal(diadanh, null)
                : placeDetail != null
                    ? showModal(null, placeDetail)
                    : Container(),
      ),
    );
  }
}
