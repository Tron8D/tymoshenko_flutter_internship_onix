import 'package:flutter_intership_onix/src/data/model/local/currency_hive_model.dart';
import 'package:flutter_intership_onix/src/domain/entity/currency.dart';

class CurrencyHiveMapper {
  static List<Currency> mapResponse(List<CurrencyHiveModel> response) {
    List<Currency> _currenciesList = response.map((localCurrency) {
      return Currency(
        id: localCurrency.id,
        rateToUah: localCurrency.rateToUah,
        name: localCurrency.name,
        fullName: localCurrency.fullName,
        symbol: localCurrency.symbol,
        countryCode: localCurrency.countryCode,
      );
    }).toList();

    return _currenciesList;
  }

  static List<CurrencyHiveModel> mapList(List<Currency> list) {
    List<CurrencyHiveModel> _currenciesListForHive = list.map((currency) {
      return CurrencyHiveModel(
        id: currency.id,
        rateToUah: currency.rateToUah,
        name: currency.name,
        fullName: currency.fullName,
        symbol: currency.symbol,
        countryCode: currency.countryCode,
      );
    }).toList();

    return _currenciesListForHive;
  }
}
