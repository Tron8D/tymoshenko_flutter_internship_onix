import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter_intership_onix/src/domain/use_case/language/get_language_code_use_case.dart';
import 'package:flutter_intership_onix/src/domain/use_case/language/set_language_code_use_case.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final GetLanguageCodeUseCase _getLanguageCodeUseCase =
      GetIt.I<GetLanguageCodeUseCase>();
  final SetLanguageCodeUseCase _setLanguageCodeUseCase =
      GetIt.I<SetLanguageCodeUseCase>();
  LanguageCubit() : super(LanguageState());

  void changeLanguage(String languageCode) {
    _setLanguageCodeUseCase(languageCode);
    emit(LanguageState(languageCode: languageCode));
  }

  void loadPref() async {
    String? languageCode = await _getLanguageCodeUseCase();
    emit(LanguageState(languageCode: languageCode ?? 'en'));
  }
}
