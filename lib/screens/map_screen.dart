import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

LatLng SOURCE_LOCATION = LatLng(28.5355,77.3910);
const LatLng DESTINATION_LOCATION = LatLng(28.5355,77.3910);
const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;
// const double PIN_VISIBLE_POSITION = 20;
// const double PIN_INVISIBLE_POSITION = -220;
class MapScreen extends StatefulWidget {
  double lat;
  double lon;

  MapScreen({double lat, double lon}) {
    SOURCE_LOCATION = LatLng(lat,lon);
  }

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;
  Set<Marker> _markers = Set<Marker>();
  LatLng currentLocation;
  LatLng destinationLocation;

  @override
  void initState() {
    this.setInitialLocation();
    this.setSourceAndDestinationMarkerIcons();
    // TODO: implement initState
    super.initState();
  }

  void setSourceAndDestinationMarkerIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0),
        'assets/images/logo.png'
    );

    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0),
        'assets/images/logo.png'
    );
  }

  void setInitialLocation() {
    currentLocation = LatLng(
        SOURCE_LOCATION.latitude,
        SOURCE_LOCATION.longitude);

    destinationLocation = LatLng(
        SOURCE_LOCATION.latitude,
        SOURCE_LOCATION.longitude);
  }


  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
        zoom: CAMERA_ZOOM,
        tilt: CAMERA_TILT,
        bearing: CAMERA_BEARING,
        target: SOURCE_LOCATION
    );
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
            myLocationEnabled: true,
            compassEnabled: false,
            tiltGesturesEnabled: false,
            markers: _markers,
            mapType: MapType.normal,
            initialCameraPosition: initialCameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              showPinsOnMap();
            },
        ),
          ),
          Positioned(
            top: 60.0,
            child: Align(
            alignment: Alignment.topLeft,
            child: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(

                Icons.arrow_back_ios,
                size: 50.0,
                color: Colors.black,
              ),
            ),
          ),)
        ]
      ),
    );
  }

  void showPinsOnMap() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId('sourcePin'),
        position: currentLocation,
        icon: sourceIcon,
      ));

      _markers.add(Marker(
        markerId: MarkerId('destinationPin'),
        position: destinationLocation,
        icon: destinationIcon,
      ));
    });
  }
}
