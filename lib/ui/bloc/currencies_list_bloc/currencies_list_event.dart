part of 'currencies_list_bloc.dart';

@immutable
abstract class CurrenciesListEvent {}

class LoadPref extends CurrenciesListEvent {}

class GetCurrenciesList extends CurrenciesListEvent {}
