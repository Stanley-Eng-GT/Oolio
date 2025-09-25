import 'package:intl/intl.dart';

class DistanceFormatter {
  static String format(double distance) {
    if (distance < 1000) {
      return "${distance.toStringAsFixed(0)} m";
    } else {
      double distanceInKm = distance / 1000;
      return "${distanceInKm.toStringAsFixed(1)} km";
    }
  }

  static String formatKilometers(double kms) {
    // Use the NumberFormat class from the intl package
    final numberFormat = NumberFormat('#,##0');
    return numberFormat.format(kms);
  }
}
