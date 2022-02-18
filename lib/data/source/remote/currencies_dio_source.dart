import 'package:dio/dio.dart';

import 'package:flutter_intership_onix/data/models/data_response.dart';
import 'package:flutter_intership_onix/data/remote/response/currencies_source_response.dart';

class CurrenciesSource {
  final _dio = Dio();

  Future<DataResponse<List<CurrencySourceResponse>>> getCurrencies() async {
    try {
      var response = await _dio.get(
          'https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5');
      var currencies = (response.data as List<dynamic>)
          .map((json) => CurrencySourceResponse.fromJson(json))
          .toList();

      return DataResponse<List<CurrencySourceResponse>>(currencies);
    } on DioError catch (error) {
      var currencies = <CurrencySourceResponse>[];
      var response = DataResponse(currencies, 'Error: ${error.error}.');

      return response;
    } catch (error) {
      var currencies = <CurrencySourceResponse>[];
      var response = DataResponse(currencies, 'Error: $error.');

      return response;
    }
  }
}
