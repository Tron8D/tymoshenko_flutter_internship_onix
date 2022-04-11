import 'package:flutter/material.dart';

import 'package:flutter_intership_onix/data/models/local/converter.dart';
import 'package:flutter_intership_onix/data/source/local/preferences_management.dart';

class ConverterProvider extends ChangeNotifier {
  final PreferencesManagement _preferencesManagement = PreferencesManagement();
  Converter converter = Converter(topCardId: 0, bottomCardId: 1);
  TextEditingController topCardController = TextEditingController();
  TextEditingController bottomCardController = TextEditingController();

  ConverterProvider() {
    _loadFromPref();
  }

  //load card's id selected by the user
  void _loadFromPref() async {
    notifyListeners();
    converter.topCardId = await _preferencesManagement.getTopCardId() ?? 1;
    converter.bottomCardId =
        await _preferencesManagement.getBottomCardId() ?? 2;
    notifyListeners();
  }

  Future<void> switchCard() async {
    int _topCardId = converter.topCardId;
    int _bottomCardId = converter.bottomCardId;

    switchRates();

    await setTopCard(_bottomCardId);
    await setBottomCard(_topCardId);

    notifyListeners();
  }

  Future<void> setTopCard(int id) async {
    await _preferencesManagement.setTopCardId(id);
    converter.topCardId = id;
    convertValue(converter.inputValue ?? 0);
    notifyListeners();
  }

  Future<void> setBottomCard(int id) async {
    await _preferencesManagement.setBottomCardId(id);
    converter.bottomCardId = id;
    convertValue(converter.inputValue ?? 0);
    notifyListeners();
  }

  void convertValue(double value) {
    if (converter.topCardRate != 1.0) {
      converter.convertedValue =
          (value * converter.topCardRate) / converter.bottomCardRate;
    } else {
      converter.convertedValue = value / converter.bottomCardRate;
    }
    notifyListeners();
  }

  void switchRates() {
    double _tempRate = converter.topCardRate;
    converter.topCardRate = converter.bottomCardRate;
    converter.bottomCardRate = _tempRate;

    notifyListeners();
  }

  //this function will be called when text field changed
  void textFieldOnChanged(int indexTextFormField, String value) {
    double _parseValue;

    if (indexTextFormField == 0) {
      _parseValue = double.tryParse(value) ?? 0.0;

      if (_parseValue != converter.inputValue && value.isNotEmpty) {
        converter.inputValue = _parseValue;
        convertValue(_parseValue);
      }
    }
  }

  //initial text for TextFormField on ConverterScreen
  void initialText(int index) {
    if (index == 1) {
      bottomCardController.text = converter.convertedValue.toStringAsFixed(2);
    } else {
      if (converter.inputValue == 0) {
        topCardController.text = '0.00';
        topCardController.selection =
            TextSelection.fromPosition(const TextPosition(offset: 4));
      }
    }
  }
}
