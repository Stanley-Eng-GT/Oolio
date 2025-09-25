// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Please authenticate to access your services.`
  String get authenticateReason {
    return Intl.message(
      'Please authenticate to access your services.',
      name: 'authenticateReason',
      desc: '',
      args: [],
    );
  }

  /// `hrs ago`
  String get hoursAgo {
    return Intl.message(
      'hrs ago',
      name: 'hoursAgo',
      desc: '',
      args: [],
    );
  }

  /// `mins ago`
  String get minutesAgo {
    return Intl.message(
      'mins ago',
      name: 'minutesAgo',
      desc: '',
      args: [],
    );
  }

  /// `months ago`
  String get monthsAgo {
    return Intl.message(
      'months ago',
      name: 'monthsAgo',
      desc: '',
      args: [],
    );
  }

  /// `No image selected. Please try again.`
  String get noImageError {
    return Intl.message(
      'No image selected. Please try again.',
      name: 'noImageError',
      desc: '',
      args: [],
    );
  }

  /// `days ago`
  String get daysAgo {
    return Intl.message(
      'days ago',
      name: 'daysAgo',
      desc: '',
      args: [],
    );
  }

  /// `secs ago`
  String get secondsAgo {
    return Intl.message(
      'secs ago',
      name: 'secondsAgo',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `weeks ago`
  String get weeksAgo {
    return Intl.message(
      'weeks ago',
      name: 'weeksAgo',
      desc: '',
      args: [],
    );
  }

  /// `years ago`
  String get yearsAgo {
    return Intl.message(
      'years ago',
      name: 'yearsAgo',
      desc: '',
      args: [],
    );
  }

  /// `Yesterday`
  String get yesterday {
    return Intl.message(
      'Yesterday',
      name: 'yesterday',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
