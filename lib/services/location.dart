import 'package:geolocator/geolocator.dart';

class Location {
  double latitude =0;
  double longitude =0;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium);
      latitude = position.latitude;
      longitude = position.longitude;
      print('Latitude: $latitude, Longitude: $longitude');
    } catch (e) {
      print('Failed to get location: $e');
    }
  }
}
