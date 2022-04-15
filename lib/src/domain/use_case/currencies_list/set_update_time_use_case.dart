import 'package:flutter_intership_onix/src/data/source/local/preferences_management.dart';

class SetUpdateTimeUseCase {
  final PreferencesManagement preferencesManagement;

  SetUpdateTimeUseCase(this.preferencesManagement);

  Future<void> call(DateTime time) async {
    return preferencesManagement.setUpdateTime(time);
  }
}
