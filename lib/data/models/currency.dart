//base class for currency.
class Currency {
  final int id;
  final String name;
  final String fullName;
  final String symbol;
  final double rateToUah;
  final String countryCode;

  Currency({
    required this.id,
    required this.name,
    required this.fullName,
    required this.symbol,
    required this.rateToUah,
    required this.countryCode,
  }) {
    assert(rateToUah > 0);
  }
  int getId() {
    print(id);
    return id;
  }
}
