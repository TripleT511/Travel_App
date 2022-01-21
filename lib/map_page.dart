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
  final String navDayMap =
      "https://tiles.goong.io/assets/navigation_day.json?api_key=EGAzhmbOrycEXAWPWtOspStQSZKW2CACMtGM7cvm";
  final String navNightMap =
      "https://tiles.goong.io/assets/navigation_night.json?api_key=EGAzhmbOrycEXAWPWtOspStQSZKW2CACMtGM7cvm";

  String styleMap =
      "https://tiles.goong.io/assets/goong_light_v2.json?api_key=EGAzhmbOrycEXAWPWtOspStQSZKW2CACMtGM7cvm";

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MapboxMap(
        styleString: styleMap,
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(10.5601935, 106.632571),
          zoom: 9,
        ),
        scrollGesturesEnabled: true,
        rotateGesturesEnabled: true,
        tiltGesturesEnabled: true,
        doubleClickZoomEnabled: true,
        myLocationEnabled: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 450),
        child: Column(
          children: [
            GestureDetector(
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
                    borderRadius: BorderRadius.circular(10)),
                child: const FaIcon(
                  FontAwesomeIcons.searchPlus,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                mapController.animateCamera(
                  CameraUpdate.zoomOut(),
                );
              },
              child: Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color(0XFF0066FF),
                    borderRadius: BorderRadius.circular(10)),
                child: const FaIcon(
                  FontAwesomeIcons.searchMinus,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
