import 'dart:developer';

import 'package:intl/intl.dart';

import '../../generated/l10n.dart';

class DateHelper {
  // Parses a string to another string
  static String? convert({
    required String dateString,
    required String fromPattern,
    required String toPattern,
  }) {
    try {
      return format(parse(dateString, fromPattern), toPattern);
    } on Exception catch (e) {
      log(e.toString());
      return null;
    } on Error catch (e) {
      log(e.toString());
      return null;
    }
  }

  // Formats a DateTime to a string with the given pattern
  static String format(DateTime date, String pattern) {
    return DateFormat(pattern).format(date);
  }

  // Parses a string to a DateTime with the given pattern
  static DateTime parse(String dateString, String pattern) {
    return DateFormat(pattern).parse(dateString);
  }

  static DateTime? tryParse(String dateString, String pattern) {
    return DateFormat(pattern).tryParse(dateString);
  }

  // Returns a "time ago" formatted string
  static String timeAgo({
    required DateTime date,
    bool showTodayDetails = false,
    bool useRelativeTime = false,
  }) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(date);

    // Function to check if two dates are the same calendar day
    bool isSameDay(DateTime a, DateTime b) {
      return a.year == b.year && a.month == b.month && a.day == b.day;
    }

    // Function to check if the date is yesterday
    bool isYesterday(DateTime a) {
      DateTime yesterday = now.subtract(const Duration(days: 1));
      return a.year == yesterday.year &&
          a.month == yesterday.month &&
          a.day == yesterday.day;
    }

    // Helper function to calculate the exact number of years between two dates
    int calculateYearsDifference(DateTime from, DateTime to) {
      int years = to.year - from.year;
      if (to.month < from.month ||
          (to.month == from.month && to.day < from.day)) {
        years--; // Adjust if the full year hasn't passed
      }
      return years;
    }

    // Relative time format - handle cases for weeks, months, and years
    if (useRelativeTime) {
      if (difference.inDays < 7) {
        return '${difference.inDays} ${S.current.daysAgo}';
      } else if (difference.inDays < 30) {
        final weeks = (difference.inDays / 7).floor();
        return '$weeks ${S.current.weeksAgo}';
      } else if (difference.inDays < 365) {
        final months = (difference.inDays / 30).floor();
        return '$months ${S.current.monthsAgo}';
      } else {
        final years = calculateYearsDifference(date, now);
        return '$years ${S.current.yearsAgo}';
      }
    }

    // Standard time ago formatting
    if (showTodayDetails && isSameDay(now, date)) {
      final seconds = difference.inSeconds;
      if (seconds < 60) {
        return '$seconds ${S.current.secondsAgo}';
      }
      final minutes = difference.inMinutes;
      if (minutes < 60) {
        return '$minutes ${S.current.minutesAgo}';
      }
      final hours = difference.inHours;
      return '$hours ${S.current.hoursAgo}';
    } else if (isSameDay(now, date)) {
      return S.current.today;
    } else if (isYesterday(date)) {
      return S.current.yesterday;
    } else if (difference.inDays < 7) {
      return '${difference.inDays} ${S.current.daysAgo}';
    } else if (date.year == now.year) {
      return DateFormat(DatePattern.dMMM).format(date);
    } else {
      return DateFormat(DatePattern.dMMMyyyy).format(date);
    }
  }

  static DateTime getMinimumDate(
      {required DateTime date, required int yearsAgo}) {
    DateTime minimumDate = DateTime(date.year - yearsAgo, date.month, date.day);

    // Adjust day if it exceeds the number of days in the resulting month
    final lastDayOfMonth =
        DateTime(minimumDate.year, minimumDate.month + 1, 0).day;
    if (minimumDate.day > lastDayOfMonth) {
      minimumDate =
          DateTime(minimumDate.year, minimumDate.month, lastDayOfMonth);
    }

    return minimumDate;
  }

  static bool areDatesSame(DateTime? date1, DateTime? date2) {
    return date1?.year == date2?.year &&
        date1?.month == date2?.month &&
        date1?.day == date2?.day;
  }

  static String convertTo24HourFormat(String time) {
    if (time.isEmpty == true) {
      return time;
    }
    // Normalize input to lower case and remove spaces for easier handling
    time = time.toLowerCase().replaceAll(' ', '');

    // Extract the hour, minute, and period (AM/PM) from the input
    final period = time.endsWith('am') ? 'am' : 'pm';
    final parts = time.replaceAll(RegExp(r'am|pm'), '').split(':');

    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);

    // Special cases for midnight and noon
    if (period == 'am' && hour == 12) {
      hour = 0; // 12 AM is midnight, so set hour to 0
    } else if (period == 'pm' && hour != 12) {
      hour += 12; // PM times (except 12 PM) need 12 hours added
    }

    // Format hours and minutes with leading zeros
    final hourStr = hour.toString().padLeft(2, '0');
    final minuteStr = minute.toString().padLeft(2, '0');

    // Handle end-of-day special case
    if (hour == 23 && minute == 59) {
      return '24:00';
    }

    return '$hourStr:$minuteStr';
  }
}
