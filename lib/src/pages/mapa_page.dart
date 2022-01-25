import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapaPage extends StatefulWidget {
  MapaPage({Key? key}) : super(key: key);

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markers = new Set<Marker>();
  Location location = new Location();
  late LatLng _latLng;

  @override
  void initState() {
    location.onLocationChanged.listen((LocationData currentLocation) {
      //Use current location
      _latLng = LatLng(currentLocation.latitude as double,
          currentLocation.longitude as double);
      print('${currentLocation.latitude} - ${currentLocation.longitude}');

      markers.add(new Marker(
          markerId: MarkerId('geo-location'),
          position: _latLng,
          infoWindow: InfoWindow(title: 'Aca es donde vive miguel')));
      _moverCamara();
      setState(() {});
    });

    // TODO: implement initState
    super.initState();
  }

  void _moverCamara() async {
    final GoogleMapController mapController = await _controller.future;
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            bearing: 0,
            tilt: 1.0,
            //target: LatLng(_locationData.latitude, _locationData.longitude),
            target: _latLng,
            //zoom: 17.5),
            zoom: 17.4),
      ),
    );
  }

  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(5.09488, -75.5917547),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    markers.add(new Marker(
        markerId: MarkerId('geo-location'),
        position: LatLng(5.09488, -75.5917547),
        infoWindow: InfoWindow(title: 'Aca es donde vive miguel')));

    return Scaffold(
      appBar: AppBar(
        title: Text("Google Maps"),
      ),
      body: GoogleMap(
        markers: markers,
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('Capturar ubicación'),
      //   icon: Icon(Icons.directions_boat),
      // ),
    );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
