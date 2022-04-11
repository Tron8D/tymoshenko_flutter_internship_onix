import 'package:flutter_intership_onix/data/models/local/currency.dart';
import 'package:flutter_intership_onix/data/remote/mappers/rebase_currency.dart';
import 'package:flutter_intership_onix/data/remote/response/currencies_source_response.dart';

class CurrencyDioMapper {
  static List<Currency> mapResponse(List<CurrencySourceResponse> response) {
    List<Currency> _currenciesList = response.map((remoteCurrency) {
      int id = response.indexOf(remoteCurrency);
      return Currency(
        id: id,
        rateToUah: double.tryParse(remoteCurrency.sale) ?? 0,
        name: remoteCurrency.ccy,
        fullName: _getFullName(remoteCurrency.ccy),
        symbol: _getSymbol(remoteCurrency.ccy),
        countryCode: _getCountryCode(remoteCurrency.ccy),
      );
    }).toList();
    _currenciesList.add(Currency(
      id: _currenciesList.length,
      rateToUah: 1,
      name: 'UAH',
      fullName: _getFullName('UAH'),
      symbol: _getSymbol('UAH'),
      countryCode: _getCountryCode('UAH'),
    ));
    return RebaseCurrency.rebase(_currenciesList);
  }

  static _getFullName(String currencyName) {
    switch (currencyName) {
      case 'USD':
        {
          return 'American Dollar';
        }
      case 'EUR':
        {
          return 'Euro';
        }
      case 'RUR':
        {
          return 'Russian Ruble';
        }
      case 'BTC':
        {
          return 'Bitcoin';
        }
      case 'UAH':
        {
          return 'Hryvnia';
        }
      default:
        {
          return '';
        }
    }
  }

  static _getSymbol(String currencyName) {
    switch (currencyName) {
      case 'USD':
        {
          return '\$';
        }
      case 'EUR':
        {
          return '€';
        }
      case 'RUR':
        {
          return '₽';
        }
      case 'BTC':
        {
          return '₿';
        }
      case 'UAH':
        {
          return '₴';
        }
      default:
        {
          return '';
        }
    }
  }

  static _getCountryCode(String currencyName) {
    switch (currencyName) {
      case 'USD':
        {
          return 'us';
        }
      case 'EUR':
        {
          return 'eu';
        }
      case 'RUR':
        {
          return 'ru';
        }
      case 'BTC':
        {
          return 'btc';
        }
      case 'UAH':
        {
          return 'ua';
        }
      default:
        {
          return '';
        }
    }
  }
}
