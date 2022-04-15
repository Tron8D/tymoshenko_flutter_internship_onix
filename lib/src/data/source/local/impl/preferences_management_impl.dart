import 'package:flutter_intership_onix/src/data/source/local/preferences_management.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManagementImpl extends PreferencesManagement {
  @override
  Future<SharedPreferences> getUserPref() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<void> setThemeInPref(bool dark) async {
    SharedPreferences _preferences = await getUserPref();
    _preferences.setBool(darkBox, dark);
  }

  @override
  Future<bool?> getTheme() async {
    SharedPreferences _preferences = await getUserPref();
    return _preferences.getBool(darkBox);
  }

  @override
  Future<void> setUpdateTime(DateTime time) async {
    SharedPreferences _preferences = await getUserPref();
    String _timeString = time.toIso8601String();
    _preferences.setString(updateTimeBox, _timeString);
  }

  @override
  Future<DateTime?> getUpdateTime() async {
    SharedPreferences _preferences = await getUserPref();
    String? _lastUpdateString = _preferences.getString(updateTimeBox);

    if (_lastUpdateString == null) {
      return null;
    } else {
      DateTime? _lastUpdate = DateTime.tryParse(_lastUpdateString);
      return _lastUpdate;
    }
  }

  @override
  Future<void> setUpdateInterval(String updateInterval) async {
    SharedPreferences _preferences = await getUserPref();
    _preferences.setString(updateIntervalBox, updateInterval);
  }

  @override
  Future<String?> getUpdateInterval() async {
    SharedPreferences _preferences = await getUserPref();
    return _preferences.getString(updateIntervalBox);
  }

  @override
  Future<void> clearPref() async {
    SharedPreferences _preferences = await getUserPref();
    await _preferences.clear();
  }
}
