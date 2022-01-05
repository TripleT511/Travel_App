class NhuCauObject {
  final int id;
  final String tenNhuCau;

  NhuCauObject(this.id, this.tenNhuCau);

  NhuCauObject.fromJson(Map<String, dynamic> nc)
      : id = nc["id"],
        tenNhuCau = nc["tenNhuCau"];
}
