import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vietnam_travel_app/Models/quanan_object.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';

class QuanAnProvider {
  static List<QuanAnObject> parseQuanAn(String reponseBody) {
    final pased = jsonDecode(reponseBody)["data"].cast<Map<String, dynamic>>();
    return pased.map<QuanAnObject>((e) => QuanAnObject.fromJson2(e)).toList();
  }

  static Future<dynamic> getToken() async {
    /* ==== Lấy token từ Storage ==== */
    var token = await storage.read(key: "access_token");
    return token;
  }

  static Future<List<QuanAnObject>> getAllQuanAnByDiaDanh(
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

  static Future<QuanAnObject> getQuanAnByID(int idQuanAn) async {
    var token = await getToken();
    final response = await http.get(
        Uri.parse(
            'https://shielded-lowlands-87962.herokuapp.com/api/quanan/$idQuanAn'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    return QuanAnObject.fromJson(jsonDecode(response.body)[0]);
  }
}
