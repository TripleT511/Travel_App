import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:location/location.dart';
import 'package:vietnam_travel_app/Global/variables.dart';
import 'package:vietnam_travel_app/Models/address_object.dart';
import 'package:vietnam_travel_app/Providers/address_provider.dart';
import 'package:vietnam_travel_app/Views/search_map.dart';

class MapPage extends StatefulWidget {
  late double? viDo;
  late double? kinhDo;
  MapPage({Key? key, this.viDo, this.kinhDo}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MapPageState(viDo, kinhDo);
  }
}

class MapPageState extends State<MapPage> {
  late double? viDo;
  late double? kinhDo;
  MapPageState(this.viDo, this.kinhDo);

  late MapboxMapController mapController;
  final LatLng center = const LatLng(10.5601935, 106.632571);
  String styleMap =
      "https://tiles.goong.io/assets/goong_light_v2.json?api_key=" + apiKeyMap;

  _onMapCreated(MapboxMapController controller) async {
    mapController = controller;

    final result = await acquireCurrentLocation();
    if (viDo != null) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(viDo!, kinhDo!), zoom: 14),
        ),
      );

      controller.addSymbol(
        SymbolOptions(
          iconSize: 1,
          draggable: true,
          geometry: LatLng(viDo!, kinhDo!),
          iconImage: 'images/red_marker.png',
        ),
      );
    } else {
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

  void onStyleLoaded(MapboxMapController controller) {
    controller.addSymbol(
      SymbolOptions(
        geometry: LatLng(
          center.latitude,
          center.longitude,
        ),
        iconImage: "images/red_marker.png",
        iconSize: 0.5,
        draggable: true,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          MapboxMap(
            styleString: styleMap,
            onMapCreated: _onMapCreated,
            onStyleLoadedCallback: () => onStyleLoaded(mapController),
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
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
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
          ),
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
