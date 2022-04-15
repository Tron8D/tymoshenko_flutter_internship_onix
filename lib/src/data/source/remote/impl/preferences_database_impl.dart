import 'package:flutter_intership_onix/src/data/remote/user_preferences.dart';
import 'package:flutter_intership_onix/src/data/source/remote/preferences_database.dart';

class PreferencesDatabaseImpl extends PreferencesDatabase {
  @override
  Future<UserPreferences?> getPreferences(String uid) async {
    try {
      var _document = collection.doc(uid);
      var _preferenceObject = await _document.get();

      return UserPreferences.fromJson(_preferenceObject);
    } catch (e) {
      return null;
    }
  }

  @override
  void addPreferences(String uid, UserPreferences userPreferences) {
    collection.doc(uid).set(userPreferences.toJson());
  }

  @override
  void updatePreferences(String uid, UserPreferences userPreferences) async {
    await collection.doc(uid).update(userPreferences.toJson());
  }
}
