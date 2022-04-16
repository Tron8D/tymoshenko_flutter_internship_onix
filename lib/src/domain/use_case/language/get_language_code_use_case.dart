import 'package:flutter_intership_onix/src/data/source/local/preferences_management.dart';

class GetLanguageCodeUseCase {
  final PreferencesManagement preferencesManagement;

  GetLanguageCodeUseCase(this.preferencesManagement);

  Future<String?> call() async {
    return preferencesManagement.getLanguageCode();
  }
}
