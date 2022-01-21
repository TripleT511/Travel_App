import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vietnam_travel_app/Global/variables.dart';
import 'package:vietnam_travel_app/Models/luutru_object.dart';

import 'package:vietnam_travel_app/Providers/user_provider.dart';

class LuuTruProvider {
  static List<LuuTruObject> parseLuuTru(String reponseBody) {
    final pased = jsonDecode(reponseBody)["data"].cast<Map<String, dynamic>>();
    return pased.map<LuuTruObject>((e) => LuuTruObject.fromJson(e)).toList();
  }

  static Future<List<LuuTruObject>> getAllLuuTruByDiaDanh(int idDiaDanh) async {
    var token = await UserProvider.getToken();
    final response = await http
        .get(Uri.parse(urlAPI + 'diadanh/$idDiaDanh/luutru'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    return parseLuuTru(response.body);
  }
}
