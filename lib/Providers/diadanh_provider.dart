import 'dart:convert';

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:vietnam_travel_app/Global/variables.dart';
import 'package:vietnam_travel_app/Models/diadanh_object.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';

class DiaDanhProvider {
  static List<DiaDanhObject> parseDiaDanh(String reponseBody) {
    final pased = jsonDecode(reponseBody)["data"].cast<Map<String, dynamic>>();
    return pased.map<DiaDanhObject>((e) => DiaDanhObject.fromJson(e)).toList();
  }

  static Future<List<DiaDanhObject>> getAllDiaDanh() async {
    var token = await UserProvider.getToken();
    final response =
        await http.get(Uri.parse(urlAPI + 'diadanh/noibat'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    return parseDiaDanh(response.body);
  }

  static Future<DiaDanhObject> getDiaDanhById(int id) async {
    var token = await UserProvider.getToken();
    final response =
        await http.get(Uri.parse(urlAPI + 'diadanh/$id'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var respon = jsonDecode(response.body);
    return DiaDanhObject.fromJson3(respon["data"]);
  }

  static Future<bool> deXuatDiaDanh(
      String tenDiaDanh,
      String moTa,
      String kinhDo,
      String viDo,
      String tinhThanhId,
      File _image,
      String? tenTinhThanh) async {
    var token = await UserProvider.getToken();
    var stream = http.ByteStream(_image.openRead());
    stream.cast();
    var length = await _image.length();
    Map<String, String> headers = {"Authorization": "Bearer $token"};

    var uri = Uri.parse(urlAPI + "dexuat");
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(headers);
    request.fields["tenDiaDanh"] = tenDiaDanh;
    request.fields["moTa"] = moTa;
    request.fields["kinhDo"] = kinhDo;
    request.fields["viDo"] = viDo;
    request.fields["tinh_thanh_id"] = tinhThanhId;
    if (tenTinhThanh != null) {
      request.fields["tenTinhThanh"] = tenTinhThanh;
    }

    var multiport =
        http.MultipartFile("hinhAnh", stream, length, filename: _image.path);

    request.files.add(multiport);
    var response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
