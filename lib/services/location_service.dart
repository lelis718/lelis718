import 'package:handyclientapp/models/location_info.dart';
import 'package:handyclientapp/models/models.dart';
import 'package:location/location.dart';

abstract class LocationService {
  Future<LocationInfo> getCurrentLocation();
  Future<bool> isLocationAvailable();
  Future<bool> requestLocationAccess();
}

class LocationServiceDefault extends LocationService {
  @override
  Future<LocationInfo> getCurrentLocation() async {
    final loc = new Location();
    final currentLoc = await loc.getLocation();
    return LocationInfo(
        latitude: currentLoc.latitude, longitude: currentLoc.longitude);
  }

  Future<bool> isLocationAvailable() async {
    final loc = new Location();
    var perm = await loc.hasPermission();
    return perm == PermissionStatus.GRANTED;
  }

  Future<bool> requestLocationAccess() async {
    final loc = new Location();
    var perm = await loc.requestPermission();
    return perm == PermissionStatus.GRANTED;
  }
}
