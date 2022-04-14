part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class Authorization extends AuthEvent {
  final String email;
  final String password;

  Authorization({required this.email, required this.password});
}

class Registration extends AuthEvent {
  final String email;
  final String password;

  Registration({required this.email, required this.password});
}

class SignOut extends AuthEvent {}
