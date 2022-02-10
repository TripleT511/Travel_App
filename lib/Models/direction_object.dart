class DistanceObject {
  String text;
  DistanceObject(this.text);
  DistanceObject.fromJson(Map<String, dynamic> ds) : text = ds['text'];
}

class DurationObject {
  String text;
  DurationObject(this.text);
  DurationObject.fromJson(Map<String, dynamic> dr) : text = dr['text'];
}

class PolylineObject {
  String points;
  PolylineObject(this.points);
  PolylineObject.fromJson(Map<String, dynamic> dp) : points = dp['points'];
}

class StepObject {
  DistanceObject distance;
  DurationObject duration;
  String instructions;
  PolylineObject polyline;
  StepObject(this.distance, this.duration, this.instructions, this.polyline);
  StepObject.fromJson(Map<String, dynamic> ds)
      : distance = DistanceObject.fromJson(ds['distance']),
        duration = DurationObject.fromJson(ds['duration']),
        instructions = ds['html_instructions'],
        polyline = PolylineObject.fromJson(ds['polyline']);
}

class LegsObject {
  DistanceObject distance;
  DurationObject duration;
  List<StepObject> steps;
  LegsObject.fromJson(Map<String, dynamic> ds)
      : distance = DistanceObject.fromJson(ds['distance']),
        duration = DurationObject.fromJson(ds['duration']),
        steps = (ds['steps'] as List<dynamic>)
            .map((step) => StepObject.fromJson(step))
            .toList();
}

class DirectionObject {
  LegsObject legs;
  PolylineObject overview_polyline;
  DirectionObject(this.legs, this.overview_polyline);
  DirectionObject.fromJson(Map<String, dynamic> ds)
      : legs = LegsObject.fromJson(ds['legs'][0]),
        overview_polyline = PolylineObject.fromJson(ds['overview_polyline']);
}
