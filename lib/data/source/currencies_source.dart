import 'package:dio/dio.dart';

import 'package:flutter_intership_onix/data/response/currencies_source_response.dart';

class CurrenciesSource {
  var dio = Dio();

  Future<List<CurrencySourceResponse>> getCurrencies() async {
    try {
      var response = await dio.get(
          'https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5');
      var currencies = (response.data as List<dynamic>)
          .map((json) => CurrencySourceResponse.fromJson(json))
          .toList();
      print(currencies);
      return currencies;
    } catch (_) {
      return [];
    }
  }
}
