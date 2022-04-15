import 'package:flutter_intership_onix/src/data/model/data/data_response.dart';
import 'package:flutter_intership_onix/src/data/source/local/currency_hive_source.dart';
import 'package:flutter_intership_onix/src/data/source/remote/currencies_dio_source.dart';
import 'package:flutter_intership_onix/src/domain/entity/currency.dart';
import 'package:flutter_intership_onix/src/domain/repository/currencies_repository.dart';

class CurrenciesRepositoryImpl extends CurrenciesRepository {
  final CurrenciesDioSource currenciesDioSource;
  final CurrenciesHiveSource currenciesHiveSource;

  CurrenciesRepositoryImpl(
      {required this.currenciesDioSource, required this.currenciesHiveSource});

  @override
  Future<DataResponse<List<Currency>>> getCurrenciesList(
      DateTime? lastUpdate, String? updateInterval) async {
    int _timeToUpdate = getTimeToUpdate(updateInterval);
    late int _differenceTime;

    //On first start program
    if (lastUpdate != null) {
      _differenceTime = DateTime.now().difference(lastUpdate).inSeconds;
    } else {
      _differenceTime = 0;
    }

    if (_differenceTime > _timeToUpdate || lastUpdate == null) {
      return await getFromDioSource();
    } else {
      return await getFromHiveSource();
    }
  }

  @override
  Future<DataResponse<List<Currency>>> getFromDioSource() async {
    DataResponse<List<Currency>> response =
        await currenciesDioSource.getCurrencies();

    if (response.errorMassage == null) {
      var currenciesList = response.data;

      await currenciesHiveSource.saveCurrencies(currenciesList);
      return DataResponse(
          data: List.from(currenciesList), updateTime: response.updateTime);
    } else {
      var _hiveResponse = await getFromHiveSource();

      if (_hiveResponse.errorMassage == null) {
        return getFromHiveSource();
      } else {
        return DataResponse(data: [], errorMassage: response.errorMassage);
      }
    }
  }

  @override
  Future<DataResponse<List<Currency>>> getFromHiveSource() async {
    var _hiveResponse = await currenciesHiveSource.getCurrencies();

    if (_hiveResponse.errorMassage == null) {
      var currenciesList = _hiveResponse.data;

      if (_hiveResponse.data.isEmpty) {
        return DataResponse(data: [], errorMassage: 'List empty.');
      } else {
        return DataResponse(
            data: List.from(currenciesList),
            updateTime: _hiveResponse.updateTime);
      }
    } else {
      return DataResponse(data: [], errorMassage: _hiveResponse.errorMassage);
    }
  }

  @override
  int getTimeToUpdate(String? updateInterval) {
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
