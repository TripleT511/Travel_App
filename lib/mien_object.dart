class MienObject {
  final int idMien;
  final String tenMien;
  final int trangThai;

  MienObject(this.idMien, this.tenMien, this.trangThai);

  MienObject.fromJson(Map<String, dynamic> res)
      : idMien = res["idMien"],
        tenMien = res["tenMien"],
        trangThai = res["trangThai"];
}
