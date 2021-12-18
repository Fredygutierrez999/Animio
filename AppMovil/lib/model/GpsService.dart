import 'package:geolocator/geolocator.dart';

abstract class LocationInterface {
  Future<void> getCurrentLocation();
}

class GpsService implements LocationInterface {
  @override
  Future<Position> getCurrentLocation() async {
    // Usando el paquete Geolocator obtenga la posicion actual
    return await Geolocator.getCurrentPosition();
  }
}
