class UserObject {
  final int id;
  final int idPhanQuyen;
  final String hoTen;
  final String email;
  final String? password;
  final String soDienThoai;
  final String hinhAnh;
  final int trangThaiHoTen;
  final int trangThaiEmail;
  final int trangThaiSDT;
  final int? baiviets_count;
  final int? tinhthanhs_count;

  UserObject(
      this.id,
      this.idPhanQuyen,
      this.hoTen,
      this.email,
      this.password,
      this.soDienThoai,
      this.hinhAnh,
      this.trangThaiHoTen,
      this.trangThaiEmail,
      this.trangThaiSDT,
      this.baiviets_count,
      this.tinhthanhs_count);

  UserObject.fromJson(Map<String, dynamic> us)
      : id = us["id"],
        idPhanQuyen = us["idPhanQuyen"],
        hoTen = us["hoTen"],
        email = us["email"],
        password = "",
        soDienThoai = us["soDienThoai"],
        hinhAnh = us["hinhAnh"],
        trangThaiHoTen = us["trangThaiHoTen"],
        trangThaiEmail = us["trangThaiEmail"],
        trangThaiSDT = us["trangThaiSDT"],
        baiviets_count = us["baiviets_count"],
        tinhthanhs_count = us["tinhthanhs_count"];
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "idPhanQuyen": idPhanQuyen,
      "hoTen": hoTen,
      "email": email,
      "soDienThoai": soDienThoai,
      "hinhAnh": hinhAnh,
      "trangThaiHoTen": trangThaiHoTen,
      "trangThaiEmail": trangThaiEmail,
      "trangThaiSDT": trangThaiSDT,
      "baiviets_count": baiviets_count,
      "tinhthanhs_count": tinhthanhs_count,
    };
  }
}
