import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vietnam_travel_app/Global/variables.dart';
import 'package:vietnam_travel_app/Models/tinhthanh_object.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';

class TinhThanhProvider {
  static List<TinhThanhObject> parseTinhThanh(String reponseBody) {
    final pased = jsonDecode(reponseBody)["data"].cast<Map<String, dynamic>>();
    return pased
        .map<TinhThanhObject>((e) => TinhThanhObject.fromJson(e))
        .toList();
  }

  static Future<List<TinhThanhObject>> getAllTinhThanh() async {
    var token = await UserProvider.getToken();
    final response = await http.get(Uri.parse(urlAPI + 'tinhthanh'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    // var data = jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
    // ;
    // print(data);
    return parseTinhThanh(response.body);

    // return data
    //     .map<TinhThanhObject>((e) => TinhThanhObject.fromJson(e))
    //     .toList();
  }

  //  Tìm kiếm danh bạ
  static Future<List<TinhThanhObject>> searchTinhThanh(
      String searchString) async {
    List<TinhThanhObject> lstResult = [];
    List<dynamic> data = await getAllTinhThanh();

    if (searchString == '') return lstResult = [];

    for (var e in data) {
      TinhThanhObject co = TinhThanhObject.fromJson(e);
      if (co.tenTinhThanh.toUpperCase().contains(searchString.toUpperCase())) {
        lstResult.add(co);
      }
    }
    return lstResult;
  }
}
