import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:local_auth/local_auth.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../generated/l10n.dart';
import 'app_info_constants.dart';
import 'models/location_info.dart';

class AppInfoManager {
  late final PackageInfo _packageInfo;
  late final DeviceInfoPlugin _deviceInfo;
  late final LocalAuthentication _localAuthentication;
  late final bool _biometricsAvailable;

  Future<void> initialise() async {
    _localAuthentication = LocalAuthentication();
    _packageInfo = await PackageInfo.fromPlatform();
    _deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      _iosDeviceInfo = await _deviceInfo.iosInfo;
    } else if (Platform.isAndroid) {
      _androidDeviceInfo = await _deviceInfo.androidInfo;
    }

    _biometricsAvailable = await _checkBiometricsAvailability();
  }

  String get packageName => _packageInfo.packageName;

  String get version => _packageInfo.version;

  bool get biometricsAvailable => _biometricsAvailable;

  IosDeviceInfo? _iosDeviceInfo;
  AndroidDeviceInfo? _androidDeviceInfo;

  int get androidSdkVersion =>
      int.tryParse(_androidDeviceInfo?.version.release ?? '0') ?? 0;

  String? get deviceId {
    if (Platform.isIOS) {
      return _iosDeviceInfo?.identifierForVendor;
    } else if (Platform.isAndroid) {
      return _androidDeviceInfo?.id;
    } else {
      return null;
    }
  }

  String get platform {
    if (Platform.isIOS) {
      return AppInfoConstants.iOS;
    } else if (Platform.isAndroid) {
      return AppInfoConstants.android;
    } else if (Platform.isMacOS) {
      return AppInfoConstants.macOS;
    }
    return AppInfoConstants.others;
  }

  Future<LocationInfo> getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition();
    return LocationInfo(lat: position.latitude, long: position.longitude);
  }

  // Calculate the distance in meters between the current position and the target position
  double distanceBetween({
    required double? startLatitude,
    required double? startLongitude,
    required double? endLatitude,
    required double? endLongitude,
  }) {
    // Return 0 if any of the coordinates are null
    if ([startLatitude, startLongitude, endLatitude, endLongitude]
        .contains(null)) {
      return 0;
    }

    // Calculate the distance if all values are non-null
    return Geolocator.distanceBetween(
      startLatitude!,
      startLongitude!,
      endLatitude!,
      endLongitude!,
    );
  }

  Future<bool> isLocationPermissionGranted() async {
    PermissionStatus status = await Permission.locationWhenInUse.status;
    if (status.isGranted) {
      return true;
    } else if (status.isDenied || status.isLimited || status.isRestricted) {
      PermissionStatus result = await Permission.locationWhenInUse.request();
      if (result.isGranted) {
        return true;
      }
    }
    return false;
  }

  Future<bool> isNotificationPermissionGranted() async {
    final allowNotification = await Permission.notification.status;
    return allowNotification == PermissionStatus.granted;
  }

  Future<bool> isCameraPermissionGranted() async {
    final allowCamera = await Permission.camera.status;
    return allowCamera != PermissionStatus.permanentlyDenied;
  }

  Future<bool> isGalleryPermissionGranted() async {
    final allowGallery = await Permission.photos.status;
    return allowGallery != PermissionStatus.permanentlyDenied;
  }

  Future<bool> navigateToDeviceSettings() => openAppSettings();

  Future<bool> authenticateUser() async {
    if (_biometricsAvailable) {
      try {
        final bool didAuthenticate = await _localAuthentication.authenticate(
            localizedReason: S.current.authenticateReason,
            options: const AuthenticationOptions(biometricOnly: true));
        return didAuthenticate;
      } on PlatformException catch (e) {
        log(e.toString());
      } on Exception catch (e) {
        log(e.toString());
      } on Error catch (e) {
        log(e.toString());
      }
    }
    return false;
  }

  Future<bool> _checkBiometricsAvailability() async {
    try {
      final biometricsAvailable =
          (await _localAuthentication.getAvailableBiometrics()).isNotEmpty;
      return biometricsAvailable;
    } on PlatformException catch (e) {
      log(e.toString());
    } on Exception catch (e) {
      log(e.toString());
    } on Error catch (e) {
      log(e.toString());
    }
    return false;
  }
}
