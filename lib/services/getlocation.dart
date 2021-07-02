import 'package:geolocator/geolocator.dart';

class Location{
  double lat, longi;

Future<void> getCurrentLocation() async {
  // LocationPermission permission = await Geolocator.requestPermission();
  // print(permission);
  try {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    lat = position.latitude;
    longi = position.longitude;
  }
  catch (e) {
    print(e);
  }
}
}