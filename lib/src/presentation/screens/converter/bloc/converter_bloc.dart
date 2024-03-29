import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter_intership_onix/src/data/remote/user_preferences.dart';
import 'package:flutter_intership_onix/src/domain/entity/converter.dart';
import 'package:flutter_intership_onix/src/domain/use_case/user_preferences/add_user_preferences_use_case.dart';
import 'package:flutter_intership_onix/src/domain/use_case/user_preferences/get_user_preferences_use_case.dart';
import 'package:flutter_intership_onix/src/domain/use_case/user_preferences/update_user_preferences_use_case.dart';

part 'converter_event.dart';
part 'converter_state.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  final GetUserPreferencesUseCase _getUserPreferencesUseCase =
      GetIt.I<GetUserPreferencesUseCase>();
  final AddUserPreferencesUseCase _addUserPreferencesUseCase =
      GetIt.I<AddUserPreferencesUseCase>();
  final UpdateUserPreferencesUseCase _updateUserPreferencesUseCase =
      GetIt.I<UpdateUserPreferencesUseCase>();
  late String uid;
  Converter converter = Converter(topCardId: 0, bottomCardId: 1);

  TextEditingController topCardController = TextEditingController();
  TextEditingController bottomCardController = TextEditingController();

  ConverterBloc() : super(ConverterInitial()) {
    on<ConverterLoadPref>((event, emit) => _loadFromPref(emit, event));
    on<SwitchCards>((event, emit) => _switchCards(emit));
    on<SetCardId>((event, emit) => _setCardId(emit, event.cardIndex, event.id));
    on<SetRates>((event, emit) => _setRates(emit, event.cardIndex, event.rate));
    on<ChangeFormField>((event, emit) =>
        _textFieldOnChanged(emit, event.indexTextFormField, event.value));
  }

  //load card's id selected by the user
  void _loadFromPref(Emitter emit, ConverterLoadPref event) async {
    uid = event.uid;
    UserPreferences? userPreferences = await _getUserPreferencesUseCase(uid);

    if (userPreferences == null) {
      converter.topCardId = 0;
      converter.bottomCardId = 1;

      _addUserPreferencesUseCase(
          uid,
          UserPreferences(
              topCard: converter.topCardId,
              bottomCard: converter.bottomCardId));
    } else {
      converter.topCardId = userPreferences.topCard;
      converter.bottomCardId = userPreferences.bottomCard;
    }

    _defaultText();

    emit(ConverterLoaded(converter, topCardController, bottomCardController));
  }

  Future<void> _switchCards(Emitter emit) async {
    int _topCardId = converter.topCardId;
    int _bottomCardId = converter.bottomCardId;

    _switchRates();
    await _setTopCard(_bottomCardId);
    await _setBottomCard(_topCardId);

    _updateUserPreferencesUseCase(
        uid,
        UserPreferences(
          topCard: converter.topCardId,
          bottomCard: converter.bottomCardId,
        ));
    _convertValue(converter.inputValue ?? 0);
    bottomCardController.text = converter.convertedValue.toStringAsFixed(2);

    emit(ConverterLoaded(converter, topCardController, bottomCardController));
  }

  void _setCardId(Emitter emit, int cardIndex, int id) {
    cardIndex == 0 ? _setTopCard(id) : _setBottomCard(id);
    _updateUserPreferencesUseCase(
        uid,
        UserPreferences(
          topCard: converter.topCardId,
          bottomCard: converter.bottomCardId,
        ));

    emit(ConverterLoaded(converter, topCardController, bottomCardController));
  }

  Future<void> _setTopCard(int id) async {
    converter.topCardId = id;
    _convertValue(converter.inputValue ?? 0);
  }

  Future<void> _setBottomCard(int id) async {
    converter.bottomCardId = id;
    _convertValue(converter.inputValue ?? 0);
  }

  void _convertValue(double value) {
    if (converter.topCardRate != 1.0) {
      converter.convertedValue =
          (value * converter.topCardRate) / converter.bottomCardRate;
    } else {
      converter.convertedValue = value / converter.bottomCardRate;
    }
  }

  void _setRates(Emitter emit, int cardIndex, double rate) {
    if (cardIndex == 0 && converter.topCardRate != rate) {
      converter.topCardRate = rate;
      _convertValue(converter.inputValue ?? 0);
      bottomCardController.text = converter.convertedValue.toStringAsFixed(2);

      emit(ConverterLoaded(converter, topCardController, bottomCardController));
    } else if (cardIndex == 1 && converter.bottomCardRate != rate) {
      converter.bottomCardRate = rate;
      _convertValue(converter.inputValue ?? 0);
      bottomCardController.text = converter.convertedValue.toStringAsFixed(2);

      emit(ConverterLoaded(converter, topCardController, bottomCardController));
    }
  }

  void _switchRates() {
    double _tempRate = converter.topCardRate;
    converter.topCardRate = converter.bottomCardRate;
    converter.bottomCardRate = _tempRate;
  }

  //this function will be called when text field changed
  void _textFieldOnChanged(Emitter emit, int indexTextFormField, String value) {
    double _parseValue;

    if (indexTextFormField == 0) {
      _parseValue = double.tryParse(value) ?? 0.0;

      if (_parseValue != converter.inputValue && value.isNotEmpty) {
        converter.inputValue = _parseValue;
        _convertValue(_parseValue);
      }
    }
    bottomCardController.text = converter.convertedValue.toStringAsFixed(2);
    emit(ConverterLoaded(converter, topCardController, bottomCardController));
  }

  void _defaultText() {
    if (converter.inputValue == null) {
      converter.inputValue = 0.00;
      topCardController.text = '0.00';
      bottomCardController.text = '0.00';
      topCardController.selection =
          TextSelection.fromPosition(const TextPosition(offset: 4));
    }
  }
}
