class HinhAnhObject {
  final int id;
  final int idDiaDanh;
  final String hinhAnh;
  final int idBaiVietChiaSe;
  final int idLoai;

  HinhAnhObject(
      this.id, this.idDiaDanh, this.hinhAnh, this.idBaiVietChiaSe, this.idLoai);

  HinhAnhObject.fromJson(Map<String, dynamic> ha)
      : id = ha["id"],
        idDiaDanh = ha["idDiaDanh"],
        hinhAnh = ha["hinhAnh"],
        idBaiVietChiaSe = ha["idBaiVietChiaSe"],
        idLoai = ha["idLoai"];
}
