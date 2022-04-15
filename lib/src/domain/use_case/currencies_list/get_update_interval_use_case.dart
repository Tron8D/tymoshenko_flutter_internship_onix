import 'package:flutter_intership_onix/src/data/source/local/preferences_management.dart';

class GetUpdateIntervalUseCase {
  final PreferencesManagement preferencesManagement;

  GetUpdateIntervalUseCase(this.preferencesManagement);

  Future<String?> call() async {
    return preferencesManagement.getUpdateInterval();
  }
}
