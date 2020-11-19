import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lassafeverdiagnosticsystem/repository/location_repository.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {

  LatLng latlng;


  MapScreen({this.latlng});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  Set<Marker> _markers = HashSet<Marker>();
  LatLng loc;
  GoogleMapController _mapController;
  LocationRepository _locationRepository = LocationRepository();

  bool _showMapStyle = false;






  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    //_toggleMapStyle();


  }

  void _toggleMapStyle() async {
    String style = await DefaultAssetBundle.of(context).loadString('json/map_style.json');

    if (_showMapStyle) {
      _mapController.setMapStyle(style);
    } else {
      _mapController.setMapStyle(null);
    }
  }





  void _onMapCreated(GoogleMapController controller) {

      setState(() {
        _mapController = controller;
      });




  }

  void _onTap (LatLng coordinate){
    _mapController.animateCamera(CameraUpdate.newLatLng(coordinate));
  }


  @override
  Widget build(BuildContext context) {
    CameraPosition _cameraPosition =  CameraPosition(
        target: widget.latlng,
        zoom: 13);

    return Scaffold(

      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _cameraPosition,
            mapType: MapType.normal ,
            onMapCreated: _onMapCreated,
            onTap: _onTap,
            myLocationEnabled: true,


          ),

          Align(
              alignment: Alignment.topLeft,
              child: Switch(value: _showMapStyle, onChanged: (value){
                setState(() {
                  _showMapStyle = value;

                });
                _toggleMapStyle();

              }))
        ],
      )

      ,
    );
  }
}
