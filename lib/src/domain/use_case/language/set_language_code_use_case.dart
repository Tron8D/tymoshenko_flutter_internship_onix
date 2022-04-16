import 'package:flutter_intership_onix/src/data/source/local/preferences_management.dart';

class SetLanguageCodeUseCase {
  final PreferencesManagement preferencesManagement;

  SetLanguageCodeUseCase(this.preferencesManagement);

  Future<void> call(String languageCode) async {
    return preferencesManagement.setLanguageCode(languageCode);
  }
}
