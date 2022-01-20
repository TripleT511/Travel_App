import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vietnam_travel_app/Global/variables.dart';
import 'package:vietnam_travel_app/Models/diadanh_object.dart';
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
    final response =
        await http.get(Uri.parse(urlAPI + 'diadanh/noibat'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    return parseDiaDanh(response.body);
  }

  static Future<DiaDanhObject> getDiaDanhById(int id) async {
    var token = await getToken();
    final response =
        await http.get(Uri.parse(urlAPI + 'diadanh/$id'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var respon = jsonDecode(response.body);
    return DiaDanhObject.fromJson3(respon["data"]);
  }
}
