import 'models/digit_key_model.dart';

class DigitKeyboardConstants {
  static const int crossAxisCount = 3;
  static const List<DigitKeyModel> keys = [
    DigitKeyModel.digitWithChars(title: '1', subtitle: ''),
    DigitKeyModel.digitWithChars(title: '2', subtitle: 'ABC'),
    DigitKeyModel.digitWithChars(title: '3', subtitle: 'DEF'),
    DigitKeyModel.digitWithChars(title: '4', subtitle: 'GHI'),
    DigitKeyModel.digitWithChars(title: '5', subtitle: 'JKL'),
    DigitKeyModel.digitWithChars(title: '6', subtitle: 'MNO'),
    DigitKeyModel.digitWithChars(title: '7', subtitle: 'PQRS'),
    DigitKeyModel.digitWithChars(title: '8', subtitle: 'TUV'),
    DigitKeyModel.digitWithChars(title: '9', subtitle: 'WXYZ'),
    DigitKeyModel.dot(),
    DigitKeyModel.digitOnly(title: '0'),
    DigitKeyModel.delete(),
  ];
  static const double letterSpacing = 2.0;
  static const double textHeight = 0.8;
}
