part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeFirstLoaded extends ThemeState {}

class ThemeLoaded extends ThemeState {
  final bool isDark;

  ThemeLoaded({required this.isDark});
}
