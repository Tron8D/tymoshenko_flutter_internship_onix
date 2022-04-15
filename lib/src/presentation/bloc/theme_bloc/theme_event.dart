part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class ThemeLoadPref extends ThemeEvent {}

class ThemePrefLoaded extends ThemeEvent {}

class ChangeTheme extends ThemeEvent {}
