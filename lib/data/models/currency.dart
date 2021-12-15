//base class for currency.
class Currency {
  final String name;
  final String symbol;
  final double rateToUah;

  Currency({
    required this.name,
    required this.symbol,
    required this.rateToUah,
  }) {
    assert(rateToUah > 0);
  }
}
