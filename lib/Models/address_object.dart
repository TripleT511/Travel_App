class AddressObject {
  final String description;
  final String place_id;
  final StructuredDormatting structured_formatting;
  final CompoundObject compound;

  AddressObject(this.description, this.place_id, this.structured_formatting,
      this.compound);

  AddressObject.fromJson(Map<String, dynamic> ad)
      : description = ad["description"],
        place_id = ad["place_id"],
        structured_formatting =
            StructuredDormatting.fromJson(ad["structured_formatting"]),
        compound = CompoundObject.fromJson(ad["compound"]);
}

class PlaceDetailObject {
  final String place_id;
  final String formatted_address;
  final GeometryObject geometry;
  final String name;

  PlaceDetailObject(
      this.place_id, this.formatted_address, this.geometry, this.name);

  PlaceDetailObject.fromJson(Map<String, dynamic> pd)
      : place_id = pd["place_id"],
        formatted_address = pd["formatted_address"],
        geometry = GeometryObject.fromJson(pd["geometry"]),
        name = pd["name"];
}

class CompoundObject {
  final String district;
  final String commune;
  final String province;

  CompoundObject(this.district, this.commune, this.province);

  CompoundObject.fromJson(Map<String, dynamic> cp)
      : district = cp["district"],
        commune = cp["commune"],
        province = cp["province"];
}

class StructuredDormatting {
  final String main_text;
  final String secondary_text;

  StructuredDormatting(this.main_text, this.secondary_text);

  StructuredDormatting.fromJson(Map<String, dynamic> st)
      : main_text = st["main_text"],
        secondary_text = st["secondary_text"];
}

class GeometryObject {
  final LocationObject location;

  GeometryObject(this.location);

  GeometryObject.fromJson(Map<String, dynamic> ge)
      : location = LocationObject.fromJson(ge["location"]);
}

class LocationObject {
  final double lat;
  final double lng;

  LocationObject(this.lat, this.lng);

  LocationObject.fromJson(Map<String, dynamic> lc)
      : lat = lc["lat"],
        lng = lc["lng"];
}
