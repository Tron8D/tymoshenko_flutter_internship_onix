part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeFirstLoaded extends ThemeState {}

class ThemeChanged extends ThemeState {}
