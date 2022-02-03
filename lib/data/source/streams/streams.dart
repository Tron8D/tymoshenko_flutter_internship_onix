import 'dart:async';

import 'package:flutter_intership_onix/data/models/currency.dart';
import 'package:flutter_intership_onix/data/source/currencies.dart';

class Streams {
  //Currencies stream
  final currenciesStreamController =
      StreamController<List<Currency>>.broadcast();
  Stream<List<Currency>> currenciesStream() =>
      currenciesStreamController.stream;

  void currencyStreamSimulation() async {
    await Future.delayed(
        const Duration(milliseconds: 500),
        () => currenciesStreamController.sink.add([
              usd,
              eur,
              uan,
            ]));
  }

  //Theme stream
  final _streamThemeController = StreamController<bool>();
  Stream<bool> get themeStream => _streamThemeController.stream;

  void setThemeInStream(bool dark) {
    _streamThemeController.sink.add(dark);
  }

  //Top card stream
  final _topCardStreamController = StreamController<int>.broadcast();
  Stream<int> get topCardStream => _topCardStreamController.stream;

  void setTopCardInStream(int id) {
    _topCardStreamController.sink.add(id);
  }

  //Bottom card stream
  final _bottomCardStreamController = StreamController<int>.broadcast();
  Stream<int> get bottomCardStream => _bottomCardStreamController.stream;

  void setBottomCardInStream(int id) {
    _bottomCardStreamController.sink.add(id);
  }
}
