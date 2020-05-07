class ForwardGeocoding {
  String type;
  List<String> query;
  List<Features> features;
  String attribution;

  ForwardGeocoding({this.type, this.query, this.features, this.attribution});

  ForwardGeocoding.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    query = json['query'].cast<String>();
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
  List<num> bbox;
  List<num> center;
  Geometry geometry;
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
      placeType = new List<String>();
      json['place_type'].forEach((v) => placeType.add(v));
    }
    relevance = json['relevance'];
    properties = json['properties'] != null
        ? new Properties.fromJson(json['properties'])
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
      data['bbox'] = this.bbox.map((v)=> v).toList();
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
  String wikidata;
  bool landmark;
  String address;
  String category;
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
  String shortCode;
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