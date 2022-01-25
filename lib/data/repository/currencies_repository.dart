import 'dart:async';

import '../source/currencies.dart';
import '../models/currency.dart';

class CurrenciesRepository {
//
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
