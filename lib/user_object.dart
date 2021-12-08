class UserObject {
  final int id;
  final int idPhanQuyen;
  final String hoTen;
  final String email;
  final String matKhau;
  final String soDienThoai;
  final int trangThaiTaiKhoan;
  final int trangThai;

  UserObject(this.id, this.idPhanQuyen, this.hoTen, this.email, this.matKhau,
      this.soDienThoai, this.trangThaiTaiKhoan, this.trangThai);

  UserObject.fromJson(Map<String, dynamic> res)
      : id = res["id"],
        idPhanQuyen = res["idPhanQuyen"],
        hoTen = res["hoTen"],
        email = res["email"],
        matKhau = res["matKhau"],
        soDienThoai = res["soDienThoai"],
        trangThaiTaiKhoan = res["trangThaiTaiKhoan"],
        trangThai = res["trangThai"];
}
