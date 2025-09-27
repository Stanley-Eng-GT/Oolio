extension CurrencyExtension on double {
  String toCurrency() {
    return '\$ ${toStringAsFixed(2)}';
  }
}
