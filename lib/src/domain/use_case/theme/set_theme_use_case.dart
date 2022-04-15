import 'package:flutter_intership_onix/src/data/source/local/preferences_management.dart';

class SetThemeUseCase {
  final PreferencesManagement preferencesManagement;

  SetThemeUseCase(this.preferencesManagement);

  Future<void> call(bool dark) async {
    preferencesManagement.setThemeInPref(dark);
  }
}
