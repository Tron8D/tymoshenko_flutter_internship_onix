import 'package:flutter_intership_onix/src/data/remote/user_preferences.dart';
import 'package:flutter_intership_onix/src/data/source/remote/preferences_database.dart';

class GetUserPreferencesUseCase {
  final PreferencesDatabase dataRepository;

  GetUserPreferencesUseCase(this.dataRepository);

  Future<UserPreferences?> call(String uid) async {
    return dataRepository.getPreferences(uid);
  }
}
