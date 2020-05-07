Dart Mapbox Geocoding API (not official)
================

A Flutter package Mapbox Geocoding API. Package is not official product of mapbox.

This project is a library to use [Mapbox Geocoding API](https://docs.mapbox.com/api/search/#geocoding) from `dart` scripts.

## Usage ##

To use this library in your code:

* add a dependency in your `pubspec.yaml` :

  ```yaml
  dependencies:
    mapbox_geocoding: "^last_version"
  ```

* add import in your `dart` code:

  ```dart
  import 'package:mapbox_geocoding/mapbox_geocoding.dart';
  ```

Please create/use [Mapbox](https://mapbox.com) account to obtain Mapbox access token.
If you have Mapbox account, you can reach access token from [Mapbox account dashboard](https://account.mapbox.com).

A very [simple example](https://github.com/berkayoruc/mapbox_geocoding/blob/master/example/lib/main.dart) :

```dart
import 'package:mapbox_geocoding/mapbox_geocoding.dart';
import 'package:mapbox_geocoding/model/forward_geocoding.dart';

///Forward geocoding. Get latitude and longitude from place name.
getCoordinates(String city) async {
    try {
        ForwardGeocoding forwardModel = await geocoding.forwardModel(city, apiKey);
        return forwardModel.features[0].center;
    } catch (Excepetion) {
        return 'Forward Geocoding Error';
    }
}
///Reverse geocoding. Get place name from latitude and longitude.
getCity(double lat, double lng, String apiKey) async {
    try {
        ReverseGeocoding reverseModel = await geocoding.reverseModel(lat, lng, apiKey);
        return reverseModel.features[0].placeName;
    } catch (Excepetion) {
        return 'Reverse Geocoding Error';
    }
}
```


