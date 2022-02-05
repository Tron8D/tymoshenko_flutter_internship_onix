import 'package:flutter_intership_onix/data/models/currency.dart';
import 'package:flutter_intership_onix/data/source/currencies.dart';
// import 'package:flutter_intership_onix/data/source/streams/streams.dart';

class CurrenciesRepository {
  // final Streams streams;
  // List<Currency> currenciesList = [];
  //
  // CurrenciesRepository(this.streams) {
  //   createRepository();
  // }

  Future<List<Currency>> getCurrenciesList() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [usd, eur, uan];
  }

  //start listen stream and start screen simulation
  // void createRepository() async {
  //   streams.currenciesStream().listen((event) {
  //     currenciesList = event;
  //   });
  //   streams.currencyStreamSimulation();
  // }

  // Currency getCurrencyFromId(int id) {
  //   return currenciesList.firstWhere((element) => (element.id == id),
  //       orElse: () => usd);
  // }
}
