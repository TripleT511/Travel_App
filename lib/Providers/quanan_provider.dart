import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vietnam_travel_app/Models/nhucau_object.dart';
import 'package:vietnam_travel_app/Models/quanan2_object.dart';
import 'package:vietnam_travel_app/Models/quanan_object.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';

class QuanAnProvider {
  static List<QuanAnObject> parseQuanAn1(String reponseBody) {
    final pased = jsonDecode(reponseBody).cast<Map<String, dynamic>>();
    return pased.map<QuanAnObject>((e) => QuanAnObject.fromJson(e)).toList();
  }

  static List<QuanAn2Object> parseQuanAn(String reponseBody) {
    final pased = jsonDecode(reponseBody)["data"].cast<Map<String, dynamic>>();
    return pased.map<QuanAn2Object>((e) => QuanAn2Object.fromJson(e)).toList();
  }

  static Future<dynamic> getToken() async {
    /* ==== Lấy token từ Storage ==== */
    var token = await storage.read(key: "access_token");
    return token;
  }

  static Future<List<QuanAn2Object>> getAllQuanAnByDiaDanh(
      String idDiaDanh) async {
    var token = await getToken();
    final response = await http.get(
        Uri.parse(
            'https://shielded-lowlands-87962.herokuapp.com/api/diadanh/$idDiaDanh/quanan'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    return parseQuanAn(response.body);
  }

  static Future<List<QuanAnObject>> getQuanAnByID(String idQuanAn) async {
    var token = await getToken();
    final response = await http.get(
        Uri.parse('https://shielded-lowlands-87962.herokuapp.com/api/quanan/1'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    return parseQuanAn1(response.body);
  }
}
