import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // querying to get user geolocation; works for iOS and Android devices
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void initState() {
    super.initState();
    getLocation();
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
