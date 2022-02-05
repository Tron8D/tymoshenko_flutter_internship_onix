import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/data/models/currency.dart';
import 'package:flutter_intership_onix/data/repository/currencies_repository.dart';

class CurrenciesListProvider extends ChangeNotifier {
  final CurrenciesRepository _currenciesRepository = CurrenciesRepository();
  bool isLoading = true;
  List<Currency> currenciesList = [];

  CurrenciesListProvider() {
    getCurrenciesList();
  }

  void getCurrenciesList() async {
    isLoading = true;
    notifyListeners();
    currenciesList = await _currenciesRepository.getCurrenciesList();
    isLoading = false;
    notifyListeners();
  }

  Currency getCurrencyFromId(int id) {
    return currenciesList.firstWhere(
      (element) => (element.id == id),
      // orElse: () => usd!
    );
  }
}
