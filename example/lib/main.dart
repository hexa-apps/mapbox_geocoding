import 'package:flutter/material.dart';
import 'package:mapbox_geocoding/mapbox_geocoding.dart';
import 'package:mapbox_geocoding/model/forward_geocoding.dart';
import 'package:mapbox_geocoding/model/reverse_geocoding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MapboxGeocoding geocoding = MapboxGeocoding();
  String apiKey = 'YOUR_ACCESS_TOKEN';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              getCoordinates('Istanbul'),
            ),
            Text(
              getCity(41.0, 29.0, apiKey),
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    );
  }
}
