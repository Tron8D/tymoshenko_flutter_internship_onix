import 'package:flutter_intership_onix/src/data/source/local/preferences_management.dart';

class SetUpdateIntervalUseCase {
  final PreferencesManagement preferencesManagement;

  SetUpdateIntervalUseCase(this.preferencesManagement);

  Future<void> call(String updateInterval) async {
    return preferencesManagement.setUpdateInterval(updateInterval);
  }
}
