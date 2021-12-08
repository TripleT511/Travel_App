class LuuTruObject {
  final int id;
  final int idVung;
  final int idMien;
  final String tenLuuTru;
  final String moTa;
  final String diaChi;
  final String soDienThoai;
  final double gia;
  final DateTime thoiGianMoCua;
  final String hinhAnh;
  final int trangThai;

  LuuTruObject(
      this.id,
      this.idVung,
      this.idMien,
      this.tenLuuTru,
      this.moTa,
      this.diaChi,
      this.soDienThoai,
      this.gia,
      this.thoiGianMoCua,
      this.hinhAnh,
      this.trangThai);

  LuuTruObject.fromJson(Map<String, dynamic> res)
      : id = res["id"],
        idVung = res["idVung"],
        idMien = res["idMien"],
        tenLuuTru = res["tenLuuTru"],
        moTa = res["moTa"],
        diaChi = res["diaChi"],
        soDienThoai = res["soDienThoai"],
        gia = res["gia"],
        thoiGianMoCua = res["thoiGianMoCua"],
        hinhAnh = res["hinhAnh"],
        trangThai = res["trangThai"];
}
