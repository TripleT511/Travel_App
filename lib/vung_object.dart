class VungObject {
  final int idVung;
  final String tenVung;
  final int trangThai;

  VungObject(this.idVung, this.tenVung, this.trangThai);

  VungObject.fromJson(Map<String, dynamic> res)
      : idVung = res["idVung"],
        tenVung = res["tenVung"],
        trangThai = res["trangThai"];
}
