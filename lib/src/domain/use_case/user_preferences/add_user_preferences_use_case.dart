import 'package:flutter_intership_onix/src/data/remote/user_preferences.dart';
import 'package:flutter_intership_onix/src/data/source/remote/preferences_database.dart';

class AddUserPreferencesUseCase {
  final PreferencesDatabase dataRepository;

  AddUserPreferencesUseCase(this.dataRepository);

  Future<void> call(String uid, UserPreferences userPreferences) async {
    dataRepository.addPreferences(uid, userPreferences);
  }
}
