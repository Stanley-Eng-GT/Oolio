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

  /// `Failed to make an API request: {errorMessage}`
  String failedApiRequestMessage(Object errorMessage) {
    return Intl.message(
      'Failed to make an API request: $errorMessage',
      name: 'failedApiRequestMessage',
      desc: '',
      args: [errorMessage],
    );
  }

  /// `No internet connection detected. Please ensure you are connected to the internet and try again.`
  String get noInternetErrorMessage {
    return Intl.message(
      'No internet connection detected. Please ensure you are connected to the internet and try again.',
      name: 'noInternetErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Request failed with status {statusCode}`
  String requestFailedMessage(Object statusCode) {
    return Intl.message(
      'Request failed with status $statusCode',
      name: 'requestFailedMessage',
      desc: '',
      args: [statusCode],
    );
  }

  /// `It looks like the connection is taking longer than expected. Please check your internet connection and try again. If the issue persists, try restarting the app or your device.`
  String get timeoutErrorMessage {
    return Intl.message(
      'It looks like the connection is taking longer than expected. Please check your internet connection and try again. If the issue persists, try restarting the app or your device.',
      name: 'timeoutErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred`
  String get unexpectedErrorMessage {
    return Intl.message(
      'An unexpected error occurred',
      name: 'unexpectedErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error`
  String get unknownError {
    return Intl.message(
      'Unknown error',
      name: 'unknownError',
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
