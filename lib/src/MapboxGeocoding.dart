import '../model/forward_geocoding.dart';
import '../model/reverse_geocoding.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapboxGeocoding {
  String _apiKey;
  String urlBase = 'https://api.mapbox.com/geocoding/v5/mapbox.places/';

  MapboxGeocoding(this._apiKey);

  ///Returns forward geocoding model.
  ///
  ///Mapbox access token [apiKey] required and [city] means typed keyword.
  forwardModel(
    ///The feature you’re trying to look up. This could be an address, a point of interest name, a city name, etc. When searching for points of interest, it can also be a category name (for example, “coffee shop”). For information on categories, see the [Point of interest category coverage section](https://docs.mapbox.com/api/search/#point-of-interest-category-coverage). The search text should be expressed as a URL-encoded UTF-8 string, and must not contain the semicolon character (either raw or URL-encoded). Your search text, once decoded, must consist of at most 20 words and numbers separated by spacing and punctuation, and at most 256 characters.
    ///
    ///The accuracy of coordinates returned by a forward geocoding request can be impacted by how the addresses in the query are formatted. Learn more about address formatting best practices in the [Address geocoding format guide](https://docs.mapbox.com/help/troubleshooting/address-geocoding-format-guide/).
    String searchText, {

    ///Specify whether to return autocomplete results (true, default) or not (false). When autocomplete is enabled, results will be included that start with the requested string, rather than just responses that match it exactly. For example, a query for India might return both India and Indiana with autocomplete enabled, but only India if it’s disabled.
    ///
    ///When autocomplete is enabled, each user keystroke counts as one request to the Geocoding API. For example, a search for "coff" would be reflected as four separate Geocoding API requests. To reduce the total requests sent, you can configure your application to only call the Geocoding API after a specific number of characters are typed.
    bool autoComplete = true,

    ///Limit results to only those contained within the supplied bounding box. Bounding boxes should be supplied as four numbers separated by commas, in ```minLon,minLat,maxLon,maxLat``` order. The bounding box cannot cross the 180th meridian.
    List<double> bbox,

    ///Limit results to one country. Permitted values are [ISO 3166 alpha 2 country codes](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) separated by commas.
    String country = '',

    ///Specify the user’s language. This parameter controls the language of the text supplied in responses, and also affects result scoring, with results matching the user’s query in the requested language being preferred over results that match in another language. For example, an autocomplete query for things that start with Frank might return Frankfurt as the first result with an English (en) language parameter, but Frankreich (“France”) with a German (de) language parameter.
    ///
    ///Options are [IETF language tags](https://en.wikipedia.org/wiki/IETF_language_tag) comprised of a mandatory [ISO 639-1 language code](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) and, optionally, one or more IETF subtags for country or script.
    ///More than one value can also be specified, separated by commas, for applications that need to display labels in multiple languages.
    ///
    ///For more information on which specific languages are supported, see the [language coverage section](https://docs.mapbox.com/api/search/#language-coverage).
    String language = '',

    ///Specify the maximum number of results to return. The default is 5 and the maximum supported is 10.
    int limit = 5,

    ///Bias the response to favor results that are closer to this location, provided as two comma-separated coordinates in ```longitude,latitude``` order.
    List<double> proximity,

    ///Filter results to include only a subset (one or more) of the available feature types. Options are country, region, postcode, district, place, locality, neighborhood, address, and poi. Multiple options can be comma-separated. Note that poi.landmark is a deprecated type that, while still supported, returns the same data as is returned using the poi type.
    ///
    ///For more information on the available types, see [the data types section](https://docs.mapbox.com/api/search/#data-types).
    String types = '',
  }) async {
    if (searchText.isEmpty) return null;
    var url = urlBase + '$searchText.json?';
    if (!autoComplete) url += 'autocomplete=${autoComplete.toString()}&';
    if (bbox != null && bbox.length == 4) {
      url +=
          'bbox=${bbox[0].toString()},${bbox[1].toString()},${bbox[2].toString()},${bbox[3].toString()},&';
    }
    if (country.isNotEmpty) url += 'country=$country&';
    if (language.isNotEmpty) url += 'language=$language&';
    if (!limit.isNaN) if (limit > 10) limit = 10;
    url += 'limit=${limit.toString()}&';
    if (proximity != null && proximity.length == 2) {
      url += 'proximity=${proximity[0].toString()},${proximity[1].toString()}&';
    }
    if (types.isNotEmpty) url += 'types=$types&';
    url += 'access_token=$_apiKey';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return ForwardGeocoding.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  ///Returns reverse geocoding model.
  ///
  ///Mapbox access token [apiKey], latitude [lat] and longitude [lng] required.
  reverseModel(
    ///A latitude that specifies the location being queried.
    double lat,

    ///A longitude that specifies the location being queried.
    double lng, {

    ///Limit results to one country. Permitted values are [ISO 3166 alpha 2 country codes](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) separated by commas.
    String country = '',

    ///Specify the user’s language. This parameter controls the language of the text supplied in responses, and also affects result scoring, with results matching the user’s query in the requested language being preferred over results that match in another language. For example, an autocomplete query for things that start with Frank might return Frankfurt as the first result with an English (en) language parameter, but Frankreich (“France”) with a German (de) language parameter.
    ///
    ///Options are [IETF language tags](https://en.wikipedia.org/wiki/IETF_language_tag) comprised of a mandatory [ISO 639-1 language code](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) and, optionally, one or more IETF subtags for country or script.
    ///More than one value can also be specified, separated by commas, for applications that need to display labels in multiple languages.
    ///
    ///For more information on which specific languages are supported, see the [language coverage section](https://docs.mapbox.com/api/search/#language-coverage).
    String language = '',

    ///Specify the maximum number of results to return. The default is 5 and the maximum supported is 10.
    int limit = 5,

    ///Filter results to include only a subset (one or more) of the available feature types. Options are country, region, postcode, district, place, locality, neighborhood, address, and poi. Multiple options can be comma-separated. Note that poi.landmark is a deprecated type that, while still supported, returns the same data as is returned using the poi type.
    ///
    ///For more information on the available types, see [the data types section](https://docs.mapbox.com/api/search/#data-types).
    String types = '',
  }) async {
    if (lng.isNaN || lat.isNaN) return null;
    var url = urlBase + '${lng.toString()},${lat.toString()}.json?';
    if (country.isNotEmpty) url += 'country=$country&';
    if (language.isNotEmpty) url += 'language=$language&';
    if (!limit.isNaN) if (limit > 10) limit = 10;
    if (types.isNotEmpty) url += 'types=$types&limit=${limit.toString()}&';
    url += 'access_token=$_apiKey';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return ReverseGeocoding.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}
