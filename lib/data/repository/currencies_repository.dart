import 'dart:async';

import '../models/currency.dart';

class CurrenciesRepository {
  Currency usd = Currency(
    name: 'USD',
    fullName: 'American Dollar',
    symbol: '\$',
    rateToUah: 1,
    countryCode: 'us',
  );
  Currency eur = Currency(
    name: 'EUR',
    fullName: 'Euro',
    symbol: '€',
    rateToUah: 1,
    countryCode: 'eu',
  );
  Currency uan = Currency(
    name: 'UAN',
    fullName: 'Hryvnia',
    symbol: '₴',
    rateToUah: 1,
    countryCode: 'ua',
  );

  List<Currency> currenciesList = [];

  void streamSimulation() async {
    await Future.delayed(const Duration(milliseconds: 2000))
        .then((value) => _streamController.sink.add(usd));
    await Future.delayed(const Duration(milliseconds: 500))
        .then((value) => _streamController.sink.add(eur));
    await Future.delayed(const Duration(milliseconds: 500))
        .then((value) => _streamController.sink.add(uan));
  }

  final _streamController = StreamController<Currency>.broadcast();

  Stream<Currency> currenciesStream() => _streamController.stream;
}
