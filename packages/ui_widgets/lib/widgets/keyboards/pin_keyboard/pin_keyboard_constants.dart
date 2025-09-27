import 'package:ui_widgets/widgets/keyboards/pin_keyboard/models/pin_key_model.dart';

class PinKeyboardConstants {
  static const int portraitCrossAxisCount = 3;
  static const int landScapeCrossAxisCount = 6;
  static const List<PinKeyModel> keys = [
    PinKeyModel.digitWithChars(title: '1', subtitle: ''),
    PinKeyModel.digitWithChars(title: '2', subtitle: 'ABC'),
    PinKeyModel.digitWithChars(title: '3', subtitle: 'DEF'),
    PinKeyModel.digitWithChars(title: '4', subtitle: 'GHI'),
    PinKeyModel.digitWithChars(title: '5', subtitle: 'JKL'),
    PinKeyModel.digitWithChars(title: '6', subtitle: 'MNO'),
    PinKeyModel.digitWithChars(title: '7', subtitle: 'PQRS'),
    PinKeyModel.digitWithChars(title: '8', subtitle: 'TUV'),
    PinKeyModel.digitWithChars(title: '9', subtitle: 'WXYZ'),
    PinKeyModel.placeholder(),
    PinKeyModel.digitOnly(title: '0'),
    PinKeyModel.delete(),
  ];
  static const double keyWidth = 80.0;
  static const double pinViewIconSize = 14.0;
  static const double textHeight = 0.8;
  static const double pinViewFilterSigmaValue = 5.0;
}
