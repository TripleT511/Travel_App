import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vietnam_travel_app/Global/variables.dart';
import 'package:vietnam_travel_app/Models/address_object.dart';

class AddressProvider {
  static List<AddressObject> parseDiaDanh(String reponseBody) {
    final pased =
        jsonDecode(reponseBody)["predictions"].cast<Map<String, dynamic>>();
    return pased.map<AddressObject>((e) => AddressObject.fromJson(e)).toList();
  }

  static Future<List<AddressObject>> getAllDiaDanh(
      String input, String? viDo, String? kinhDo) async {
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
}
