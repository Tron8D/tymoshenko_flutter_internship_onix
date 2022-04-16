import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_intership_onix/src/presentation/screens/auth/bloc/auth_bloc.dart';
import 'package:flutter_intership_onix/src/presentation/screens/converter/bloc/converter_bloc.dart';

import 'package:flutter_intership_onix/src/presentation/widgets/buttons/outlined_custom_button.dart';
import 'package:flutter_intership_onix/src/utils/localization/localization.dart';

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
    buttonTween = Tween<Offset>(begin: const Offset(4, 0), end: Offset.zero);

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
          buttonTween.begin = const Offset(-4, 0);
        } else if (status == AnimationStatus.dismissed) {
          buttonTween.begin = const Offset(4, 0);
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
          _buttonTitle = lang(context).authButton;
        } else if (state is AuthError) {
          _errorMassage = state.errorMassage;
          _buttonTitle = lang(context).authButton;
        } else if (state is AuthDone) {
          _buttonTitle = lang(context).authDoneButton;
        } else {
          _buttonTitle = lang(context).authLoadingButton;
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
                                lang(context).greetings,
                                style: TextStyle(
                                    fontSize: 25,
                                    color:
                                        Theme.of(context).secondaryHeaderColor),
                              ),
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    hintText: lang(context).emailField),
                                style: TextStyle(
                                    fontSize: 25,
                                    color:
                                        Theme.of(context).secondaryHeaderColor),
                                textAlign: TextAlign.center,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return lang(context).errEmailField;
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: _passwordController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: lang(context).passwordField),
                                style: TextStyle(
                                    fontSize: 25,
                                    color:
                                        Theme.of(context).secondaryHeaderColor),
                                textAlign: TextAlign.center,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return lang(context).errEmptyPasswordField;
                                  } else if (value.length < 6) {
                                    return lang(context)
                                        .errSecurityPasswordField;
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
