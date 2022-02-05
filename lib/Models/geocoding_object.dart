import 'package:vietnam_travel_app/Models/address_object.dart';

class ReverseGeoObject {
  final List<AddressComponent>? address_components;
  final String formatted_address;
  final GeometryObject geometry;

  ReverseGeoObject(
      this.address_components, this.formatted_address, this.geometry);

  ReverseGeoObject.fromJson(Map<String, dynamic> pd)
      : address_components = pd["address_components"]
            .map<AddressComponent>((e) => AddressComponent.fromJson(e))
            .toList(),
        formatted_address = pd["formatted_address"],
        geometry = GeometryObject.fromJson(pd["geometry"]);
}

class AddressComponent {
  final String long_name;
  final String short_name;

  AddressComponent(this.long_name, this.short_name);

  AddressComponent.fromJson(Map<String, dynamic> ac)
      : long_name = ac["long_name"],
        short_name = ac["short_name"];
}
