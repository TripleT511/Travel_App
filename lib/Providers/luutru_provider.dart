import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vietnam_travel_app/Models/luutru_object.dart';

import 'package:vietnam_travel_app/Models/nhucau_object.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';

class LuuTruProvider {
  static List<LuuTruObject> parseLuuTru(String reponseBody) {
    final pased = jsonDecode(reponseBody)["data"].cast<Map<String, dynamic>>();
    return pased.map<LuuTruObject>((e) => LuuTruObject.fromJson(e)).toList();
  }

  static Future<dynamic> getToken() async {
    /* ==== Lấy token từ Storage ==== */
    var token = await storage.read(key: "access_token");
    return token;
  }

  static Future<List<LuuTruObject>> getAllLuuTruByDiaDanh(
      String idDiaDanh) async {
    var token = await getToken();
    final response = await http.get(
        Uri.parse(
            'https://shielded-lowlands-87962.herokuapp.com/api/diadanh/$idDiaDanh/luutru'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    return parseLuuTru(response.body);
  }
}
