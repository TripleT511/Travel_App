import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vietnam_travel_app/Models/diadanh_object.dart';
import 'package:vietnam_travel_app/Models/tinhthanh_object.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';

class DiaDanhProvider {
  static List<DiaDanhObject> parseDiaDanh(String reponseBody) {
    final pased = jsonDecode(reponseBody)["data"].cast<Map<String, dynamic>>();
    return pased.map<DiaDanhObject>((e) => DiaDanhObject.fromJson(e)).toList();
  }

  static Future<dynamic> getToken() async {
    /* ==== Lấy token từ Storage ==== */
    var token = await storage.read(key: "access_token");
    return token;
  }

  static Future<List<DiaDanhObject>> getAllDiaDanh() async {
    var token = await getToken();
    final response = await http.get(
        Uri.parse('https://shielded-lowlands-87962.herokuapp.com/api/diadanh'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    // var data = jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
    // ;
    // print(data);
    return parseDiaDanh(response.body);

    // return data
    //     .map<TinhThanhObject>((e) => TinhThanhObject.fromJson(e))
    //     .toList();
  }
}