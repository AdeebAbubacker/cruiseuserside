class PriceHelper {
  static const double _taxRate = 0.18;

  /// Accepts amount as String, adds 18%, returns String
  static String addTax(String amount) {
    final value = int.tryParse(amount) ?? 0;
    final total = value + (value * _taxRate);
    return total.round().toString();
  }
}
