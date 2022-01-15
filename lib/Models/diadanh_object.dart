import 'package:vietnam_travel_app/Models/tinhthanh_object.dart';
import 'package:vietnam_travel_app/Models/hinhanh_object.dart';

class DiaDanhObject {
  final int id;
  final String tenDiaDanh;
  final String moTa;
  final String kinhDo;
  final String viDo;
  final HinhAnhObject? hinhanh;
  final int tinh_thanh_id;
  final int trangThai;
  final TinhThanhObject? tinhthanh;
  final List<HinhAnhObject>? hinhanhs;

  DiaDanhObject(
      this.id,
      this.tenDiaDanh,
      this.moTa,
      this.kinhDo,
      this.viDo,
      this.tinh_thanh_id,
      this.trangThai,
      this.tinhthanh,
      this.hinhanh,
      this.hinhanhs);

  DiaDanhObject.fromJson(Map<String, dynamic> res)
      : id = res["id"],
        tenDiaDanh = res["tenDiaDanh"],
        moTa = res["moTa"],
        kinhDo = res["kinhDo"],
        viDo = res["viDo"],
        tinh_thanh_id = res["tinh_thanh_id"],
        trangThai = res["trangThai"],
        tinhthanh = TinhThanhObject.fromJson(res["tinhthanh"]),
        hinhanh = HinhAnhObject.fromJson(res["hinhanh"]),
        hinhanhs = null;
  DiaDanhObject.fromJson2(Map<String, dynamic> res)
      : id = res["id"],
        tenDiaDanh = res["tenDiaDanh"],
        moTa = res["moTa"],
        kinhDo = res["kinhDo"],
        viDo = res["viDo"],
        tinh_thanh_id = res["tinh_thanh_id"],
        trangThai = res["trangThai"],
        tinhthanh = null,
        hinhanh = null,
        hinhanhs = null;

  DiaDanhObject.fromJson3(Map<String, dynamic> res)
      : id = res["id"],
        tenDiaDanh = res["tenDiaDanh"],
        moTa = res["moTa"],
        kinhDo = res["kinhDo"],
        viDo = res["viDo"],
        tinh_thanh_id = res["tinh_thanh_id"],
        trangThai = res["trangThai"],
        tinhthanh = res["tinhThanh"],
        hinhanh = null,
        hinhanhs = res['hinhanhs'].forEach((v) {
          HinhAnhObject.fromJson(v);
        });
}
