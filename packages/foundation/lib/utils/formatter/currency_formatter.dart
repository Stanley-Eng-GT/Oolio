import 'package:intl/intl.dart';

class _CurrencyFormatterConstants {
  static const String locale = 'en_AU';
  static const String pattern = '#,##0.00';
}

class CurrencyFormatter {
  static String getAmountString(double amount) {
    final formatter = NumberFormat(_CurrencyFormatterConstants.pattern,
        _CurrencyFormatterConstants.locale);

    // Format the amount without the dollar sign
    String formattedAmount = formatter.format(amount.abs());

    // Determine the sign of the amount
    if (amount < 0) {
      return '-\$$formattedAmount'; // Negative amount
    } else {
      return '\$$formattedAmount'; // Positive amount
    }
  }
}
