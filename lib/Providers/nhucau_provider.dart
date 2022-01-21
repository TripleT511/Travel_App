import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vietnam_travel_app/Global/variables.dart';
import 'package:vietnam_travel_app/Models/nhucau_object.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';

class NhuCauProvider {
  static List<NhuCauObject> parseTinhThanh(String reponseBody) {
    final pased = jsonDecode(reponseBody)["data"].cast<Map<String, dynamic>>();
    return pased.map<NhuCauObject>((e) => NhuCauObject.fromJson(e)).toList();
  }

  static Future<List<NhuCauObject>> getAllNhuCau() async {
    var token = await UserProvider.getToken();
    final response = await http.get(Uri.parse(urlAPI + 'nhucau'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    return parseTinhThanh(response.body);
  }

  static Future<NhuCauObject> getDiaDanhByIdNhuCau(int id) async {
    var token = await UserProvider.getToken();
    final response = await http.get(Uri.parse(urlAPI + 'nhucau/$id'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    var respon = jsonDecode(response.body);
    return NhuCauObject.fromJson2(respon["data"]);
  }
}
