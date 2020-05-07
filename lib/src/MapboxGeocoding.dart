import '../model/forward_geocoding.dart';
import '../model/reverse_geocoding.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapboxGeocoding{
  ///Returns forward geocoding model.
  /// 
  ///Mapbox access token [apiKey] required and [city] means typed keyword. 
  forwardModel(String city, String apiKey) async {
    if(city.isEmpty)
      return null;
    var url = 'https://api.mapbox.com/geocoding/v5/mapbox.places/$city.json?access_token=$apiKey';
    final response = await http.get(url);
    if (response.statusCode == 200)
      return ForwardGeocoding.fromJson(jsonDecode(response.body));
    else
      return null;
  }

  ///Returns reverse geocoding model.
  /// 
  ///Mapbox access token [apiKey], latitude [lat] and longitude [lng] required. 
  reverseModel(double lat, double lng, String apiKey) async {
    if(lng.isNaN || lat.isNaN)
      return null;
    var url = 'https://api.mapbox.com/geocoding/v5/mapbox.places/${lng.toString()},${lat.toString()}.json?access_token=$apiKey';
    final response = await http.get(url);
    if (response.statusCode == 200)
      return ReverseGeocoding.fromJson(jsonDecode(response.body));
    else
      return null;
  }
}