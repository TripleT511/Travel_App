import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vietnam_travel_app/Models/user_object.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

class UserProvider {
  static List<UserObject> parseUsers(String reponseBody) {
    final pased = jsonDecode(reponseBody).cast<Map<String, dynamic>>();
    return pased.map<UserObject>((e) => UserObject.fromJson2(e)).toList();
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

    // print(jsonDecode(response.body));
    return UserObject.fromJson2(jsonDecode(response.body));
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
      print(jsonRespon["access_token"]);
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
  /* ==== End Register ==== */

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
    print(jsonRespon);
    if (jsonRespon["status_code"] == 200) {
      return true;
    } else {
      return false;
    }
  }

  /* ==== Start Logout ==== */
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
  /* ==== End Logout ==== */

}
