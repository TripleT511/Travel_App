import 'package:vietnam_travel_app/Models/nhucau_object.dart';
import 'package:vietnam_travel_app/Models/nhucaudiadanh_object.dart';
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
  final TinhThanhObject? tinhthanh;
  final List<HinhAnhObject>? hinhanhs;
  final int? shares_count;
  final List<NhuCauDiaDanhObject>? nhucaudiadanhs;

  DiaDanhObject(
      this.id,
      this.tenDiaDanh,
      this.moTa,
      this.kinhDo,
      this.viDo,
      this.tinh_thanh_id,
      this.tinhthanh,
      this.hinhanh,
      this.hinhanhs,
      this.shares_count,
      this.nhucaudiadanhs);

  DiaDanhObject.fromJson(Map<String, dynamic> res)
      : id = res["id"],
        tenDiaDanh = res["tenDiaDanh"],
        moTa = res["moTa"],
        kinhDo = res["kinhDo"],
        viDo = res["viDo"],
        tinh_thanh_id = res["tinh_thanh_id"],
        tinhthanh = TinhThanhObject.fromJson(res["tinhthanh"]),
        hinhanh = HinhAnhObject.fromJson(res["hinhanh"]),
        hinhanhs = null,
        shares_count = null,
        nhucaudiadanhs = null;
  DiaDanhObject.fromJson2(Map<String, dynamic> res)
      : id = res["id"],
        tenDiaDanh = res["tenDiaDanh"],
        moTa = res["moTa"],
        kinhDo = res["kinhDo"],
        viDo = res["viDo"],
        tinh_thanh_id = res["tinh_thanh_id"],
        tinhthanh = null,
        hinhanh = null,
        hinhanhs = null,
        shares_count = null,
        nhucaudiadanhs = null;

  DiaDanhObject.fromJson3(Map<String, dynamic> res)
      : id = res["id"],
        tenDiaDanh = res["tenDiaDanh"],
        moTa = res["moTa"],
        kinhDo = res["kinhDo"],
        viDo = res["viDo"],
        tinh_thanh_id = res["tinh_thanh_id"],
        tinhthanh = TinhThanhObject.fromJson(res["tinhthanh"]),
        hinhanh = null,
        hinhanhs = res["hinhanhs"]
            .map<HinhAnhObject>((e) => HinhAnhObject.fromJson(e))
            .toList(),
        shares_count = res["shares_count"],
        nhucaudiadanhs = res["nhucaudiadanhs"]
            .map<NhuCauDiaDanhObject>((e) => NhuCauDiaDanhObject.fromJson(e))
            .toList();
}
