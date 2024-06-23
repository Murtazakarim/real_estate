import 'package:location/location.dart';

class LocationService {
  Location location = Location();

  Future<LocationData?> getCurrentLocation() async {
    // Check if location services are enabled
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    // Check if location permissions are granted
    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    // Get the current location
    LocationData locationData = await location.getLocation();
    return locationData;
  }
}
