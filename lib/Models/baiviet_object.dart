import 'package:vietnam_travel_app/Models/diadanh_object.dart';
import 'package:vietnam_travel_app/Models/hinhanh_object.dart';
import 'package:vietnam_travel_app/Models/user_object.dart';

class BaiVietChiaSeObject {
  final int id;
  final int idDiaDanh;
  final String noiDung;
  final String thoiGian;
  final int trangThai;
  final DiaDanhObject diadanh;
  final HinhAnhObject hinhanh;
  final UserObject user;
  final int likes_count;
  final int unlikes_count;
  final int views_count;

  BaiVietChiaSeObject(
      this.id,
      this.idDiaDanh,
      this.noiDung,
      this.thoiGian,
      this.trangThai,
      this.diadanh,
      this.hinhanh,
      this.user,
      this.likes_count,
      this.unlikes_count,
      this.views_count);

  BaiVietChiaSeObject.fromJson(Map<String, dynamic> bv)
      : id = bv["id"],
        idDiaDanh = bv["idDiaDanh"],
        noiDung = bv["noiDung"],
        thoiGian = bv["thoiGian"],
        trangThai = bv["trangThai"],
        diadanh = DiaDanhObject.fromJson2(bv["diadanh"]),
        hinhanh = HinhAnhObject.fromJson(bv["hinhanh"]),
        user = UserObject.fromJson(bv["user"]),
        likes_count = bv["likes_count"],
        unlikes_count = bv["unlikes_count"],
        views_count = bv["views_count"];
}
