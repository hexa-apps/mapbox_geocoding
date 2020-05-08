///The forward geocoding query type allows you to look up a single location by name and returns its geographic coordinates.
class ForwardGeocoding {
  ///```"FeatureCollection"```, a GeoJSON type from the [GeoJSON specification](https://tools.ietf.org/html/rfc7946).
  String type;

  ///An array of space and punctuation-separated strings from the original query.
  List<String> query;

  ///Returned features are ordered by ```relevance```.
  List<Features> features;

  ///A string that attributes the results of the Mapbox Geocoding API to Mapbox.
  String attribution;

  ForwardGeocoding({this.type, this.query, this.features, this.attribution});

  ForwardGeocoding.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    query = json['query'].cast<String>();
    if (json['features'] != null) {
      features = List<Features>();
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

  ///A string representing the feature in the requested language, if specified.
  Properties properties;

  ///A string representing the feature in the requested language, if specified, and its full result hierarchy.
  String text;

  ///The coordinates of the feature’s center in the form ```[longitude,latitude]```. This may be the literal centroid of the feature’s geometry, or the center of human activity within the feature (for example, the downtown area of a city).
  String placeName;

  ///A bounding box array in the form ```[minX,minY,maxX,maxY]```.
  List<num> bbox;

  ///An object describing the spatial geometry of the returned feature.
  List<num> center;

  ///(Optional)A string of the house number for the returned address feature. Note that unlike the address property for poi features, this property is outside the properties object.
  Geometry geometry;

  ///A bounding box array in the form ```[minX,minY,maxX,maxY]```.
  List<Context> context;

  Features(
      {this.id,
      this.type,
      this.placeType,
      this.relevance,
      this.properties,
      this.text,
      this.placeName,
      this.bbox,
      this.center,
      this.geometry,
      this.context});

  Features.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    if (json['place_type'] != null) {
      placeType = List<String>();
      json['place_type'].forEach((v) => placeType.add(v));
    }
    relevance = json['relevance'];
    properties = json['properties'] != null
        ? Properties.fromJson(json['properties'])
        : null;
    text = json['text'];
    placeName = json['place_name'];
    if (json['bbox'] != null) {
      bbox = new List<num>();
      json['bbox'].forEach((v) {
        bbox.add(v);
      });
    }
    center = json['center'].cast<num>();
    geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
    if (json['context'] != null) {
      context = new List<Context>();
      json['context'].forEach((v) {
        context.add(new Context.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    if (this.placeType != null) {
      data['place_type'] = this.placeType.map((v) => v).toList();
    }
    data['relevance'] = this.relevance;
    if (this.properties != null) {
      data['properties'] = this.properties.toJson();
    }
    data['text'] = this.text;
    data['place_name'] = this.placeName;
    if (this.bbox != null) {
      data['bbox'] = this.bbox.map((v) => v).toList();
    }
    data['center'] = this.center;
    if (this.geometry != null) {
      data['geometry'] = this.geometry.toJson();
    }
    if (this.context != null) {
      data['context'] = this.context.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Properties {
  ///The [ISO 3166-1](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country and [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2) region code for the returned feature.
  String wikidata;

  ///Describes whether or not the feature is in the poi.landmark data type. This data type is deprecated, and this property will be present on all poi features for backwards compatibility reasons but will always be true.
  bool landmark;

  ///A string of the full street address for the returned poi feature. Note that unlike the address property for address features, this property is inside the properties object.
  String address;

  ///A string of comma-separated categories for the returned poi feature.
  String category;

  ///The name of a suggested [Maki](https://www.mapbox.com/maki-icons/) icon to visualize a poi feature based on its category
  String maki;

  Properties(
      {this.wikidata, this.landmark, this.address, this.category, this.maki});

  Properties.fromJson(Map<String, dynamic> json) {
    wikidata = json['wikidata'];
    landmark = json['landmark'];
    address = json['address'];
    category = json['category'];
    maki = json['maki'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wikidata'] = this.wikidata;
    data['landmark'] = this.landmark;
    data['address'] = this.address;
    data['category'] = this.category;
    data['maki'] = this.maki;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class Context {
  String id;

  ///The [ISO 3166-1](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country and [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2) region code for the returned feature.
  String shortCode;

  ///The [ISO 3166-1](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country and [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2) region code for the returned feature.
  String wikidata;
  String text;

  Context({this.id, this.shortCode, this.wikidata, this.text});

  Context.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? json['id'] : '';
    shortCode = json['short_code'] != null ? json['short_code'] : '';
    wikidata = json['wikidata'] != null ? json['wikidata'] : '';
    text = json['text'] != null ? json['text'] : '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.shortCode != null) {
      data['short_code'] = this.shortCode;
    }
    if (this.wikidata != null) {
      data['wikidata'] = this.wikidata;
    }
    if (this.text != null) {
      data['text'] = this.text;
    }
    return data;
  }
}
