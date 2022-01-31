import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManagement {
  final String _topCardId = 'top_card_Id';
  final String _bottomCardId = 'bottom_card_Id';
  final String _dark = 'dark';

  //Load and parse preferences from disk
  Future<SharedPreferences> _getUserPref() async {
    return await SharedPreferences.getInstance();
  }

  //Top card preference control
  Future<void> setTopCardId(int id) async {
    SharedPreferences preferences = await _getUserPref();
    preferences.setInt(_topCardId, id);
  }

  Future<int?> getTopCardId() async {
    SharedPreferences preferences = await _getUserPref();
    return preferences.getInt(_topCardId);
  }

  //Bottom card preference control
  Future<void> setBottomCardId(int id) async {
    SharedPreferences preferences = await _getUserPref();
    preferences.setInt(_bottomCardId, id);
  }

  Future<int?> getBottomCardId() async {
    SharedPreferences preferences = await _getUserPref();
    return preferences.getInt(_bottomCardId);
  }

  //Theme preference control
  Future<void> setThemeInPref(bool dark) async {
    SharedPreferences preferences = await _getUserPref();
    preferences.setBool(_dark, dark);
  }

  Future<bool?> getTheme() async {
    SharedPreferences preferences = await _getUserPref();
    return preferences.getBool(_dark);
  }

  //Clear preferences
  Future<void> clearPref() async {
    SharedPreferences preferences = await _getUserPref();
    await preferences.clear();
  }
}
