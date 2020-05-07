class ReverseGeocoding {
  String type;
  List<double> query;
  List<Features> features;
  String attribution;

  ReverseGeocoding({this.type, this.query, this.features, this.attribution});

  ReverseGeocoding.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    query = json['query'].cast<double>();
    if (json['features'] != null) {
      features = new List<Features>();
      json['features'].forEach((v) {
        features.add(new Features.fromJson(v));
      });
    }
    attribution = json['attribution'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  String id;
  String type;
  List<String> placeType;
  num relevance;
  Properties properties;
  String text;
  String placeName;
  List<num> center;
  Geometry geometry;
  String address;
  List<Context> context;
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
        ? new Properties.fromJson(json['properties'])
        : null;
    text = json['text'];
    placeName = json['place_name'];
    center = json['center'].cast<num>();
    geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
    address = json['address'];
    if (json['context'] != null) {
      context = new List<Context>();
      json['context'].forEach((v) {
        context.add(new Context.fromJson(v));
      });
    }
    bbox = json['bbox'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  String accuracy;
  String wikidata;
  String shortCode;

  Properties({this.accuracy, this.wikidata, this.shortCode});

  Properties.fromJson(Map<String, dynamic> json) {
    accuracy = json['accuracy'];
    wikidata = json['wikidata'];
    shortCode = json['short_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accuracy'] = this.accuracy;
    data['wikidata'] = this.wikidata;
    data['short_code'] = this.shortCode;
    return data;
  }
}

class Geometry {
  String type;
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
  String text;
  String wikidata;
  String shortCode;

  Context({this.id, this.text, this.wikidata, this.shortCode});

  Context.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    wikidata = json['wikidata'];
    shortCode = json['short_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['wikidata'] = this.wikidata;
    data['short_code'] = this.shortCode;
    return data;
  }
}