import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

const apiKey = '349d9d1bab903d21a15fedf4ff8d2636';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  void initState() {
    super.initState();
    getLocationData();
  }

  // querying to get user geolocation; works for iOS and Android devices
  void getLocationData() async {
    Location location = Location();

    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    String myMargin = '50';
    double? myMarginAsADouble;

    try {
      myMarginAsADouble = double.parse(myMargin);
    } catch (e) {
      print(e);
    }
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(myMarginAsADouble ?? 30.0),
        color: Colors.green,
      ),
    );
  }
}
