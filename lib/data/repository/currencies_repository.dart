import 'package:flutter_intership_onix/data/models/currency.dart';
import 'package:flutter_intership_onix/data/source/currencies.dart';

class CurrenciesRepository {
  Future<List<Currency>> getCurrenciesList() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [usd, eur, uan];
  }
}
