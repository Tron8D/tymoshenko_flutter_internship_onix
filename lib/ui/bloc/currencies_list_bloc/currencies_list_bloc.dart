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
  bool isLoading = true;
  String? error;
  List<Currency> currenciesList = [];
  late DateTime? _updateTime;
  late String? updateInterval;

  CurrenciesListBloc() : super(CurrenciesListInitial()) {
    on<LoadPref>((event, emit) async {
      await _getPreference();
      getCurrenciesList(emit);
    });
    on<GetCurrenciesList>((event, emit) => getCurrenciesList(emit));

    add(LoadPref());
    // add(GetCurrenciesList());
  }

  void getCurrenciesList(Emitter<CurrenciesListState> emit) async {
    emit(CurrenciesListLoading());
    print(_updateTime);
    print(updateInterval);
    var remoteCurrencyList = await CurrenciesRepository.getCurrenciesList(
        _updateTime, updateInterval);

    if (remoteCurrencyList.errorMassage == null) {
      currenciesList = remoteCurrencyList.data;
      _updateTime = remoteCurrencyList.updateTime;
      await _preferencesManagement.setUpdateTime(_updateTime!);
      emit(CurrenciesListLoaded(currencies: remoteCurrencyList.data));
    } else {
      error = remoteCurrencyList.errorMassage;
      currenciesList = remoteCurrencyList.data;
      emit(CurrenciesListError(errorMassage: error!));
    }
  }

  Currency getCurrencyFromId(Emitter<CurrenciesListState> emit, int id) {
    if (currenciesList.isNotEmpty) {
      return currenciesList.firstWhere((element) => (element.id == id));
    } else {
      error = 'Error: No element';
      // notifyListeners();

      return Currency(
          id: 0,
          name: 'name',
          fullName: 'fullName',
          symbol: 'symbol',
          rateToUah: 1,
          countryCode: 'countryCode');
    }
  }

  void _startProvider(Emitter<CurrenciesListState> emit) async {
    _getPreference().then((value) => getCurrenciesList(emit));
  }

  Future<void> _getPreference() async {
    _updateTime = await _preferencesManagement.getUpdateTime();
    print(_updateTime);
    updateInterval = await _preferencesManagement.getUpdateInterval();
    updateInterval ??= '15';
    print(updateInterval);
    // emit(CurrenciesListLoading());
  }

  void setUpdateInterval(String interval) {
    updateInterval = interval;
    _preferencesManagement.setUpdateInterval(interval);
  }
}
