import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManagement {
  final String _topCardId = 'top_card_Id';
  final String _bottomCardId = 'bottom_card_Id';
  final String _dark = 'dark';

  Future<SharedPreferences> _getUserPref() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> setTopCardId(int id) async {
    SharedPreferences preferences = await _getUserPref();
    preferences.setInt(_topCardId, id);
  }

  Future<void> setBottomCardId(int id) async {
    SharedPreferences preferences = await _getUserPref();
    preferences.setInt(_bottomCardId, id);
  }

  Future<void> setTheme(bool dark) async {
    SharedPreferences preferences = await _getUserPref();
    preferences.setBool(_dark, dark);
  }

  Future<int?> getTopCardId() async {
    SharedPreferences preferences = await _getUserPref();
    return preferences.getInt(_topCardId);
  }

  Future<int?> getBottomCardId() async {
    SharedPreferences preferences = await _getUserPref();
    return preferences.getInt(_bottomCardId);
  }

  Future<bool?> getTheme() async {
    SharedPreferences preferences = await _getUserPref();
    return preferences.getBool(_dark);
  }
}
