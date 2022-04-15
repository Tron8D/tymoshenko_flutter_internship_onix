import 'package:flutter_intership_onix/src/data/source/local/preferences_management.dart';

class GetThemeUseCase {
  final PreferencesManagement preferencesManagement;

  GetThemeUseCase(this.preferencesManagement);

  Future<bool?> call() async {
    return preferencesManagement.getTheme();
  }
}
