class LuuTruObject {
  final int id;
  final int dia_danh_id;
  final String tenLuuTru;
  final String moTa;
  final String diaChi;
  final String sdt;
  final String thoiGianHoatDong;
  final String hinhAnh;

  LuuTruObject(this.id, this.dia_danh_id, this.tenLuuTru, this.moTa,
      this.diaChi, this.sdt, this.thoiGianHoatDong, this.hinhAnh);
  LuuTruObject.fromJson(Map<String, dynamic> lt)
      : id = lt["id"],
        dia_danh_id = lt["dia_danh_id"],
        tenLuuTru = lt["tenLuuTru"],
        moTa = lt["moTa"],
        diaChi = lt["diaChi"],
        sdt = lt["sdt"],
        thoiGianHoatDong = lt["thoiGianHoatDong"],
        hinhAnh = lt["hinhAnh"];
}
