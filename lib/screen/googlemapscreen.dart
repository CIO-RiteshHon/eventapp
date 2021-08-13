import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {

  Completer<GoogleMapController> _completer = Completer();
  static const LatLng _latLng = const LatLng(45.52156, -122.677433);
  final Set<Marker> _marker = {};
  LatLng _latLngMapPosition = _latLng;
  MapType _currentMapType = MapType.normal;

  _onMapCreated(GoogleMapController controller){
      _completer.complete(controller);
  }

  _onCameraMove(CameraPosition cameraPosition){
    _latLngMapPosition = cameraPosition.target;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Map"),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(target: _latLng,
              zoom: 11.0),
            mapType: _currentMapType,
            markers: _marker,
            onCameraMove: _onCameraMove,
          )
        ],
      ),
    );
  }
}
