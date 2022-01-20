import 'package:vietnam_travel_app/Models/diadanh_object.dart';
import 'package:vietnam_travel_app/Models/nhucau_object.dart';

class NhuCauDiaDanhObject {
  final int id;
  final int idDiaDanh;
  final int idNhuCau;
  final NhuCauObject? nhucau;
  final DiaDanhObject? diadanh;

  NhuCauDiaDanhObject(
      this.id, this.idDiaDanh, this.idNhuCau, this.nhucau, this.diadanh);

  NhuCauDiaDanhObject.fromJson(Map<String, dynamic> nc)
      : id = nc["id"],
        idDiaDanh = nc["idDiaDanh"],
        idNhuCau = nc["idNhuCau"],
        nhucau = NhuCauObject.fromJson(nc["nhucau"]),
        diadanh = null;

  NhuCauDiaDanhObject.fromJson2(Map<String, dynamic> nc)
      : id = nc["id"],
        idDiaDanh = nc["idDiaDanh"],
        idNhuCau = nc["idNhuCau"],
        nhucau = null,
        diadanh = DiaDanhObject.fromJson(nc['diadanh']);
}
