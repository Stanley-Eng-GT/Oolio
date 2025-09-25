import 'package:flutter/services.dart';

enum PhoneNumberType {
  mobile,
  landLine,
}

class PhoneNumberFormatterConstants {
  static int mobileNumberLength = 10;
  static String countryCode = '+61';
}

class PhoneNumberFormatter extends TextInputFormatter {
  PhoneNumberFormatter({
    required this.phoneNumberType,
  });
  final PhoneNumberType phoneNumberType;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final inputText = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    final string = _getFormattedString(inputText);
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }

  String _getFormattedString(String inputText) {
    switch (phoneNumberType) {
      case PhoneNumberType.mobile:
        return formatMobileNumber(inputText);
      case PhoneNumberType.landLine:
        return formatLandLineNumber(inputText);
    }
  }
}

// without starting zero
String formatMobileNumber(String inputText) {
  final input = inputText.startsWith('0') ? inputText : '0$inputText';
  final bufferString = StringBuffer();
  for (int i = 0; i < input.length; i++) {
    bufferString.write(input[i]);
    final nonZeroIndexValue = i + 1;
    if ((nonZeroIndexValue == 4 || nonZeroIndexValue == 7) &&
        nonZeroIndexValue != input.length) {
      bufferString.write(' ');
    }
  }

  return bufferString.toString();
}

String formatLandLineNumber(String inputText) {
  final bufferString = StringBuffer();

  for (int i = 0; i < inputText.length; i++) {
    // Add opening parenthesis for area code
    if (i == 0) bufferString.write('(');

    bufferString.write(inputText[i]);

    final nextIndex = i + 1;

    // Add closing parenthesis after the area code
    if (nextIndex == 2) {
      bufferString.write(') ');
    } else if (nextIndex == 6 && nextIndex != inputText.length) {
      // Add space after the first part of the subscriber number
      bufferString.write(' ');
    }
  }

  return bufferString.toString();
}
