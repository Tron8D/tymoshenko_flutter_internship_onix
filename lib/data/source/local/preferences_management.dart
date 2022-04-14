import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManagement {
  final String _dark = 'dark';
  final String _updateTime = '_update_time';
  final String _updateInterval = '_update_interval';

  //Load and parse preferences from disk
  Future<SharedPreferences> _getUserPref() async {
    return await SharedPreferences.getInstance();
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

  //Update time preference control
  Future<void> setUpdateTime(DateTime time) async {
    SharedPreferences _preferences = await _getUserPref();
    String _timeString = time.toIso8601String();
    _preferences.setString(_updateTime, _timeString);
  }

  Future<DateTime?> getUpdateTime() async {
    SharedPreferences _preferences = await _getUserPref();
    String? _lastUpdateString = _preferences.getString(_updateTime);

    if (_lastUpdateString == null) {
      return null;
    } else {
      DateTime? _lastUpdate = DateTime.tryParse(_lastUpdateString);
      return _lastUpdate;
    }
  }

  //Update interval preference control
  Future<void> setUpdateInterval(String updateInterval) async {
    SharedPreferences _preferences = await _getUserPref();
    _preferences.setString(_updateInterval, updateInterval);
  }

  Future<String?> getUpdateInterval() async {
    SharedPreferences _preferences = await _getUserPref();
    return _preferences.getString(_updateInterval);
  }

  //Clear preferences
  Future<void> clearPref() async {
    SharedPreferences _preferences = await _getUserPref();
    await _preferences.clear();
  }
}
