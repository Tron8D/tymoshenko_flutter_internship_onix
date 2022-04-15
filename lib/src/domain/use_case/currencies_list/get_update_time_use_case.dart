import 'package:flutter_intership_onix/src/data/source/local/preferences_management.dart';

class GetUpdateTimeUseCase {
  final PreferencesManagement preferencesManagement;

  GetUpdateTimeUseCase(this.preferencesManagement);

  Future<DateTime?> call() async {
    return preferencesManagement.getUpdateTime();
  }
}
