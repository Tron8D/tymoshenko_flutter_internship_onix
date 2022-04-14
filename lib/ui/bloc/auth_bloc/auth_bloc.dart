import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<Authorization>(
        (event, emit) => _loginUser(emit, event.email, event.password));
    on<Registration>(
        (event, emit) => _registrationUser(emit, event.email, event.password));
    on<SignOut>((event, emit) => _signOut(emit));
  }

  void _loginUser(Emitter emit, String email, String password) async {
    emit(AuthLoading());

    try {
      final _credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      emit(AuthDone());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        add(Registration(email: email, password: password));
      } else if (e.code == 'wrong-password') {
        emit(AuthError(errorMassage: 'Wrong password provided for that user.'));
      } else {
        emit(AuthError(errorMassage: e.code));
      }
    }
  }

  void _registrationUser(Emitter emit, String email, String password) async {
    try {
      final _credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      add(Authorization(email: email, password: password));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthError(errorMassage: 'The password provided is too weak.'));
      } else {
        emit(AuthError(errorMassage: e.code));
      }
    } catch (e) {
      emit(AuthError(errorMassage: e.toString()));
    }
  }

  void _signOut(Emitter emit) async {
    await FirebaseAuth.instance.signOut();
    emit(AuthInitial());
  }
}
