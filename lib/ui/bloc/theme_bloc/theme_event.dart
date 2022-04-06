part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class LoadPref extends ThemeEvent {}

class ChangeTheme extends ThemeEvent {}
