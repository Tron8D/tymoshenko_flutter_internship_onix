import 'package:dio/dio.dart';

import 'package:flutter_intership_onix/src/data/model/data/data_response.dart';
import 'package:flutter_intership_onix/src/data/model/mapper/currency_dio_mapper.dart';
import 'package:flutter_intership_onix/src/data/remote/currencies_source_response.dart';
import 'package:flutter_intership_onix/src/data/source/remote/currencies_dio_source.dart';
import 'package:flutter_intership_onix/src/domain/entity/currency.dart';

class CurrenciesDioSourceImpl extends CurrenciesDioSource {
  @override
  Future<DataResponse<List<Currency>>> getCurrencies() async {
    try {
      var response = await dio.get(
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
