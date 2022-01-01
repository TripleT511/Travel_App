class UserObject {
  final int id;
  final int idPhanQuyen;
  final String hoTen;
  final String email;
  final String password;
  final String soDienThoai;
  final int trangThaiHoTen;
  final int trangThaiEmail;
  final int trangThaiSDT;
  final int trangThai;

  UserObject(
      this.id,
      this.idPhanQuyen,
      this.hoTen,
      this.email,
      this.password,
      this.soDienThoai,
      this.trangThaiHoTen,
      this.trangThaiEmail,
      this.trangThaiSDT,
      this.trangThai);

  UserObject.fromJson(Map<String, dynamic> us)
      : id = us["id"],
        idPhanQuyen = us["idPhanQuyen"],
        hoTen = us["hoTen"],
        email = us["email"],
        password = us["password"],
        soDienThoai = us["soDienThoai"],
        trangThaiHoTen = us["trangThaiHoTen"],
        trangThaiEmail = us["trangThaiEmail"],
        trangThaiSDT = us["trangThaiSDT"],
        trangThai = us["trangThai"];

  UserObject.fromJson2(Map<String, dynamic> us)
      : id = us["id"],
        idPhanQuyen = us["idPhanQuyen"],
        hoTen = us["hoTen"],
        email = us["email"],
        password = "",
        soDienThoai = us["soDienThoai"],
        trangThaiHoTen = us["trangThaiHoTen"],
        trangThaiEmail = us["trangThaiEmail"],
        trangThaiSDT = us["trangThaiSDT"],
        trangThai = us["trangThai"];
}
