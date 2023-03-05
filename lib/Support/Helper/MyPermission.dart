import 'package:my_football_manager/Support/Export/MyExport.dart';

class MyPermission {
  final Permission _storage = Permission.storage;
  final Permission _location = Permission.locationWhenInUse;

  static final MyPermission _inst = MyPermission._internal();
  factory MyPermission() {
    return _inst;
  }
  MyPermission._internal();

  void initPermissions() {
    requestPermission(_storage);

    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    final serviceStatus = await Permission.locationWhenInUse.serviceStatus;
    final isGpsOn = serviceStatus == ServiceStatus.enabled;
    if (!isGpsOn) {
      print('Turn on location services before requesting permission.');
      return;
    }

    final status = await _location.request();
    if (status == PermissionStatus.granted) {
      print('Permission granted');
    } else if (status == PermissionStatus.denied) {
      print(
          'Permission denied. Show a dialog and again ask for the permission');
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Take the user to the settings page.');
      await openAppSettings();
    }
  }

//permission methods:---------------------------------------------------------
  Future<void> requestPermission(Permission permission) => permission.request();
}
