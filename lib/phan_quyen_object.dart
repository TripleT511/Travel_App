class PhanQuyenObject {
  final int id;
  final String tenQuyen;
  final int trangThai;

  PhanQuyenObject(this.id, this.tenQuyen, this.trangThai);

  PhanQuyenObject.fromJson(Map<String, dynamic> res)
      : id = res["id"],
        tenQuyen = res["tenQuyen"],
        trangThai = res["trangThai"];
}
