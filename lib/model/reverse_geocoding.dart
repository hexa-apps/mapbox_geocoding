///The reverse geocoding query type allows you to look up a single pair of coordinates and returns the geographic feature or features that exist at that location.
class ReverseGeocoding {
  ///```"FeatureCollection"```, a GeoJSON type from the [GeoJSON specification](https://tools.ietf.org/html/rfc7946).
  String type;

  ///An array containing the coordinates being queried.
  List<double> query;

  ///Returned features are ordered by index hierarchy, from most specific features to least specific features that overlap the queried coordinates.
  List<Features> features;

  ///A string that attributes the results of the Mapbox Geocoding API to Mapbox.
  String attribution;

  ReverseGeocoding({this.type, this.query, this.features, this.attribution});

  ReverseGeocoding.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    query = json['query'].cast<double>();
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features.add(Features.fromJson(v));
      });
    }
    attribution = json['attribution'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = this.type;
    data['query'] = this.query;
    if (this.features != null) {
      data['features'] = this.features.map((v) => v.toJson()).toList();
    }
    data['attribution'] = this.attribution;
    return data;
  }
}

class Features {
  ///A feature ID in the format ```{type}.{id}``` where ```{type}``` is the lowest hierarchy feature in the place_type field. The ```{id}``` suffix of the feature ID is unstable and may change within versions.
  String id;

  ///```"Feature"```, a GeoJSON type from the GeoJSON specification.
  String type;

  ///An array of feature types describing the feature. Options are ```country```, ```region```, ```postcode```, ```district```, ```place```, ```locality```, ```neighborhood```, ```address```, and ```poi```. Most features have only one type, but if the feature has multiple types, all applicable types will be listed in the array. (For example, Vatican City is a ```country```, ```region```, and ```place```.)
  List<String> placeType;

  ///Indicates how well the returned feature matches the user's query on a scale from 0 to 1. 0 means the result does not match the query text at all, while 1 means the result fully matches the query text. You can use the relevance property to remove results that don’t fully match the query. Learn more about textual relevance in the [Search result prioritization](https://docs.mapbox.com/help/how-mapbox-works/geocoding/#search-result-prioritization) guide.
  num relevance;

  ///An object describing the feature. The properties object may change with data improvements. Your implementation should check for the presence of these values in a response before it attempts to use them.
  Properties properties;

  ///A string representing the feature in the requested language, if specified.
  String text;

  ///A string representing the feature in the requested language, if specified, and its full result hierarchy.
  String placeName;

  ///The coordinates of the feature’s center in the form ```[longitude,latitude]```. This may be the literal centroid of the feature’s geometry, or the center of human activity within the feature (for example, the downtown area of a city).
  List<num> center;

  ///An object describing the spatial geometry of the returned feature.
  Geometry geometry;

  ///(Optional)A string of the house number for the returned address feature. Note that unlike the address property for poi features, this property is outside the properties object.
  String address;

  ///An array representing the hierarchy of encompassing parent features. Each parent feature may include any of the above properties.
  List<Context> context;

  ///A bounding box array in the form ```[minX,minY,maxX,maxY]```.
  List<num> bbox;

  Features(
      {this.id,
      this.type,
      this.placeType,
      this.relevance,
      this.properties,
      this.text,
      this.placeName,
      this.center,
      this.geometry,
      this.address,
      this.context,
      this.bbox});

  Features.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    placeType = json['place_type'].cast<String>();
    relevance = json['relevance'];
    properties = json['properties'] != null
        ? Properties.fromJson(json['properties'])
        : null;
    text = json['text'];
    placeName = json['place_name'];
    center = json['center'].cast<num>();
    geometry =
        json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    address = json['address'];
    if (json['context'] != null) {
      context = <Context>[];
      json['context'].forEach((v) {
        context.add(Context.fromJson(v));
      });
    }
    bbox = json['bbox'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['place_type'] = this.placeType;
    data['relevance'] = this.relevance;
    if (this.properties != null) {
      data['properties'] = this.properties.toJson();
    }
    data['text'] = this.text;
    data['place_name'] = this.placeName;
    data['center'] = this.center;
    if (this.geometry != null) {
      data['geometry'] = this.geometry.toJson();
    }
    data['address'] = this.address;
    if (this.context != null) {
      data['context'] = this.context.map((v) => v.toJson()).toList();
    }
    data['bbox'] = this.bbox;
    return data;
  }
}

class Properties {
  ///A point accuracy metric for the returned address feature. Can be one of rooftop, parcel, point, interpolated, intersection, street. Note that this list is subject to change.
  String accuracy;

  ///The [Wikidata](https://wikidata.org/) identifier for the returned feature.
  String wikidata;

  ///The [ISO 3166-1](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country and [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2) region code for the returned feature.
  String shortCode;

  Properties({this.accuracy, this.wikidata, this.shortCode});

  Properties.fromJson(Map<String, dynamic> json) {
    accuracy = json['accuracy'];
    wikidata = json['wikidata'];
    shortCode = json['short_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['accuracy'] = this.accuracy;
    data['wikidata'] = this.wikidata;
    data['short_code'] = this.shortCode;
    return data;
  }
}

class Geometry {
  ///"Point", a GeoJSON type from the [GeoJSON specification](https://tools.ietf.org/html/rfc7946).
  String type;

  ///An array in the format ```[longitude,latitude]``` at the center of the specified bbox.
  List<num> coordinates;

  Geometry({this.type, this.coordinates});

  Geometry.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<num>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class Context {
  String id;
  String text;

  ///The [ISO 3166-1](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country and [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2) region code for the returned feature.
  String wikidata;

  ///The [ISO 3166-1](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country and [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2) region code for the returned feature.
  String shortCode;

  Context({this.id, this.text, this.wikidata, this.shortCode});

  Context.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    wikidata = json['wikidata'];
    shortCode = json['short_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['wikidata'] = this.wikidata;
    data['short_code'] = this.shortCode;
    return data;
  }
}
