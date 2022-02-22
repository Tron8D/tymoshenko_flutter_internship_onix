import 'package:flutter/material.dart';

import 'package:flutter_intership_onix/data/models/local/currency.dart';
import 'package:flutter_intership_onix/data/repository/currencies_repository.dart';
import 'package:flutter_intership_onix/data/source/local/preferences_management.dart';

class CurrenciesListProvider extends ChangeNotifier {
  final PreferencesManagement _preferencesManagement = PreferencesManagement();
  bool isLoading = true;
  String? error;
  List<Currency> currenciesList = [];
  late DateTime? _updateTime;
  late String? updateInterval;

  CurrenciesListProvider() {
    _startProvider();
  }

  void getCurrenciesList() async {
    isLoading = true;
    notifyListeners();
    var remoteCurrencyList = await CurrenciesRepository.getCurrenciesList(
        _updateTime, updateInterval);

    if (remoteCurrencyList.errorMassage == null) {
      currenciesList = remoteCurrencyList.data;
      _updateTime = remoteCurrencyList.updateTime;
      _preferencesManagement.setUpdateTime(_updateTime!);
    } else {
      error = remoteCurrencyList.errorMassage;
      currenciesList = remoteCurrencyList.data;
    }

    isLoading = false;
    notifyListeners();
  }

  Currency getCurrencyFromId(int id) {
    if (currenciesList.isNotEmpty) {
      return currenciesList.firstWhere((element) => (element.id == id));
    } else {
      error = 'Error: No element';
      notifyListeners();

      return Currency(
          id: 0,
          name: 'name',
          fullName: 'fullName',
          symbol: 'symbol',
          rateToUah: 1,
          countryCode: 'countryCode');
    }
  }

  void _startProvider() async {
    await _getPreference();
    getCurrenciesList();
  }

  Future<void> _getPreference() async {
    _updateTime = await _preferencesManagement.getUpdateTime();
    updateInterval = await _preferencesManagement.getUpdateInterval();
  }

  void setUpdateInterval(String interval) {
    updateInterval = interval;
    _preferencesManagement.setUpdateInterval(interval);
  }
}
