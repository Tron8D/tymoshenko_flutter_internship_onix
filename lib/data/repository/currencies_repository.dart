import '../models/currency.dart';

class CurrenciesRepository {
  List<Currency> currenciesList = [];

  Currency getCurrencyId(int id) =>
      currenciesList.firstWhere((element) => (element.id == id));
}
