import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:vietnam_travel_app/Global/variables.dart';
import 'package:vietnam_travel_app/Models/address_object.dart';
import 'package:vietnam_travel_app/Models/direction_object.dart';
import 'package:vietnam_travel_app/Models/geocoding_object.dart';

class AddressProvider {
  static List<AddressObject> parseDiaDanh(String reponseBody) {
    final pased =
        jsonDecode(reponseBody)["predictions"].cast<Map<String, dynamic>>();
    return pased.map<AddressObject>((e) => AddressObject.fromJson(e)).toList();
  }

  static Future<List<AddressObject>> getAllDiaDanh(String input) async {
    String key = apiKeyMaHoa;
    if (input.isEmpty) return [];
    final response = await http.get(Uri.parse(
        "https://rsapi.goong.io/Place/AutoComplete?api_key=$key&input=$input"));

    return parseDiaDanh(response.body);
  }

  static Future<PlaceDetailObject> getPlaceDetail(String placeId) async {
    String key = apiKeyMaHoa;
    final response = await http.get(Uri.parse(
        "https://rsapi.goong.io/Place/Detail?place_id=$placeId&api_key=$key"));
    return PlaceDetailObject.fromJson(jsonDecode(response.body)["result"]);
  }

  static Future<ReverseGeoObject> getNameCurrentLocation(
      double lat, double lng) async {
    String key = apiKeyMaHoa;
    final response = await http.get(Uri.parse(
        "https://rsapi.goong.io/Geocode?latlng=$lat,$lng&api_key=$key"));
    final data = response.body;
    return ReverseGeoObject.fromJson(jsonDecode(data)["results"][0]);
  }

  static Future<DirectionObject> getDirection(
      LatLng start, LatLng end, String type) async {
    String key = apiKeyMaHoa;
    String diemBatDau =
        start.latitude.toString() + "," + start.longitude.toString();
    String demKetThuc =
        end.latitude.toString() + "," + end.longitude.toString();
    final response = await http.get(Uri.parse(
        "https://rsapi.goong.io/Direction?origin=$diemBatDau&destination=$demKetThuc&vehicle=$type&api_key=$key"));
    final data = response.body;

    return DirectionObject.fromJson(jsonDecode(data)["routes"][0]);
  }
}
