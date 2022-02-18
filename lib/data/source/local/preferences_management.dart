import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManagement {
  final String _topCardId = 'top_card_Id';
  final String _bottomCardId = 'bottom_card_Id';
  final String _dark = 'dark';
  final String _updateTime = '_update_time';

  //Load and parse preferences from disk
  Future<SharedPreferences> _getUserPref() async {
    return await SharedPreferences.getInstance();
  }

  //Top card preference control
  Future<void> setTopCardId(int id) async {
    SharedPreferences _preferences = await _getUserPref();
    _preferences.setInt(_topCardId, id);
  }

  Future<int?> getTopCardId() async {
    SharedPreferences _preferences = await _getUserPref();
    return _preferences.getInt(_topCardId);
  }

  //Bottom card preference control
  Future<void> setBottomCardId(int id) async {
    SharedPreferences _preferences = await _getUserPref();
    _preferences.setInt(_bottomCardId, id);
  }

  Future<int?> getBottomCardId() async {
    SharedPreferences _preferences = await _getUserPref();
    return _preferences.getInt(_bottomCardId);
  }

  //Theme preference control
  Future<void> setThemeInPref(bool dark) async {
    SharedPreferences _preferences = await _getUserPref();
    _preferences.setBool(_dark, dark);
  }

  Future<bool?> getTheme() async {
    SharedPreferences _preferences = await _getUserPref();
    return _preferences.getBool(_dark);
  }

  Future<void> setUpdateTime() async {
    SharedPreferences _preferences = await _getUserPref();
    String _time = DateTime.now().toIso8601String();
    _preferences.setString(_updateTime, _time);
  }

  //Clear preferences
  Future<void> clearPref() async {
    SharedPreferences _preferences = await _getUserPref();
    await _preferences.clear();
  }
}
