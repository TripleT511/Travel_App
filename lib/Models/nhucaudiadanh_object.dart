import 'package:vietnam_travel_app/Models/nhucau_object.dart';

class NhuCauDiaDanhObject {
  final int id;
  final int idDiaDanh;
  final int idNhuCau;
  final NhuCauObject? nhucau;

  NhuCauDiaDanhObject(this.id, this.idDiaDanh, this.idNhuCau, this.nhucau);

  NhuCauDiaDanhObject.fromJson(Map<String, dynamic> nc)
      : id = nc["id"],
        idDiaDanh = nc["idDiaDanh"],
        idNhuCau = nc["idNhuCau"],
        nhucau = NhuCauObject.fromJson(nc["nhucau"]);
}
