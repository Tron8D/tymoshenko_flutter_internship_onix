import 'package:flutter_intership_onix/src/data/model/data/data_response.dart';
import 'package:flutter_intership_onix/src/domain/entity/currency.dart';

abstract class CurrenciesHiveSource {
  String boxName = 'Currencies';

  Future<DataResponse<List<Currency>>> getCurrencies();

  Future<void> saveCurrencies(List<Currency> currenciesList);
}
