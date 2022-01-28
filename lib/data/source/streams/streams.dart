import 'dart:async';

import '/data/models/currency.dart';
import '../currencies.dart';

class Streams {
  final currenciesStreamController = StreamController<Currency>.broadcast();
  Stream<Currency> currenciesStream() => currenciesStreamController.stream;

  final streamThemeController = StreamController<bool>.broadcast();
  Stream<bool> themeStream() => streamThemeController.stream;

  final topCardStreamController = StreamController<int>.broadcast();
  Stream<int> topCardStream() => topCardStreamController.stream;

  final bottomCardStreamController = StreamController<int>.broadcast();
  Stream<int> bottomCardStream() => bottomCardStreamController.stream;

  void currencyStreamSimulation() async {
    await Future.delayed(const Duration(milliseconds: 500))
        .then((value) => currenciesStreamController.sink.add(usd));
    await Future.delayed(const Duration(milliseconds: 200))
        .then((value) => currenciesStreamController.sink.add(eur));
    await Future.delayed(const Duration(milliseconds: 200))
        .then((value) => currenciesStreamController.sink.add(uan));
  }
}
