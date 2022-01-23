import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MapPageState();
  }
}

class MapPageState extends State<MapPage> {
  late MapboxMapController mapController;
  final String lightMap =
      "https://tiles.goong.io/assets/goong_light_v2.json?api_key=EGAzhmbOrycEXAWPWtOspStQSZKW2CACMtGM7cvm";
  final String streetMap =
      "https://tiles.goong.io/assets/goong_map_web.json?api_key=EGAzhmbOrycEXAWPWtOspStQSZKW2CACMtGM7cvm";

  String styleMap =
      "https://tiles.goong.io/assets/goong_light_v2.json?api_key=EGAzhmbOrycEXAWPWtOspStQSZKW2CACMtGM7cvm";

  _onMapCreated(MapboxMapController controller) async {
    mapController = controller;
    final result = await acquireCurrentLocation();

    controller.animateCamera(
      CameraUpdate.newLatLng(result),
    );

    controller.addSymbol(
      const SymbolOptions(
        iconSize: 0.5,
        draggable: true,
        geometry: LatLng(9.994737, 104.0314351),
        iconImage: 'images/red_marker.png',
      ),
    );
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          MapboxMap(
            styleString: styleMap,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(10.5601935, 106.632571),
              zoom: 12,
            ),
            scrollGesturesEnabled: true,
            rotateGesturesEnabled: true,
            tiltGesturesEnabled: true,
            doubleClickZoomEnabled: true,
            myLocationEnabled: true,
          ),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 35, horizontal: 15),
              child: Card(
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.all(
                    Radius.circular(10),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefix: Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: FaIcon(
                        FontAwesomeIcons.mapMarkerAlt,
                        size: 18,
                        color: Color(0XFF242A37),
                      ),
                    ),
                    hintStyle:
                        TextStyle(fontSize: 16, color: Color(0XFF242A37)),
                    hintText: "Tìm địa điểm mà bạn muốn ...",
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
              )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 150),
        child: GestureDetector(
          onTap: () {
            mapController.animateCamera(
              CameraUpdate.zoomIn(),
            );
          },
          child: Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color(0XFF0066FF),
                borderRadius: BorderRadius.circular(100)),
            child: const FaIcon(
              FontAwesomeIcons.locationArrow,
              color: Colors.white,
              size: 14,
            ),
          ),
        ),
      ),
    );
  }
}
