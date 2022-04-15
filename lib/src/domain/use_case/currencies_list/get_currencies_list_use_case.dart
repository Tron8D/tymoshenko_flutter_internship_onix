import 'package:flutter_intership_onix/src/data/model/data/data_response.dart';
import 'package:flutter_intership_onix/src/domain/entity/currency.dart';
import 'package:flutter_intership_onix/src/domain/repository/currencies_repository.dart';

class GetCurrenciesListUseCase {
  final CurrenciesRepository currenciesRepository;

  GetCurrenciesListUseCase(this.currenciesRepository);

  Future<DataResponse<List<Currency>>> call(
          DateTime? lastUpdate, String? updateInterval) =>
      currenciesRepository.getCurrenciesList(lastUpdate, updateInterval);
}
