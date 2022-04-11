part of 'currencies_list_bloc.dart';

@immutable
abstract class CurrenciesListEvent {}

class LoadPref extends CurrenciesListEvent {}

class GetCurrenciesList extends CurrenciesListEvent {}

class SetUpdateInterval extends CurrenciesListEvent {
  final String updateInterval;

  SetUpdateInterval({required this.updateInterval});
}

class GetCurrencyForInfo extends CurrenciesListEvent {
  final int id;

  GetCurrencyForInfo({required this.id});
}
