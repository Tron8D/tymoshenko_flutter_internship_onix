part of 'currencies_list_bloc.dart';

@immutable
abstract class CurrenciesListState {}

class CurrenciesListInitial extends CurrenciesListState {}

class CurrenciesListLoading extends CurrenciesListState {}

class CurrenciesListLoaded extends CurrenciesListState {
  final List<Currency> currencies;
  final Currency currencyFromId;
  final String? updateInterval;

  CurrenciesListLoaded({
    required this.currencies,
    required this.currencyFromId,
    required this.updateInterval,
  });
}

class CurrenciesListError extends CurrenciesListState {
  final String errorMassage;

  CurrenciesListError({required this.errorMassage});
}
