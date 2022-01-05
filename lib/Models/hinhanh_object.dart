class HinhAnhObject {
  final int id;
  final String hinhAnh;
  final int idBaiVietChiaSe;
  final int idLoai;

  HinhAnhObject(this.id, this.hinhAnh, this.idBaiVietChiaSe, this.idLoai);

  HinhAnhObject.fromJson(Map<String, dynamic> ha)
      : id = ha["id"],
        hinhAnh = ha["hinhAnh"],
        idBaiVietChiaSe = ha["idBaiVietChiaSe"],
        idLoai = ha["idLoai"];
}
