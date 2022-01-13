import 'dart:ffi';

class MonAnObject {
  final int id;
  final int quan_an_id;
  final String tenMon;
  final String hinhAnh;

  MonAnObject(this.id, this.quan_an_id, this.tenMon, this.hinhAnh);

  MonAnObject.fromJson(Map<String, dynamic> mon)
      : id = mon["id"],
        quan_an_id = mon["quan_an_id"],
        tenMon = mon["tenMon"],
        hinhAnh = mon["hinhAnh"];
}
