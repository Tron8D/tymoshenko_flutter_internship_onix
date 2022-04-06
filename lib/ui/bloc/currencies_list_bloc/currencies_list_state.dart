part of 'currencies_list_bloc.dart';

@immutable
abstract class CurrenciesListState {}

class CurrenciesListInitial extends CurrenciesListState {}

class CurrenciesListLoading extends CurrenciesListState {}

class CurrenciesListLoaded extends CurrenciesListState {
  final List<Currency> currencies;

  CurrenciesListLoaded({required this.currencies});
}

class CurrenciesListError extends CurrenciesListState {
  final String errorMassage;

  CurrenciesListError({required this.errorMassage});
}
