class TinhThanhObject {
  final int id;
  final String tenTinhThanh;

  TinhThanhObject(this.id, this.tenTinhThanh);

  TinhThanhObject.fromJson(Map<String, dynamic> tt)
      : id = tt["id"],
        tenTinhThanh = tt["tenTinhThanh"];
}
