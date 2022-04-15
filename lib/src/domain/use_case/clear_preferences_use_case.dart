import 'package:flutter_intership_onix/src/data/source/local/preferences_management.dart';

class ClearPreferencesUseCase {
  final PreferencesManagement preferencesManagement;

  ClearPreferencesUseCase(this.preferencesManagement);

  Future<void> call() async {
    preferencesManagement.clearPref();
  }
}
