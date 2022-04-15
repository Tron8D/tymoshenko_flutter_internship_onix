import 'package:flutter_intership_onix/src/data/model/data/data_response.dart';
import 'package:flutter_intership_onix/src/domain/entity/currency.dart';

abstract class CurrenciesRepository {
  Future<DataResponse<List<Currency>>> getCurrenciesList(
      DateTime? lastUpdate, String? updateInterval);

  Future<DataResponse<List<Currency>>> getFromDioSource();

  Future<DataResponse<List<Currency>>> getFromHiveSource();

  int getTimeToUpdate(String? updateInterval);
}
