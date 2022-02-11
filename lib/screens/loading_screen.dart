import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // querying to get user geolocation; works for iOS and Android devices
  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        // more accuracy translates to more battery being used on users device
        desiredAccuracy: LocationAccuracy.low);
    // TODO: Delete print() before production build
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
            getLocation();
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
