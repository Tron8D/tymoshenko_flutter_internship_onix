import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter_intership_onix/src/domain/use_case/theme/get_theme_use_case.dart';
import 'package:flutter_intership_onix/src/domain/use_case/theme/set_theme_use_case.dart';
import 'package:flutter_intership_onix/src/presentation/style/themes/dark_theme_data.dart';
import 'package:flutter_intership_onix/src/presentation/style/themes/light_theme_data.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final GetThemeUseCase _getThemeUseCase = GetIt.I<GetThemeUseCase>();
  final SetThemeUseCase _setThemeUseCase = GetIt.I<SetThemeUseCase>();
  bool isDark = false;

  ThemeData lightTheme = lightThemeData();
  ThemeData darkTheme = darkThemeData();

  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeLoadPref>((event, emit) => _loadFromPref(emit));
    on<ThemePrefLoaded>((event, emit) => _themePrefLoaded(emit));
    on<ChangeTheme>((event, emit) => _changeThemeData(emit));

    add(ThemeLoadPref());
  }

  void _loadFromPref(Emitter<ThemeState> emit) async {
    bool? _isDarkPref;
    try {
      _isDarkPref = await _getThemeUseCase();
      _isDarkPref ??= isDark;
    } catch (_) {
      _setThemeUseCase(isDark);
      _isDarkPref = isDark;
    }
    if (_isDarkPref != isDark) {
      isDark = _isDarkPref;
    }
    emit(ThemeFirstLoaded());
  }

  void _themePrefLoaded(Emitter emit) {
    emit(ThemeLoaded(isDark: isDark));
  }

  void _changeThemeData(Emitter<ThemeState> emit) {
    isDark = !isDark;
    _setThemeUseCase(isDark);
    emit(ThemeLoaded(isDark: isDark));
  }
}
