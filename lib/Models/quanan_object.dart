import 'package:vietnam_travel_app/Models/monan_object.dart';

class QuanAnObject {
  final int id;
  final int dia_danh_id;
  final String tenQuan;
  final String moTa;
  final String diaChi;
  final String sdt;
  final String? thoiGianHoatDong;
  final String hinhAnh;
  final MonAnObject? monan;

  QuanAnObject(this.id, this.dia_danh_id, this.tenQuan, this.moTa, this.diaChi,
      this.sdt, this.thoiGianHoatDong, this.hinhAnh, this.monan);
  QuanAnObject.fromJson(Map<String, dynamic> quan)
      : id = quan["id"],
        dia_danh_id = quan["dia_danh_id"],
        tenQuan = quan["tenQuan"],
        moTa = quan["moTa"],
        diaChi = quan["diaChi"],
        sdt = quan["sdt"],
        thoiGianHoatDong = quan["thoiGianHoatDong"],
        hinhAnh = quan["hinhAnh"],
        monan =
            quan["monan"] == null ? null : MonAnObject.fromJson(quan["monan"]);
  QuanAnObject.fromJson2(Map<String, dynamic> quan)
      : id = quan["id"],
        dia_danh_id = quan["dia_danh_id"],
        tenQuan = quan["tenQuan"],
        moTa = quan["moTa"],
        diaChi = quan["diaChi"],
        sdt = quan["sdt"],
        thoiGianHoatDong = quan["thoiGianHoatDong"] ?? "",
        hinhAnh = quan["hinhAnh"],
        monan = null;
}
