import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intership_onix/ui/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_intership_onix/ui/bloc/converter_bloc/converter_bloc.dart';

import 'package:flutter_intership_onix/ui/widgets/buttons/outlined_custom_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late AnimationController _animationController;
  late Animation<Offset> _animationMoveCard;
  late Animation<Offset> _animationMoveButton;
  late Tween<Offset> cardTween;
  late Tween<Offset> buttonTween;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    cardTween = Tween<Offset>(begin: const Offset(-1.1, 0), end: Offset.zero);
    buttonTween = Tween<Offset>(begin: const Offset(3, 0), end: Offset.zero);

    _animationMoveCard = cardTween.animate(CurvedAnimation(
        parent: _animationController, curve: Curves.elasticInOut))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          cardTween.begin = const Offset(1.1, 0);
        } else if (status == AnimationStatus.dismissed) {
          cardTween.begin = const Offset(-1.1, 0);
        }
      });
    _animationMoveButton = buttonTween.animate(CurvedAnimation(
        parent: _animationController, curve: Curves.elasticInOut))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          buttonTween.begin = const Offset(-3, 0);
        } else if (status == AnimationStatus.dismissed) {
          buttonTween.begin = const Offset(3, 0);
        }
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_animationController.isAnimating) {
      _animationController.forward();
    }
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (previous, current) => current is AuthDone,
      listener: (context, state) async {
        User? _currentUser = FirebaseAuth.instance.currentUser;
        context
            .read<ConverterBloc>()
            .add(ConverterLoadPref(uid: _currentUser!.uid));
        _animationController
            .reverse()
            .then((value) => Navigator.pushReplacementNamed(context, '/main'));
      },
      builder: (context, state) {
        String _buttonTitle;
        String _errorMassage = '';
        if (state is AuthInitial) {
          _buttonTitle = 'Login/Registration';
        } else if (state is AuthError) {
          _errorMassage = state.errorMassage;
          _buttonTitle = 'Login/Registration';
        } else if (state is AuthDone) {
          _buttonTitle = 'Success';
        } else {
          _buttonTitle = 'Waiting...';
        }
        return Scaffold(
          body: Center(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SlideTransition(
                      position: _animationMoveCard,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 20,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          height: 250,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Welcome!',
                                style: TextStyle(
                                    fontSize: 25,
                                    color:
                                        Theme.of(context).secondaryHeaderColor),
                              ),
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration:
                                    const InputDecoration(hintText: 'Email'),
                                style: TextStyle(
                                    fontSize: 25,
                                    color:
                                        Theme.of(context).secondaryHeaderColor),
                                textAlign: TextAlign.center,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Email';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: _passwordController,
                                keyboardType: TextInputType.text,
                                decoration:
                                    const InputDecoration(hintText: 'Password'),
                                style: TextStyle(
                                    fontSize: 25,
                                    color:
                                        Theme.of(context).secondaryHeaderColor),
                                textAlign: TextAlign.center,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Password';
                                  } else if (value.length < 6) {
                                    return 'Password minimum length 6 characters';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Text(
                      _errorMassage,
                      style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                    SlideTransition(
                      position: _animationMoveButton,
                      child: OutlinedCustomButton(
                        title: _buttonTitle,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(Authorization(
                                email: _emailController.text,
                                password: _passwordController.text));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
