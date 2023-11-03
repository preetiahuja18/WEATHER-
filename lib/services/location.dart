import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Location{
  late double latitude;
  late double longitude;

    Future<void> getCurrentLocation() async{
    final status = await Permission.location.request();
    
    if (status.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
    latitude=position.latitude;
    longitude=position.longitude;
    } else {
      print("Location permission denied by the user");
    
    }
  }
}

