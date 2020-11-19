
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

class LocationRepository{

  final kGoogleApiKey = "TOUR_API_KEY";
  //GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;





  Future<LatLng> getUserLocation() async {

    Location location = new Location();

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }


    try {
      _locationData = await location.getLocation();

      final lat = _locationData.latitude;
      final lng = _locationData.longitude;
      final center = LatLng(lat, lng);
      return center;
    } on Exception {
      _locationData = null;
      return null;
    }
  }
}