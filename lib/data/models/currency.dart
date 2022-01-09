//base class for currency.
class Currency {
  final String name;
  final String fullName;
  final String symbol;
  final double rateToUah;
  final String countryCode;

  Currency({
    required this.name,
    required this.fullName,
    required this.symbol,
    required this.rateToUah,
    required this.countryCode,
  }) {
    assert(rateToUah > 0);
  }
}
