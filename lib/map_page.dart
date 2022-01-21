import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

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

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
    // _acquireCurrentLocation().then((LatLng location) {
    //   if (location != null) {
    //     controller.animateCamera(
    //       CameraUpdate.newCameraPosition(
    //         CameraPosition(
    //           target: location,
    //           zoom: 10,
    //         ),
    //       ),
    //     );
    //   }
    // }).catchError((error) => print(error));
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
              zoom: 9,
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
