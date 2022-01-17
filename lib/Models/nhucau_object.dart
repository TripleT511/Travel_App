import 'package:vietnam_travel_app/Models/nhucaudiadanh_object.dart';

class NhuCauObject {
  final int id;
  final String? tenNhuCau;
  final List<NhuCauDiaDanhObject>? nhucaudiadanh;

  NhuCauObject(this.id, this.tenNhuCau, this.nhucaudiadanh);

  NhuCauObject.fromJson(Map<String, dynamic> nc)
      : id = nc["id"],
        tenNhuCau = nc["tenNhuCau"],
        nhucaudiadanh = null;
  NhuCauObject.fromJson2(Map<String, dynamic> nc)
      : id = nc["id"],
        tenNhuCau = nc["tenNhuCau"],
        nhucaudiadanh = nc["nhucaudiadanh"]
            .map<NhuCauDiaDanhObject>((e) => NhuCauDiaDanhObject.fromJson(e))
            .toList();
}
