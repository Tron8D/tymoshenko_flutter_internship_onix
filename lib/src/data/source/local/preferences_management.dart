import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesManagement {
  final String darkBox = 'dark';
  final String updateTimeBox = '_update_time';
  final String updateIntervalBox = '_update_interval';

  //Load and parse preferences from disk
  Future<SharedPreferences> getUserPref();

  //Theme preference control
  Future<void> setThemeInPref(bool dark);

  Future<bool?> getTheme();

  //Update time preference control
  Future<void> setUpdateTime(DateTime time);

  Future<DateTime?> getUpdateTime();

  //Update interval preference control
  Future<void> setUpdateInterval(String updateInterval);

  Future<String?> getUpdateInterval();

  //Clear preferences
  Future<void> clearPref();
}
