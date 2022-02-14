import 'package:flutter/material.dart';

import 'package:flutter_intership_onix/data/models/currency.dart';
import 'package:flutter_intership_onix/data/repository/currencies_repository.dart';

class CurrenciesListProvider extends ChangeNotifier {
  bool isLoading = true;
  String? error;
  List<Currency> currenciesList = [];

  CurrenciesListProvider() {
    getCurrenciesList();
  }

  void getCurrenciesList() async {
    isLoading = true;
    notifyListeners();
    var remoteCurrencyList = await CurrenciesRepository.getCurrenciesList();
    if (remoteCurrencyList.errorMassage == null) {
      currenciesList = remoteCurrencyList.data;
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
}
