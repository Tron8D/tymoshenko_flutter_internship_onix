import 'package:dio/dio.dart';

import 'package:flutter_intership_onix/data/models/data_response.dart';
import 'package:flutter_intership_onix/data/models/local/currency.dart';
import 'package:flutter_intership_onix/data/remote/mappers/currency_dio_mapper.dart';
import 'package:flutter_intership_onix/data/remote/response/currencies_source_response.dart';

class CurrenciesDioSource {
  static final _dio = Dio();

  static Future<DataResponse<List<Currency>>> getCurrencies() async {
    try {
      var response = await _dio.get(
          'https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5');
      var _currenciesFromResponse = (response.data as List<dynamic>)
          .map((json) => CurrencySourceResponse.fromJson(json))
          .toList();
      var _currenciesList =
          CurrencyDioMapper.mapResponse(_currenciesFromResponse);

      return DataResponse<List<Currency>>(
          data: _currenciesList, updateTime: DateTime.now());
    } on DioError catch (error) {
      var currencies = <Currency>[];
      var response = DataResponse(
          data: currencies, errorMassage: 'Error: ${error.error}.');

      return response;
    } catch (error) {
      var currencies = <Currency>[];
      var response =
          DataResponse(data: currencies, errorMassage: 'Error: $error.');

      return response;
    }
  }
}
