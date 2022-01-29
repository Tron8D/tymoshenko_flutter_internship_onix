import 'dart:async';

import '/data/models/currency.dart';
import '../currencies.dart';

class Streams {
  final currenciesStreamController = StreamController<Currency>();
  Stream<Currency> currenciesStream() => currenciesStreamController.stream;

  final _streamThemeController = StreamController<bool>();
  Stream<bool> get themeStream => _streamThemeController.stream;

  final _topCardStreamController = StreamController<int>();
  Stream<int> get topCardStream => _topCardStreamController.stream;

  final _bottomCardStreamController = StreamController<int>();
  Stream<int> get bottomCardStream => _bottomCardStreamController.stream;

  void currencyStreamSimulation() async {
    await Future.delayed(const Duration(milliseconds: 500))
        .then((value) => currenciesStreamController.sink.add(usd));
    await Future.delayed(const Duration(milliseconds: 200))
        .then((value) => currenciesStreamController.sink.add(eur));
    await Future.delayed(const Duration(milliseconds: 200))
        .then((value) => currenciesStreamController.sink.add(uan));
  }

  void setThemeInStream(bool dark) {
    _streamThemeController.sink.add(dark);
  }

  void setTopCardInStream(int id) {
    _topCardStreamController.sink.add(id);
  }

  void setBottomCardInStream(int id) {
    _bottomCardStreamController.sink.add(id);
  }
}
