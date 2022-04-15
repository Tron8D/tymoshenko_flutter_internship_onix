import 'package:flutter_intership_onix/src/domain/entity/currency.dart';

//in response BTC base currency is USD. Rebase USD to UAH
class RebaseCurrency {
  static List<Currency> rebase(List<Currency> list) {
    double _usdRate = _getUsdRate(list);
    var rebasedList = list.map((element) {
      return Currency(
        id: element.id,
        name: element.name,
        fullName: element.fullName,
        symbol: element.symbol,
        rateToUah: (element.name != 'BTC')
            ? element.rateToUah
            : element.rateToUah * _usdRate,
        countryCode: element.countryCode,
      );
    }).toList();
    return rebasedList;
  }

  static double _getUsdRate(List<Currency> list) {
    return list.firstWhere((element) => element.name == 'USD').rateToUah;
  }
}
