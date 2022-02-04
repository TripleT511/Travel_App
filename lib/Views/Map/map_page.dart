import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:location/location.dart';
import 'package:vietnam_travel_app/Global/variables.dart';
import 'package:vietnam_travel_app/Models/address_object.dart';
import 'package:vietnam_travel_app/Models/diadanh_object.dart';
import 'package:vietnam_travel_app/Models/hinhanh_object.dart';
import 'package:vietnam_travel_app/Views/Map/search_map.dart';

// ignore: must_be_immutable
class MapPage extends StatefulWidget {
  DiaDanhObject? diadanh;
  PlaceDetailObject? placeDetail;
  MapPage({Key? key, this.diadanh, this.placeDetail}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return MapPageState(diadanh, placeDetail);
  }
}

class MapPageState extends State<MapPage> {
  DiaDanhObject? diadanh;
  PlaceDetailObject? placeDetail;
  MapPageState(this.diadanh, this.placeDetail);

  late MapboxMapController mapController;
  final LatLng center = const LatLng(10.5601935, 106.632571);
  String styleMap =
      "https://tiles.goong.io/assets/goong_light_v2.json?api_key=" + apiKeyMap;
  List<HinhAnhObject> lstHinhAnh = [];

  _onMapCreated(MapboxMapController controller) async {
    mapController = controller;

    if (placeDetail != null) {
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
          draggable: true,
          geometry: LatLng(placeDetail!.geometry.location.lat,
              placeDetail!.geometry.location.lng),
          iconImage: 'images/red_marker.png',
        ),
      );

      showModal(null, placeDetail);
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
          draggable: true,
          geometry: LatLng(viDo, kinhDo),
          iconImage: 'images/red_marker.png',
        ),
      );
      if (mounted) {
        setState(() {
          lstHinhAnh = diadanh!.hinhanhs!;
        });
      }
      showModal(diadanh, null);
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

  showModal(DiaDanhObject? diadanh, PlaceDetailObject? placeDetail) {
    showModalBottomSheet(
        context: context,
        elevation: 5.0,
        clipBehavior: Clip.antiAlias,
        enableDrag: true,
        barrierColor: Colors.transparent,
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
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(
                    top: 10, bottom: 5, left: 15, right: 15),
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
                      margin:
                          const EdgeInsets.only(bottom: 5, left: 15, right: 15),
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
                  diadanh != null
                      ? Container(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 7, bottom: 7),
                          margin: const EdgeInsets.only(right: 10, left: 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0XFF0066FF),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              FaIcon(
                                FontAwesomeIcons.shareAlt,
                                color: Colors.white,
                                size: 14,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Chia sẻ",
                                style: TextStyle(
                                  color: Color(0XFFFFFFFF),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
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
        });
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
      body: Stack(
        children: [
          MapboxMap(
            styleString: styleMap,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: center,
              zoom: 13,
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
          diadanh == null && placeDetail == null
              ? Padding(
                  padding:
                      const EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
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
                                builder: (context) => const SearchMap()),
                          );
                        },
                        showCursor: true,
                        readOnly: true,
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          hintText: "Tìm địa điểm mà bạn muốn",
                          hintStyle: const TextStyle(color: Color(0XFF242A37)),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 130),
        child: GestureDetector(
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
      ),
    );
  }
}
