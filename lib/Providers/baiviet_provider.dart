import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vietnam_travel_app/Models/baiviet_object.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';

class BaiVietProvider {
  static List<BaiVietChiaSeObject> parseBaiViet(String reponseBody) {
    final pased = jsonDecode(reponseBody)["data"].cast<Map<String, dynamic>>();
    return pased
        .map<BaiVietChiaSeObject>((e) => BaiVietChiaSeObject.fromJson(e))
        .toList();
  }

  static Future<dynamic> getToken() async {
    /* ==== Lấy token từ Storage ==== */
    var token = await storage.read(key: "access_token");
    return token;
  }

  static Future<List<BaiVietChiaSeObject>> getAllBaiViet() async {
    var token = await getToken();
    final response = await http.get(
        Uri.parse('https://shielded-lowlands-87962.herokuapp.com/api/baiviet'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    return parseBaiViet(response.body);
  }

  static Future<List<BaiVietChiaSeObject>> getAllBaiVietNoiBat() async {
    var token = await getToken();
    final response = await http.get(
        Uri.parse(
            'https://shielded-lowlands-87962.herokuapp.com/api/baiviet/noibat'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    return parseBaiViet(response.body);
  }
}
