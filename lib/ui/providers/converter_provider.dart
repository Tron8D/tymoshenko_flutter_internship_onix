import 'package:flutter/cupertino.dart';
import 'package:flutter_intership_onix/data/models/converter.dart';
import 'package:flutter_intership_onix/data/source/preferences_management.dart';

class ConverterProvider extends ChangeNotifier {
  // final CurrenciesRepository _currenciesRepository = CurrenciesRepository();
  final PreferencesManagement _preferencesManagement = PreferencesManagement();
  Converter converter = Converter(topCardId: 0, bottomCardId: 1);

  ConverterProvider() {
    _loadFromPref();
  }

  void _loadFromPref() async {
    notifyListeners();
    converter.topCardId = await _preferencesManagement.getTopCardId() ?? 0;
    converter.bottomCardId =
        await _preferencesManagement.getBottomCardId() ?? 1;
    notifyListeners();
  }

  Future<void> switchCard() async {
    int _topCardId = converter.topCardId;
    int _bottomCardId = converter.bottomCardId;

    await setTopCard(_bottomCardId);
    await setBottomCard(_topCardId);
    notifyListeners();
  }

  Future<void> setTopCard(int id) async {
    await _preferencesManagement.setTopCardId(id);
    converter.topCardId = id;
    notifyListeners();
  }

  Future<void> setBottomCard(int id) async {
    await _preferencesManagement.setBottomCardId(id);
    converter.bottomCardId = id;
    notifyListeners();
  }
}
