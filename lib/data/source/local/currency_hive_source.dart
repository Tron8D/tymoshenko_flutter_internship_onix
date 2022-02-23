import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_intership_onix/data/local/mappers/currency_hive_mapper.dart';
import 'package:flutter_intership_onix/data/models/data_response.dart';
import 'package:flutter_intership_onix/data/models/local/currency.dart';
import 'package:flutter_intership_onix/data/models/local/currency_hive_model.dart';

class CurrenciesHiveSource {
  static const String _boxName = 'Currencies';

  static Future<DataResponse<List<Currency>>> getCurrencies() async {
    try {
      var _currenciesBox = await Hive.openBox<CurrencyHiveModel>(_boxName);
      var _currenciesFromHove = _currenciesBox.values.toList();
      var _currenciesList = CurrencyHiveMapper.mapResponse(_currenciesFromHove);

      return DataResponse(data: _currenciesList, updateTime: DateTime.now());
    } catch (error) {
      var _currenciesList = <Currency>[];
      var response =
          DataResponse(data: _currenciesList, errorMassage: 'Error: $error.');

      return response;
    }
  }

  static Future<void> saveCurrencies(List<Currency> currenciesList) async {
    List<CurrencyHiveModel> _currencyListForHive =
        CurrencyHiveMapper.mapList(currenciesList);
    var _currenciesBox = await Hive.openBox<CurrencyHiveModel>(_boxName);

    _currenciesBox.clear();
    _currenciesBox.addAll(_currencyListForHive);
    _currenciesBox.close();
  }
}
