import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vietnam_travel_app/Models/user_object.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

class UserProvider {
  static List<UserObject> parseUsers(String reponseBody) {
    final pased = jsonDecode(reponseBody).cast<Map<String, dynamic>>();
    return pased.map<UserObject>((e) => UserObject.fromJson(e)).toList();
  }

  static Future<UserObject> getUser() async {
    var token = await getToken();
    final response = await http.get(
        Uri.parse('https://shielded-lowlands-87962.herokuapp.com/api/user'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    SharedPreferences pres = await SharedPreferences.getInstance();
    String user = response.body;
    pres.setString('user', user);
    // print(jsonDecode(response.body));
    return UserObject.fromJson(jsonDecode(response.body));
  }

  static Future<bool> isLogged() async {
    var token = await getToken();
    final response = await http.get(
        Uri.parse('https://shielded-lowlands-87962.herokuapp.com/api/user'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    final code = response.statusCode;
    if (code == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> login(String email, String password) async {
    final response = await http.post(
        Uri.parse('https://shielded-lowlands-87962.herokuapp.com/api/login'),
        body: ({
          'email': email,
          'password': password,
        }));
    final jsonRespon = jsonDecode(response.body);
    if (jsonRespon["status_code"] == 200) {
      /* ==== Lưu trữ token vào Storage ==== */
      await storage.write(
          key: "access_token", value: jsonRespon["access_token"]);
      /* ==== In ra token ==== */
      return true;
    } else {
      return false;
    }
  }

  static Future<dynamic> getToken() async {
    /* ==== Lấy token từ Storage ==== */
    var token = await storage.read(key: "access_token");
    return token;
  }

  /* ==== Start Register ==== */
  static Future<bool> register(
      String hoTen, String email, String password, String soDienThoai) async {
    final response = await http.post(
        Uri.parse('https://shielded-lowlands-87962.herokuapp.com/api/register'),
        body: jsonEncode({
          'idPhanQuyen': 1,
          'hoTen': hoTen,
          'email': email,
          'password': password,
          'soDienThoai': soDienThoai,
          'hinhAnh': 'abc.jpg',
          'trangThaiHoTen': 1,
          'trangThaiSDT': 1,
          'trangThaiEmail': 1,
          'trangThai': 1,
        }),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        });
    final jsonRespon = jsonDecode(response.body);

    if (jsonRespon["status_code"] == 200) {
      return true;
    } else {
      return false;
    }
  }

  /* ==== Start Register ==== */
  static Future<bool> updateInfor(
      String hoTen,
      String email,
      String soDienThoai,
      int trangThaiHoTen,
      int trangThaiSDT,
      int trangThaiEmail) async {
    var token = await getToken();
    final response = await http.post(
        Uri.parse(
            'https://shielded-lowlands-87962.herokuapp.com/api/user/update-infor'),
        body: jsonEncode({
          'hoTen': hoTen,
          'email': email,
          'soDienThoai': soDienThoai,
          'trangThaiHoTen': trangThaiHoTen,
          'trangThaiSDT': trangThaiSDT,
          'trangThaiEmail': trangThaiEmail,
        }),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    final jsonRespon = jsonDecode(response.body);
    if (jsonRespon["status_code"] == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> changePassword(
      String oldPass, String newPass, String confirm) async {
    var token = await getToken();
    final response = await http.post(
        Uri.parse(
            'https://shielded-lowlands-87962.herokuapp.com/api/user/change-password'),
        body: jsonEncode({
          'password': oldPass,
          'new_password': newPass,
          'confirm_password': confirm,
        }),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    final jsonRespon = jsonDecode(response.body);
    if (jsonRespon["status_code"] == 200) {
      return true;
    } else {
      return false;
    }
  }

  /* ==== Logout ==== */
  static Future<bool> logout() async {
    var token = await getToken();
    final response = await http.post(
        Uri.parse('https://shielded-lowlands-87962.herokuapp.com/api/logout'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    final jsonRespon = jsonDecode(response.body);
    if (jsonRespon['status_code'] == 200) {
      await storage.delete(key: "access_token");
      return true;
    } else {
      return false;
    }
  }

  /* ==== Upload Avatar ==== */
  static Future<bool> uploadImage(File _image) async {
    var token = await UserProvider.getToken();
    var stream = http.ByteStream(_image.openRead());
    stream.cast();
    var length = await _image.length();

    Map<String, String> headers = {"Authorization": "Bearer $token"};

    var uri = Uri.parse(
        "https://shielded-lowlands-87962.herokuapp.com/api/user/avatar");
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(headers);
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
