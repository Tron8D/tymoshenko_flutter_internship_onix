import 'package:flutter_intership_onix/data/source/streams/streams.dart';

import '../models/currency.dart';

class CurrenciesRepository {
  final Streams streams;
  CurrenciesRepository(this.streams) {
    streams.currencyStreamSimulation();
  }
  List<Currency> currenciesList = [];

  Currency getCurrencyFromId(int id) {
    return currenciesList.firstWhere((element) => (element.id == id));
    if (currenciesList.isNotEmpty) {
      return currenciesList.firstWhere((element) => (element.id == id));
    }
  }
}
