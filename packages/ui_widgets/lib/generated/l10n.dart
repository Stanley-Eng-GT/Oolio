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

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Confirm new password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm new password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get emailAddress {
    return Intl.message(
      'Email address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email address`
  String get emailAddressEmptyErrorMessage {
    return Intl.message(
      'Please enter your email address',
      name: 'emailAddressEmptyErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email format. Please enter a valid email address`
  String get emailAddressFormatErrorMessage {
    return Intl.message(
      'Invalid email format. Please enter a valid email address',
      name: 'emailAddressFormatErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Enter new password`
  String get enterNewPassword {
    return Intl.message(
      'Enter new password',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number`
  String get mobileNumber {
    return Intl.message(
      'Mobile number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid mobile number, e.g.: (+61) 0400 000 000`
  String get mobileNumberFormatErrorMessage {
    return Intl.message(
      'Please enter a valid mobile number, e.g.: (+61) 0400 000 000',
      name: 'mobileNumberFormatErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `At least one special character`
  String get passwordCharacterErrorMessage {
    return Intl.message(
      'At least one special character',
      name: 'passwordCharacterErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get passwordEmptyErrorMessage {
    return Intl.message(
      'Please enter your password',
      name: 'passwordEmptyErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Password length must be at least 8 characters`
  String get passwordFormatErrorMessage {
    return Intl.message(
      'Password length must be at least 8 characters',
      name: 'passwordFormatErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Minimum 8 characters`
  String get passwordLengthErrorMessage {
    return Intl.message(
      'Minimum 8 characters',
      name: 'passwordLengthErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `At least one lowercase letter`
  String get passwordLowercaseErrorMessage {
    return Intl.message(
      'At least one lowercase letter',
      name: 'passwordLowercaseErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsNotMatchErrorMessage {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsNotMatchErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `At least one number`
  String get passwordNumberErrorMessage {
    return Intl.message(
      'At least one number',
      name: 'passwordNumberErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `8 character`
  String get passwordProgressEightCharacter {
    return Intl.message(
      '8 character',
      name: 'passwordProgressEightCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Lowercase letter`
  String get passwordProgressLowercase {
    return Intl.message(
      'Lowercase letter',
      name: 'passwordProgressLowercase',
      desc: '',
      args: [],
    );
  }

  /// `Numeric character`
  String get passwordProgressNumericCharacter {
    return Intl.message(
      'Numeric character',
      name: 'passwordProgressNumericCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Passwords match`
  String get passwordProgressPasswordMatch {
    return Intl.message(
      'Passwords match',
      name: 'passwordProgressPasswordMatch',
      desc: '',
      args: [],
    );
  }

  /// `Special character`
  String get passwordProgressSpecialCharacter {
    return Intl.message(
      'Special character',
      name: 'passwordProgressSpecialCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Uppercase letter`
  String get passwordProgressUppercaseLetter {
    return Intl.message(
      'Uppercase letter',
      name: 'passwordProgressUppercaseLetter',
      desc: '',
      args: [],
    );
  }

  /// `At least one uppercase letter`
  String get passwordUppercaseErrorMessage {
    return Intl.message(
      'At least one uppercase letter',
      name: 'passwordUppercaseErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Select upload document`
  String get selectUploadDocument {
    return Intl.message(
      'Select upload document',
      name: 'selectUploadDocument',
      desc: '',
      args: [],
    );
  }

  /// `Tap a Star to Rate`
  String get tapAStarToRate {
    return Intl.message(
      'Tap a Star to Rate',
      name: 'tapAStarToRate',
      desc: '',
      args: [],
    );
  }

  /// `Text color`
  String get textColor {
    return Intl.message(
      'Text color',
      name: 'textColor',
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
