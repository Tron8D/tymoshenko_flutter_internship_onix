import 'package:flutter_intership_onix/data/mappers/currency_mapper.dart';
import 'package:flutter_intership_onix/data/models/currency.dart';
import 'package:flutter_intership_onix/data/models/data_response.dart';
import 'package:flutter_intership_onix/data/source/currencies_source.dart';

class CurrenciesRepository {
  static Future<DataResponse<List<Currency>>> getCurrenciesList() async {
    var response = await CurrenciesSource().getCurrencies();

    if (response.errorMassage == null) {
      var currenciesList = CurrencyMapper.mapResponse(response.data);

      return DataResponse(List.from(currenciesList));
    } else {
      return DataResponse([], response.errorMassage);
    }
  }
}
