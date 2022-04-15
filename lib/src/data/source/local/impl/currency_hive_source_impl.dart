import 'package:flutter_intership_onix/src/data/source/local/currency_hive_source.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_intership_onix/src/data/model/data/data_response.dart';
import 'package:flutter_intership_onix/src/data/model/local/currency_hive_model.dart';
import 'package:flutter_intership_onix/src/data/model/mapper/currency_hive_mapper.dart';
import 'package:flutter_intership_onix/src/domain/entity/currency.dart';

class CurrenciesHiveSourceImpl extends CurrenciesHiveSource {
  @override
  Future<DataResponse<List<Currency>>> getCurrencies() async {
    try {
      var _currenciesBox = await Hive.openBox<CurrencyHiveModel>(boxName);
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

  @override
  Future<void> saveCurrencies(List<Currency> currenciesList) async {
    List<CurrencyHiveModel> _currencyListForHive =
        CurrencyHiveMapper.mapList(currenciesList);
    var _currenciesBox = await Hive.openBox<CurrencyHiveModel>(boxName);

    await _currenciesBox.clear();
    await _currenciesBox.addAll(_currencyListForHive);
    await _currenciesBox.close();
  }
}
