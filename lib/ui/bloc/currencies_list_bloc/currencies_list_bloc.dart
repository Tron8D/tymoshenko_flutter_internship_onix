import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_intership_onix/data/models/local/currency.dart';
import 'package:flutter_intership_onix/data/repository/currencies_repository.dart';
import 'package:flutter_intership_onix/data/source/local/preferences_management.dart';
import 'package:meta/meta.dart';

part 'currencies_list_event.dart';
part 'currencies_list_state.dart';

class CurrenciesListBloc
    extends Bloc<CurrenciesListEvent, CurrenciesListState> {
  final PreferencesManagement _preferencesManagement = PreferencesManagement();
  String? error;
  List<Currency> currenciesList = [];
  Currency currencyFromId = Currency(
      id: 0,
      name: 'name',
      fullName: 'fullName',
      symbol: 'symbol',
      rateToUah: 1,
      countryCode: 'countryCode');

  late DateTime? _updateTime;
  late String? updateInterval;

  CurrenciesListBloc() : super(CurrenciesListInitial()) {
    on<LoadPref>((event, emit) async {
      await _getPreference();
      return _getCurrenciesList(emit);
    });
    on<GetCurrenciesList>(
      (event, emit) => _getCurrenciesList(emit),
    );
    on<GetCurrencyForInfo>(
      (event, emit) => _getCurrencyForInfo(emit, event.id),
    );
    on<SetUpdateInterval>(
      (event, emit) => setUpdateInterval(emit, event.updateInterval),
    );

    add(LoadPref());
  }

  Future<void> _getPreference() async {
    _updateTime = await _preferencesManagement.getUpdateTime();
    updateInterval = await _preferencesManagement.getUpdateInterval();
  }

  void _getCurrenciesList(Emitter<CurrenciesListState> emit) async {
    emit(CurrenciesListLoading());
    var remoteCurrencyList = await CurrenciesRepository.getCurrenciesList(
        _updateTime, updateInterval);

    if (remoteCurrencyList.errorMassage == null) {
      currenciesList = remoteCurrencyList.data;
      _updateTime = remoteCurrencyList.updateTime;
      await _preferencesManagement.setUpdateTime(_updateTime!);

      currenciesList.isEmpty
          ? emit(CurrenciesListError(errorMassage: 'List empty.'))
          : emit(CurrenciesListLoaded(
              currencies: remoteCurrencyList.data,
              currencyFromId: currencyFromId,
              updateInterval: updateInterval,
            ));
    } else {
      error = remoteCurrencyList.errorMassage;
      currenciesList = remoteCurrencyList.data;
      emit(CurrenciesListError(errorMassage: error!));
    }
  }

  void _getCurrencyForInfo(Emitter<CurrenciesListState> emit, int id) {
    if (currenciesList.isNotEmpty) {
      currencyFromId =
          currenciesList.firstWhere((element) => (element.id == id));

      emit(CurrenciesListLoaded(
        currencies: currenciesList,
        currencyFromId: currencyFromId,
        updateInterval: updateInterval,
      ));
    } else {
      error = 'Error: No element';
      emit(CurrenciesListError(errorMassage: error!));
    }
  }

  void setUpdateInterval(Emitter emit, String interval) {
    updateInterval = interval;
    _preferencesManagement.setUpdateInterval(interval);
    emit(CurrenciesListLoaded(
        currencies: currenciesList,
        currencyFromId: currencyFromId,
        updateInterval: updateInterval));
  }

  void clearPref() {
    _preferencesManagement.clearPref();
  }
}
