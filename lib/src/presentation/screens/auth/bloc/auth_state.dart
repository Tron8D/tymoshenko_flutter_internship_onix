part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthDone extends AuthState {}

class AuthError extends AuthState {
  final String errorMassage;

  AuthError({required this.errorMassage});
}
