import 'package:flutter_intership_onix/data/models/data_response.dart';
import 'package:flutter_intership_onix/data/models/local/currency.dart';
import 'package:flutter_intership_onix/data/source/local/currency_hive_source.dart';
import 'package:flutter_intership_onix/data/source/remote/currencies_dio_source.dart';

class CurrenciesRepository {
  static Future<DataResponse<List<Currency>>> getCurrenciesList(
      DateTime? lastUpdate, String? updateInterval) async {
    int _timeToUpdate = _getTimeToUpdate(updateInterval);
    late int _differenceTime;

    //On first start program
    if (lastUpdate != null) {
      _differenceTime = DateTime.now().difference(lastUpdate).inSeconds;
    } else {
      _differenceTime = 0;
    }

    if (_differenceTime > _timeToUpdate || lastUpdate == null) {
      return await _getFromDioSource();
    } else {
      return await _getFromHiveSource();
    }
  }

  static Future<DataResponse<List<Currency>>> _getFromDioSource() async {
    var response = await CurrenciesDioSource.getCurrencies();

    if (response.errorMassage == null) {
      var currenciesList = response.data;

      CurrenciesHiveSource.saveCurrencies(currenciesList);
      return DataResponse(
          data: List.from(currenciesList), updateTime: response.updateTime);
    } else {
      var _hiveResponse = await _getFromHiveSource();

      if (_hiveResponse.errorMassage == null) {
        return _getFromHiveSource();
      } else {
        return DataResponse(data: [], errorMassage: response.errorMassage);
      }
    }
  }

  static Future<DataResponse<List<Currency>>> _getFromHiveSource() async {
    var _hiveResponse = await CurrenciesHiveSource.getCurrencies();

    if (_hiveResponse.errorMassage == null) {
      var currenciesList = _hiveResponse.data;

      return DataResponse(
          data: List.from(currenciesList),
          updateTime: _hiveResponse.updateTime);
    } else {
      return DataResponse(data: [], errorMassage: _hiveResponse.errorMassage);
    }
  }

  static int _getTimeToUpdate(String? updateInterval) {
    switch (updateInterval) {
      case '15 sec':
        {
          return 15;
        }
      case '30 sec':
        {
          return 30;
        }
      case '1 min':
        {
          return 60;
        }
      default:
        {
          return 15;
        }
    }
  }
}
