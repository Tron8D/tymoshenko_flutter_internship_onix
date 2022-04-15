import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import 'package:flutter_intership_onix/src/domain/entity/currency.dart';
import 'package:flutter_intership_onix/src/domain/use_case/clear_preferences_use_case.dart';
import 'package:flutter_intership_onix/src/domain/use_case/currencies_list/get_currencies_list_use_case.dart';
import 'package:flutter_intership_onix/src/domain/use_case/currencies_list/get_update_interval_use_case.dart';
import 'package:flutter_intership_onix/src/domain/use_case/currencies_list/get_update_time_use_case.dart';
import 'package:flutter_intership_onix/src/domain/use_case/currencies_list/set_update_interval_use_case.dart';
import 'package:flutter_intership_onix/src/domain/use_case/currencies_list/set_update_time_use_case.dart';

part 'currencies_list_event.dart';
part 'currencies_list_state.dart';

class CurrenciesListBloc
    extends Bloc<CurrenciesListEvent, CurrenciesListState> {
  final GetCurrenciesListUseCase _getCurrenciesListUseCase =
      GetIt.I<GetCurrenciesListUseCase>();
  final GetUpdateTimeUseCase _getUpdateTimeUseCase =
      GetIt.I<GetUpdateTimeUseCase>();
  final GetUpdateIntervalUseCase _getUpdateIntervalUseCase =
      GetIt.I<GetUpdateIntervalUseCase>();
  final SetUpdateTimeUseCase _setUpdateTimeUseCase =
      GetIt.I<SetUpdateTimeUseCase>();
  final SetUpdateIntervalUseCase _setUpdateIntervalUseCase =
      GetIt.I<SetUpdateIntervalUseCase>();
  final ClearPreferencesUseCase _clearPreferencesUseCase =
      GetIt.I<ClearPreferencesUseCase>();

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
    _updateTime = await _getUpdateTimeUseCase();
    updateInterval = await _getUpdateIntervalUseCase();
  }

  void _getCurrenciesList(Emitter<CurrenciesListState> emit) async {
    emit(CurrenciesListLoading());
    var remoteCurrencyList =
        await _getCurrenciesListUseCase(_updateTime, updateInterval);

    if (remoteCurrencyList.errorMassage == null) {
      currenciesList = remoteCurrencyList.data;
      _updateTime = remoteCurrencyList.updateTime;
      await _setUpdateTimeUseCase(_updateTime!);

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
    _setUpdateIntervalUseCase(interval);
    emit(CurrenciesListLoaded(
        currencies: currenciesList,
        currencyFromId: currencyFromId,
        updateInterval: updateInterval));
  }

  void clearPref() {
    _clearPreferencesUseCase();
  }
}
