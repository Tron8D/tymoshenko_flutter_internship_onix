import 'package:flutter_intership_onix/data/models/local/currency_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CurrencyHiveSource {
  final String _boxName = 'Currencies';

  Future<List<CurrencyHiveModel>> getCurrenciesFromHive() async {
    var _currenciesBox = await Hive.openBox<CurrencyHiveModel>(_boxName);
    return _currenciesBox.values.toList();
  }

  Future<void> saveCurrenciesToHive(
      List<CurrencyHiveModel> currenciesList) async {
    var _currenciesBox = await Hive.openBox<CurrencyHiveModel>(_boxName);
    _currenciesBox.addAll(currenciesList);
  }
}
